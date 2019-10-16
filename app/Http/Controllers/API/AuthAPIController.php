<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\AppBaseController;
use App\Http\Requests\API\CreateUserAPIRequest;
use App\Http\Requests\API\UpdateUserAPIRequest;
use App\Repositories\UserRepository;
use App\User;
use App\Post;
use App\Push;

use App\Mail\MailAdmin;
use App\Mail\ConfirmEmail;

use Illuminate\Http\Request;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use InfyOm\Generator\Utils\ResponseUtil;
use Prettus\Repository\Criteria\RequestCriteria;
use Response;
use Validator;
use DB;
use Auth;
use File;
use Config;
use Flash;
use Flavy;
use Mail;
use App\Setting;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Storage;
use SebastianBergmann\Environment\Console;
use Cmgmyr\Messenger\Models\Message;
use Cmgmyr\Messenger\Models\Participant;
use Cmgmyr\Messenger\Models\Thread;

use App\MailSender;

use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

/**
 * Class UserController.
 */
class AuthAPIController extends AppBaseController
{
    /** @var UserRepository */
    private $userRepository;

    public function __construct(UserRepository $userRepo)
    {
        $this->userRepository = $userRepo;
    }

    /**
     * API for User login
     * 
     */
    public function login(Request $request)
    {
        $data = $request->all();
        $user = '';
        // $remember = ($request->remember ? true : false);

        if (filter_var(($request->email), FILTER_VALIDATE_EMAIL)  == true) {
            $user = DB::table('users')->where('email', $request->email)->first();
            if($user==''){
                return response()->json(['error' => 'invalid_credentials'], 401);
            }
        }

        if (Setting::get('mail_verification') != 'off' && $user->email_verified != 1) {
            return response()->json(['error' => trans('messages.verify_mail')], 403);
        }

        $credentials = $request->only('email', 'password');

        try {
            if (! $token = JWTAuth::attempt($credentials)) {
                return response()->json(['error' => 'invalid_credential'], 401);
            }
        } catch (JWTException $e) {
            return response()->json(['error' => 'could_not_create_token'], 500);
        }

        return response()->json(compact('token'));
    }

    /**
     * API for checking Authenticated
     */
    public function check(Request $request)
    {
        try {
            JWTAuth::parseToken()->authenticate();
        } catch (JWTException $e) {
            return response(['authenticated' => false]);
        }
        return response(['authenticated' => true]);
    }

    /**
     * API for logout
     */

    public function logout(Request $request)
    {
        try {
            $token = JWTAuth::getToken();

            if ($token) {
                JWTAuth::invalidate($token);
            }

        } catch (JWTException $e) {
            return response()->json($e->getMessage(), 401);
        }
        return response()->json(['message' => 'Log out success'], 200);
    }

    public function emailExist(Request $request){
        $user = DB::table('users')->where('email', $request->email)->first();
        if($user){
            return response(['isExist' => true]);
        }
        return response(['isExist' => false]);
    }

    public function register(Request $request)
    {

        if(Setting::get('mail_verification') == 'off')
        {
            $mail_verification = 1;
        }
        else
        {
            $mail_verification = null;
        }

        //Create user record
        $user = User::create([
            'firstName'         => $request->firstName,
            'lastName'          => $request->lastName,
            'displayName'       => $request->displayName,
            'email'             => $request->email,
            'password'          => bcrypt($request->password),
            'verification_code' => str_random(30),
            'timeline_id' => 1,
            'remember_token'    => str_random(30),
            'email_verified'    => $mail_verification
        ]);

        if (Setting::get('mail_verification') == 'on') {
            $chk = 'on';
            Mail::send('emails.welcome', ['user' => $user], function ($m) use ($user) {
                $m->from(Setting::get('noreply_email'), Setting::get('site_name'));

                $m->to($user->email, $user->name)->subject('Welcome to '.Setting::get('site_name'));
            });

            return response()->json(['message' => trans('auth.verify_email')], 403);
        }

        $credentials = $request->only('email', 'password');
        try {
            if (! $token = JWTAuth::attempt($credentials)) {
                return response()->json(['error' => 'invalid_credential'], 401);
            }
        } catch (JWTException $e) {
            return response()->json(['error' => 'could_not_create_token'], 500);
        }

        return response()->json(compact('token'));
    }

//     //Add email to mailchimp list
//     public function addEmailToList($email)
//     {
//         try {
//             $this->mailchimp
//                 ->lists
//                 ->subscribe(
//                     $this->listId,
//                     ['email' => $email]
//                 );
//             return 1;
//         } catch (\Mailchimp_List_AlreadySubscribed $e) {
//             return 0;
//         } catch (\Mailchimp_Error $e) {
//             return -1;
//         }
//     }

//     public function send_email($receiver, $verify_code, $id){
//         $subject = "Welcome To Register";
//         $req['message'] = "<html><body><a href=\'http://localhost/admin/email_verify/".$id."/".$verify_code."\'>Click here for verification</a></body></html>";
//         try {
//             $options = [
//                 'list_id'   => $this->listId,
//                 'subject' => $subject,
//                 'from_name' => $this->sender_name,
//                 'from_email' => $this->sender_email,
//                 'to_name' => $receiver
//             ];
//             $content = [
//                 'html' => $req['message'],
//                 'text' => strip_tags($req['message'])
//             ];
//             $campaign = $this->mailchimp->campaigns->create('regular', $options, $content);
//             $this->mailchimp->campaigns->send($campaign['id']);
//             return redirect()->back()->with('success','send campaign successfully');
//         } catch (Exception $e) {
//             return redirect()->back()->with('error','Error from MailChimp');
//         }
//     }

//     public function email_test(){
//         $result = MailSender::sendPasswordchange("snhealth923@gmail.com");

//         if($result)
//         {
//             $status = 200;
//             $message = "Confirm code sent to your email. Please check mailbox.";
//         }else{
//             $status = 201;
//             $message = "Some error occured. Please check your email is valid or not.";
//         }

//         return response()->json(['status' => $status, 'message' => $message]);
//     }

//     public function sendPasschangeEmail(Request $request)
//     {
//         $email = $request->email;

//         $u_cond['email'] = $email;
//         $users_number = User::where($u_cond)->count();
//         if($users_number == 1)
//         {
//             $result = MailSender::sendPasswordchange($email);
//             if($result)
//             {
//                 $status = 200;
//                 $message = "Confirm code sent to your email. Please check mailbox.";
//             }else{
//                 $status = 201;
//                 $message = "Some error occured. Please check your email is valid or not.";
//             }
//         }else{
//             $status = 201;
//             $message = "Your email does not exist. Please check your email is valid or not.";
//         }    
//         return response()->json(['status' => $status, 'message' => $message]);
//     }    

//     public function confirmPasswordcode(Request $request)
//     {
//         $cond['passcode'] = $request->passcode;
//         $cond['email'] = $request->email;
//         $users_number = User::where($cond)->count();
//         if($users_number == 1)
//         {
//             return response()->json(['status' => '200', 'message' => "Passcode is valid"]);
//         }else{
//             return response()->json(['status' => '201', 'message' => "Passcode is invalid"]);
//         }
//     }

//     public function changePassword(Request $request)
//     {
//         $password= $request->password;
//         $cond['email'] = $request->email;
//         $users_number = User::where($cond)->count();
//         if($users_number == 1)
//         {
//             $user = User::where($cond)->first();
//             $user->passcode = 0;
//             $user->password = bcrypt($password);
//             $user->update();
//             return response()->json(['status' => '200', 'message' => "Password changed successfully!"]);
//         }else{
//             return response()->json(['status' => '201', 'message' => "Email is not valid"]);
//         }
//     }



//     protected function validator(array $data, $captcha = null)
//     {
//         $messages = [
//             'no_admin' => 'The name admin is restricted for :attribute'
//         ];
//         $rules = [
//             'fullname'      => 'required|max:255',
//             'username'  => 'required|max:25|min:5|alpha_num|unique:users|no_admin',
//             'email'     => 'required|email|max:255|unique:users',
//             'password'  => 'required|min:6',
//             'phonenumber' => 'required:digit',
//         ];

//         if ($captcha) {
//             $messages = ['g-recaptcha-response.required' => trans('messages.captcha_required')];
//             $rules['g-recaptcha-response'] = 'required';
//         }

//         return Validator::make($data, $rules, $messages);
//     }

//     protected function registValidator(array $data, $captcha = null)
//     {
//         $messages = [
//             'no_admin' => 'The name admin is restricted for :attribute'
//         ];
//         $rules = [
//             'email'     => 'required|email|max:255|unique:users',
//             'password'  => 'required|min:6',
//         ];

//         if ($captcha) {
//             $messages = ['g-recaptcha-response.required' => trans('messages.captcha_required')];
//             $rules['g-recaptcha-response'] = 'required';
//         }
//         return Validator::make($data, $rules, $messages);
//     }
    

//     protected function register(Request $request, $socialLogin = false)
//     {
//         // return response()->json(['status' => '201', 'message' => 'Success']);
//         if (Setting::get('captcha') == 'on' && !$socialLogin) {
//             $regValidator = $this->registValidator($request->all(), true);
//         } else {
//             $regValidator = $this->registValidator($request->all());
//         }

//         if ($regValidator->fails()) {
//             return response()->json(['status' => '201', 'message' => $regValidator->errors()->toArray()]);
//         }

//         if(Setting::get('mail_verification') == 'off')
//         {
//             $mail_verification = 1;
//         }
//         else
//         {
//             $mail_verification = null;
//         }

//         //Create user record
//         $user = User::create([
//             'email'             => $request->email,
//             'password'          => bcrypt($request->password),
//             'verification_code' => str_random(30),
//             'timeline_id' => 1,
//             'remember_token'    => str_random(30),
//             'email_verified'    => $mail_verification
//         ]);
        
//         //Add email to mail list
//         // $this->addEmailToList($request->email);

//         //saving default settings to user settings
//         $user_settings = [
//             'user_id'               => $user->id,
//             'confirm_follow'        => Setting::get('confirm_follow'),
//             'follow_privacy'        => Setting::get('follow_privacy'),
//             'comment_privacy'       => Setting::get('comment_privacy'),
//             'timeline_post_privacy' => Setting::get('user_timeline_post_privacy'),
//             'post_privacy'          => Setting::get('post_privacy'),
//             'message_privacy'       => Setting::get('user_message_privacy'), ];

//         //Create a record in user settings table.
//         $userSettings = DB::table('user_settings')->insert($user_settings);

//         if ($user) {
//             if ($socialLogin) {
//                 return "124";
//             } else {
//                 $chk = '';
//                 if (Setting::get('mail_verification') == 'on') {
//                     $chk = 'on';
//                     Mail::send('emails.welcome', ['user' => $user], function ($m) use ($user) {
//                         $m->from(Setting::get('noreply_email'), Setting::get('site_name'));

//                         $m->to($user->email, $user->name)->subject('Welcome to '.Setting::get('site_name'));
//                     });
//                 }

//                 return response()->json(['status' => '200', 'message' => trans('auth.verify_email'), 'emailnotify' => $chk]);
//             }
//         }
//     }

//     public function social_login(Request $request)
//     {
//         $email = $request->email;
//         $password = $request->password;
//         $deviceToken = '';
//         if($request->deviceToken){
//             $deviceToken = $request->deviceToken;
//         }

//         $photo = '';
//         if($request->photo)
//         {
//             $photo = $request->photo;
//         }
//         // $photo = $request -> $photo;
    
//         $mail_verification = 1;
//          $displayName = '';
//          if($request->displayName){
//             $displayName = $request->displayName;
//          }

//         $user = DB::table('users')->where('email', $email)->first();
//         if($user){
//             $loginUser = User::where('email', $email)->where('password', $password)->first();
//             if($loginUser){
//                 $token = str_random(30);
//                 $loginUser->remember_token = $token;
//                 $loginUser->save();
//                 $userinfo = [
//                     'id' => $loginUser->id,
//                     'devideToken' => $loginUser->deviceToken,
//                     'averageRate' => $loginUser->avg_rating,
//                     'bio' => $loginUser->bio,
//                     'displayName' => $loginUser->displayName,
//                     'email' => $loginUser->email,
//                     'firstName' => $loginUser->firstName,
//                     'lastName' => $loginUser->lastName,
//                     'location' => $loginUser->location,
//                     'photoURL' => $loginUser->photo,
//                     'website' => $loginUser->website,
//                     'creativeField' => $loginUser->creative_field,
//                     'token' => $token,
//                 ];
//                 return response()->json(['status' => '200', 'message' => trans('auth.login_success'), 'userInfo' => $userinfo]);

//             }else{
//                 return response()->json(['status' => '201', 'message' => trans('auth.login_fail')]);
//             }
//         }else{
//             $user = User::create([
//                 'email'             => $email,
//                 'password'          =>$password,
//                 'verification_code' => str_random(30),
//                 'timeline_id' => 1,
//                 'remember_token'    => str_random(30),
//                 'email_verified'    => $mail_verification,
//                 'deviceToken' => $deviceToken,
//                 'photoURL' => $photo
//             ]);
//             $userinfo = [
//                 'id' => $user->id,
//                 'devideToken' => $user->deviceToken,
//                 'averageRate' => $user->avg_rating,
//                 'bio' => $user->bio,
//                 'displayName' => $user->displayName,
//                 'email' => $user->email,
//                 'firstName' => $user->firstName,
//                 'lastName' => $user->lastName,
//                 'location' => $user->location,
//                 'photoURL' => $user->photo,
//                 'website' => $user->website,
//                 'creativeField' => $user->creative_field,
//                 'token' => $user->remember_token
//             ];
//             return response()->json(['status' => '202', 'message' => trans('auth.login_success'), 'userInfo' => $userinfo]);
//         } 
//     }

//     //user edit api for andriod
//     public function editProfile(Request $request)
//     {
//         $input = $request->all();
//         $token = $input['token'];  
//         /** @var User $user */
//         $user = User::where('remember_token', $token)->get()->first();
//         if($user){
// //            photo
//             $userphoto = $request->file('photoURL');
//             if ($userphoto) {
//                 $old_photo = $user->photoURL;
//                 if($old_photo && $old_photo != ''){
//                     Storage::delete('uploads/users/avatars', $old_photo);
//                 }

//                 $photoName = time().'_'.$userphoto->getClientOriginalName();
//                 $userphoto = Image::make($userphoto->getRealPath());
//                 $userphoto->orientate();
//                 $userphoto->save(storage_path().'/uploads/users/avatars/'.$photoName, 60);
//                 $user->photoURL = $photoName;
//             }
            
//             if($request->displayName){
//                 $user->displayName = $request->displayName;
//             }
//             if($request->firstName){
//                 $user->firstName = $request->firstName;
//             }
//             if($request->lastName){
//                 $user->lastName = $request->lastName;
//             }
//             if($request->creativeField){
//                 $user->creative_field = $request->creativeField;
//             }           
//             if($request->password){
//                 $user->password = bcrypt($request->password);
//             }           
//             if($request->location){
//                 $user->location = $request->location;
//             }
//             if($request->website){
//                 $user->website = $request->website;
//             }
//             if($request->bio){
//                 $user->bio = $request->bio;
//             }
//             $user->save();

//             $photo = $user->photoURL;
//             if($photo && $photo != ''){
//                 $photo = url('user/avatar/'.$photo);
//             }else{
//                 $photo = url('user/avatar/default.png');
//             }
//             $userinfo = [
//                 'id' => $user->id,
//                 'devideToken' => $user->deviceToken,
//                 'averageRate' => $user->avg_rating,
//                 'bio' => $user->bio,
//                 'displayName' => $user->displayName,
//                 'email' => $user->email,
//                 'firstName' => $user->firstName,
//                 'lastName' => $user->lastName,
//                 'location' => $user->location,
//                 'photoURL' => $photo,
//                 'website' => $user->website,
//                 'creativeField' => $user->creative_field,
//                 'token' => $user->remember_token
//             ];
//             return response()->json(['status' => '200', 'userInfo' => $userinfo]);
//         }else{
//             return response()->json(['status' => '201']);
//         }
//     }
    

//     public function store(CreateUserAPIRequest $request)
//     {
//         $input = $request->all();
//         $users = $this->userRepository->create($input);
//         return $this->sendResponse($users->toArray(), 'User saved successfully');
//     }

//     public function show($id)
//     {
//         /** @var User $user */
//         $user = $this->userRepository->find($id);

//         if (empty($user)) {
//             return Response::json(ResponseUtil::makeError('User not found'), 400);
//         }

//         return $this->sendResponse($user->toArray(), 'User retrieved successfully');
//     }
   
//     public function destroy($id)
//     {
//         /** @var User $user */
//         $user = $this->userRepository->find($id);
//         if (empty($user)) {
//             return Response::json(ResponseUtil::makeError('User not found'), 400);
//         }
//         $user->delete();

//         return $this->sendResponse($id, 'User deleted successfully');
//     }
    
//     public function getOwnerinformation(Request $request){
//         $input = $request->all();
//         $token = $input['token'];
//         /** @var User $user */
//         $user = User::where('remember_token', $token)->get()->first();
//         if($user){
// //            photo
//            $photo = $user->photoURL;
//             if($photo && $photo != ''){
//                 $user->photoURL = url('user/avatar/'.$user->photoURL);
//             }else{
//                 $user->photoURL = url('user/avatar/default.png');
//             }
           
//             $userinfo = [
//                 'id' => $user->id,
//                 'devideToken' => $user->deviceToken,
//                 'averageRate' => $user->avg_rating,
//                 'bio' => $user->bio,
//                 'displayName' => $user->displayName,
//                 'email' => $user->email,
//                 'firstName' => $user->firstName,
//                 'lastName' => $user->lastName,
//                 'location' => $user->location,
//                 'photoURL' => $user->photoURL,
//                 'website' => $user->website,
//                 'creativeField' => $user->creative_field,
//                 'token' => $user->remember_token
//             ];
//             return response()->json(['status' => '200', 'userInfo' => $userinfo]);   
//         }else{
//             return response()->json(['status' => '201']);
//         }
//     }
    
//     public function getOtherinformation(Request $request){
//         $input = $request->all();
//         $user_id = $input['user_id'];
//         /** @var User $user */
//         $user = User::where('id', $user_id)->get()->first();
//         if($user){
// //            photo
//            $photo = $user->photoURL;
//             if($photo && $photo != ''){
//                 $user->photoURL = url('user/avatar/'.$user->photoURL);
//             }else{
//                 $user->photoURL = url('user/avatar/default.png');
//             }
           
//             $userinfo = [
//                 'id' => $user->id,
//                 'devideToken' => $user->deviceToken,
//                 'averageRate' => $user->avg_rating,
//                 'bio' => $user->bio,
//                 'displayName' => $user->displayName,
//                 'email' => $user->email,
//                 'firstName' => $user->firstName,
//                 'lastName' => $user->lastName,
//                 'location' => $user->location,
//                 'photoURL' => $user->photoURL,
//                 'website' => $user->website,
//                 'creativeField' => $user->creative_field,
//                 'token' => $user->remember_token
//             ];
//             return response()->json(['status' => '200', 'userInfo' => $userinfo]);   
//         }else{
//             return response()->json(['status' => '201']);
//         }
//     }

//     public function sendFriendrequest(Request $request){
//         $input = $request->all();
//         $chk_user = DB::table('followers')->where('follower_id', $input['sender_id'])->where('leader_id', $input['receiver_id'])->first();
//         $rec_user = DB::table('followers')->where('leader_id', $input['sender_id'])->where('follower_id', $input['receiver_id'])->first();
//         $sender = User::where('id', $input['sender_id'])->first();
        
//         $deviceTokens = array();
//         $receiver = User::where('id', $input['receiver_id'])->first();
//         array_push($deviceTokens, $receiver->deviceToken);
//         $messageBody = $sender->displayName . " sent friend request.";

//         if(!$chk_user && !$rec_user){
//             $friendrequest = [
//                 'follower_id'           => $input['sender_id'],
//                 'leader_id'             => $input['receiver_id'],
//                 'status'                => 'pending',
//                 'created_at'            => date("Y-m-d H:i:s"),
//                 ];
//             //Create a record in user settings table.
//             $inserted = DB::table('followers')->insert($friendrequest);
//             $pendingfollowers = DB::table('followers')->where('leader_id', $receiver->id)->where('status', 'pending')->where('isnew', 1)->get();
//             $unread_number = count($pendingfollowers);
//             // $unreads = $this->getTotalUnread($receiver->id);
//             $unreads = Push::getAllUnread($receiver->id);
//             $pushdata = [
//                 'type' => 'friend_request',
//                 'unread_numbers' => $unreads
//             ];
//             Push::sendPush($deviceTokens, 'Friend Request', $messageBody, $unread_number, $pushdata);
//         }else{
//             $inserted = "Already exist";
//         }
        
//         return response()->json(['status' => '200', 'userinfo' => $inserted]);
//     }

//     public function getTotalUnread($user_id)
//     {
//         $self = User::where('id', $user_id)->first();
//         $currentUserId = $self->id;
//         // All threads that user is participating in
//         $threads = Thread::forUser($currentUserId)->latest('updated_at')->get();
//         $messagesInfo = array();
//         $total_unreadMessage = 0;
//         $total_unreadFriendrequest = 0;
//         $total_unreadFriendaccept = 0;
//         $total_notification = 0;

//         foreach ($threads as $key => $thread) {
//             $thread->unread = $thread->userUnreadMessages($currentUserId);
//             $unread_number = count($thread->unread);       
//             $total_unreadMessage += $unread_number;
//         }

//         $pendingfollowers = DB::table('followers')->where('leader_id', $user_id)->where('status', 'pending')->where('isnew', '1')->get();
//         $total_unreadFriendrequest = count($pendingfollowers);
    
//         $acceptfollers = DB::table('followers')->where('follower_id', $user_id)->where('status', 'approved')->where('isnew', '1')->get();
//         $total_unreadFriendaccept = count($acceptfollers);

//         $result = [
//             'unreadMessage' => $total_unreadMessage,
//             'unreadFriendrequest' => $total_unreadFriendrequest,
//             'unreadAcceptrequest' => $total_unreadFriendaccept,
//             'unreadAction' => $total_notification,
//         ];
//         return $result;
//     }



//     public function acceptFollowRequest(Request $request)
//     {
//         $input = $request->all();
//         $user = User::find($input['receiver_id']);
//         $sender_id = $input['receiver_id'];
//         $receiver_id = $input['sender_id'];

//         if($user != null){
//             $accepted = $user->updateFriendRequest($sender_id, $receiver_id);
//         }
//         $sender = User::where('id', $sender_id)->first();

//         $deviceTokens = array();
//         $receiver = User::where('id', $receiver_id)->first();
//         array_push($deviceTokens, $sender->deviceToken);
//         $messageBody = $receiver->displayName . " accepted your friend request.";

//         $acceptfollers = DB::table('followers')->where('leader_id', $sender->id)->where('status', 'approved')->where('isnew', '1')->get();
//         $unread_number = count($acceptfollers);
//         // $unreads = $this->getTotalUnread($sender->id);
//         $unreads = Push::getAllUnread($sender->id);
//         $pushdata = [
//             'type' => 'accept_friend_request',
//             'unread_numbers' => $unreads
//         ];
//         Push::sendPush($deviceTokens, 'New connection.', $messageBody, $unread_number, $pushdata);
//         return response()->json(['status' => '200', 'accepted' => $accepted, 'message' => 'follow request successfully accepted', 'unread_numbers' => $unreads]);
//     }

//     public function rejectFollowRequest(Request $request)
//     {
//         $input = $request->all();
//         $user = User::find($input['sender_id']);
//         if($user != null){
//             $accepted = $user->decilneFriendRequest($input['sender_id'], $input['receiver_id']);
//         }

//         // if ($follow_user) {
//         //     Flash::success(trans('messages.request_rejected'));
//         // }
//         //Notify the user for rejecting the follow request
//         // Notification::create(['user_id' => $request->user_id, 'timeline_id' => $user->timeline_id, 'notified_by' => Auth::user()->id, 'description' => Auth::user()->name.' '.trans('common.rejected_follow_request'), 'type' => 'reject_follow_request', 'link' => Auth::user()->username]);

//         return response()->json(['status' => '200', 'rejected' => $accepted, 'message' => 'follow request successfully accepted']);
//     }

//     public function getArtists(Request $request)
//     {
//         $token = $request->token;
//         $self = User::where('remember_token', $token)->first();
//         $self_id = $self->id;
//         $currentPage = 1;
//         if($request->page){
//             $currentPage = $request->page;
//         }
//         $usersInfo = array();
//         $pageData = User::where('id', '<>', $self_id)->paginate(20);
//         $users = $pageData->items();
//         $lastPage = $pageData->lastPage();
//         for($i = 0; $i < count($users); $i++ ){
//             $userInfo = $this->getUserInfo($users[$i]);
//             array_push($usersInfo, $userInfo);  
//         }
//         return response()->json(['status' => '200', 'usersInfo' => $usersInfo, 'lastPage' => $lastPage]);
//     }

//     public function getUserInfo($user){
//         $photo = $user->photoURL;
//         if($photo && $photo != ''){
//             $user->photoURL = url('user/avatar/'.$user->photoURL);
//         }else{
//             $user->photoURL = url('user/avatar/default.png');
//         }
//         $userinfo = [
//             'id' => $user->id,
//             'devideToken' => $user->deviceToken,
//             'displayName' => $user->displayName,
//             'email' => $user->email,
//             'averageRate' => $user->avg_rating,
//             'firstName' => $user->firstName,
//             'lastName' => $user->lastName,
//             'location' => $user->location,
//             'photoURL' => $user->photoURL,
//             'website' => $user->website,
//             'creativeField' => $user->creative_field,
//             'token' => $user->remember_token
//         ];  
//         return $userinfo;
//     }

//     public function getFriends(Request $request)
//     {
//         $token = $request->token;
//         $self = User::where('remember_token', $token)->first();
//         $self_id = $self->id;
//         $currentPage = 1;
//         if($request->page){
//             $currentPage = $request->page;
//         }
//         $usersInfo = array();
//         $pageData = DB::table('followers')->where('follower_id', $self_id)->where('status', 'approved')->orwhere('leader_id', $self_id)->where('status', 'approved')->paginate(10);

//         $friendRows = $pageData->items();
//         $lastPage = $pageData->lastPage();
//         for($i = 0; $i < count($friendRows); $i++ ){
//             $user_id = 0;
//             if($self_id == $friendRows[$i]->follower_id){
//                 $user_id = $friendRows[$i]->leader_id;
//             }else if($self_id == $friendRows[$i]->leader_id){
//                 $user_id = $friendRows[$i]->follower_id;
//             }

//             $user = User::where('id', $user_id)->first();
//             $userInfo = $this->getUserInfo($user);
//             array_push($usersInfo, $userInfo);  
//         }
//         return response()->json(['status' => '200', 'usersInfo' => $usersInfo, 'lastPage' => $lastPage]);
//     }

//     public function deleteFriend(Request $request)
//     {
//         $token = $request->token;
//         $self = User::where('remember_token', $token)->first();
//         $self_id = $self->id;
//         $user_id = $request->user_id;
//         $friendsData = DB::table('followers')->where('follower_id', $self_id)->orwhere('leader_id', $self_id)->where('status', 'approved')->get();
//         foreach ($friendsData as $key => $friend) {
//             if($friend->follower_id == $user_id || $friend->leader_id == $user_id)
//             {
//                 DB::table('followers')->where('id', $friend->id)->delete();
//             }
//         }
//         return response()->json(['status' => '200']);
//     }

//     public function giveReview(Request $request)
//     {
//         $token = $request->token;
//         $self = User::where('remember_token', $token)->first();
//         $sender_id = $self->id;
//         $receiver_id = $request->receiver_id;
//         $rate = $request->rate;
//         $review = $request->review;
        
//         $user_rating = [
//             'sender_id'        => $sender_id,
//             'receiver_id'      => $receiver_id,
//             'rate'             => $rate,
//             'review'           => $review, 
//         ];

//         $cond['sender_id'] = $sender_id;
//         $cond['receiver_id'] = $receiver_id;
//         $check_rating = DB::table('user_ratings')->where($cond)->get();
//         if(count($check_rating) > 0)
//         {
//             return response()->json(['status' => '202', 'message' => 'You already gave review to this user']);
//         }

//         //Create a record in user settings table.
//         $set_rating = DB::table('user_ratings')->insert($user_rating);
//         if($set_rating){
//             $received_user = User::where('id', $receiver_id)->first();
//             $totalRatings = DB::table('user_ratings')->where('receiver_id', $receiver_id);
//             $totalCounts = count($totalRatings->get());
//             $sum = $totalRatings->sum('rate');
//             $avg_mark = $sum / $totalCounts;
//             $received_user->avg_rating = $avg_mark;
//             $received_user->save();

//             $last_created = DB::table('user_ratings')->orderBy('created_at', 'desc')->first()->created_at;

//             $photo = $self->photoURL;
//             if($photo && $photo != ''){
//                 $photo = url('user/avatar/'.$photo);
//             }else{
//                 $photo = url('user/avatar/default.png');
//             }

//             $rate_data = [
//                 'rate' => $rate,
//                 'review' => $review,
//                 'sendTime' => $last_created,
//                 'senderName' => $self->displayName,
//                 'senderPhoto' => $photo 
//             ];
            
//             return response()->json(['status' => '200', 'message' => 'success', 'rateInfo' => $rate_data]);
//         }else{
//             return response()->json(['status' => '201', 'message' => 'failed',]);
//         }
//     }

//     public function seeReviews(Request $request)
//     {
//         $user_id = $request->user_id;
//         $page = 1;
//         if($request->page){
//             $page = $request->page;
//         }
//         $rating_arr = array();
//         $totalRatings = DB::table('user_ratings')->where('receiver_id', $user_id)->orderBy('created_at', 'desc')->paginate(10);
//         $ratingItems = $totalRatings->items();
//         $lastPage = $totalRatings->lastPage();
//         for($i = 0; $i < count($totalRatings); $i++){
//             $rating = $totalRatings[$i];
//             $sender_id = $rating->sender_id;
//             $sent_user = User::where('id', $sender_id)->first();

//             $photo = $sent_user->photoURL;
//             if($photo && $photo != ''){
//                 $photo = url('user/avatar/'.$photo);
//             }else{
//                 $photo = url('user/avatar/default.png');
//             }

//             $rate_data = [
//                 'rate' => $rating->rate,
//                 'review' => $rating->review,
//                 'sendTime' => $rating->created_at,
//                 'senderName' => $sent_user->displayName,
//                 'senderPhoto' => $photo 
//             ];
//             array_push($rating_arr, $rate_data);
//         }
//         return response()->json(['status' => '200', 'message' => 'success', 'ratingsInfo' => $rating_arr, 'lastPage' => $lastPage]);
//     }

//     public function getPendingFriends(Request $request){
//         $user_id = $request->user_id;
//         $page = 1;
//         $user = User::where('id', $user_id)->first();
//         $pageData= $user->followers()->where('status', 'pending')->orderBy('created_at', 'desc')->paginate(Setting::get('items_page'));
//         $pendingfriends = $pageData->items();
//         $lastPage = $pageData->lastPage();
//         $pendingFriendsInfo = array();
//         for($i = 0; $i < count($pendingfriends); $i++){
//             $f = $pendingfriends[$i];
//             $photo = $f->photoURL;
//             if($photo && $photo != ''){
//                 $photo = url('user/avatar/'.$photo);
//             }else{
//                 $photo = url('user/avatar/default.png');
//             }
//             $f_info = [
//                 'id' => $f->id,
//                 'devideToken' => $f->deviceToken,
//                 'displayName' => $f->displayName,
//                 'email' => $f->email,
//                 'averageRate' => $f->avg_rating,
//                 'firstName' => $f->firstName,
//                 'lastName' => $f->lastName,
//                 'location' => $f->location,
//                 'photoURL' => $photo,
//                 'website' => $f->website,
//                 'creativeField' => $f->creative_field
//             ];
//             array_push($pendingFriendsInfo, $f_info);
//         }
//         DB::table('followers')->where('leader_id', $user_id)->where('status', 'pending')->update(['isnew' => '0']);
//         return response()->json(['status' => '200', 'message' => 'success', 'usersInfo' => $pendingFriendsInfo, 'lastPage' => $lastPage]);
//     }

//     public function getPostInfo($postItem, $self_id){
//         $post_id = $postItem->id;
//         $post_likes = $postItem->postsLiked()->where('post_id', $post_id);
//         $post_comments = $postItem->allComments()->get();

//         $puser_id = $postItem->user_id;
//         $puser = User::where('id', $puser_id)->first();
//         $puserName = $puser->displayName;

//         if($postItem->photoURL && $postItem->photoURL != ''){
//             $postItem->photoURL = url('user/gallery/'.$postItem->photoURL);
//         }

//         if($postItem->audioURL && $postItem->audioURL != ''){
//             $postItem->audioURL = url('user/gallery/audio/'.$postItem->audioURL);
//         }

//         $liked = false;
//         if($postItem->users_liked->contains($self_id)){
//             $liked = true;
//         }else{
//             $liked = false;
//         }

//         if($postItem->hide == 1){
//             $hided = true;
//         }else{
//             $hided = false;
//         }

//         $postInfo = [
//             'youtubeURL' => $postItem->youtubeURL,
//             'bandcamURL' => $postItem->bandcamURL,
//             'content' => $postItem->content,
//             'image' => $postItem->photoURL,
//             'audio' => $postItem->audioURL,
//             'likes' => count($post_likes),
//             'comments' => count($post_comments),
//             'liked' => $liked,
//             'type' => $postItem->type,
//             'created_at' => $postItem->created_at,
//             'displayName' => $puserName,
//             'user_id' => $puser_id,
//             'liked' => $liked,
//             'post_id' => $postItem->id,
//             'hided' => $hided
//         ];
//         return $postInfo;
//     }

//     public function getNotifications(Request $request){
//         $token = $request->token;
//         // $user_id = $request->user_id;
//         $user = User::where('remember_token', $token)->first();
//         $notificationsData = $user->notifications()->orderBy('created_at', 'desc')->paginate(Setting::get('items_page'));
//         $notifications = $notificationsData->items();
//         $lastPage = $notificationsData->lastPage();
//         $notificationsInfo = array();
//         for($i = 0; $i < count($notifications); $i++){

//             $nofitifer_id = $notifications[$i]->notified_by;
//             $notifier = User::where('id', $nofitifer_id)->first();
//             $notifierInfo = $this->getUserInfo($notifier);

//             $post_id = $notifications[$i]->post_id;
//             if($post_id){
//                 $post = Post::where('id', $post_id)->first();
//                 $postInfo = $this->getPostInfo($post, $user->id);
//             }

//             $noti = [
//                 'id' => $notifications[$i]->id,
//                 'userInfo' => $notifierInfo,
//                 'postInfo' => $postInfo,
//                 'notifier' => $notifications[$i]->notified_by,
//                 'seen' => $notifications[$i]->seen == 1?true: false,
//                 'description' => $notifications[$i]->description,
//                 'type' => $notifications[$i]->type,
//                 'time' => $notifications[$i]->created_at
//             ];
//             array_push($notificationsInfo, $noti);
//         }
//         return response()->json(['status' => '200', 'message' => 'success', 'notifications' => $notificationsInfo, 'lastPage' => $lastPage]);
//     }
}
