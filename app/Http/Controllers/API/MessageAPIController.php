<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\AppBaseController;
use App\Events\MessagePublished;
use App\Hashtag;
use App\Setting;
use App\User;
use App\MessageRequest;
use App\Notification;
use App\Push;
use Carbon\Carbon;
use Cmgmyr\Messenger\Models\Message;
use Cmgmyr\Messenger\Models\Participant;
use Cmgmyr\Messenger\Models\Thread;
use Event;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Session;
use Teepluss\Theme\Facades\Theme;
use Validator;
use App\Repositories\UserRepository;
use DB;


class MessageAPIController extends AppBaseController
{
    private $userRepository;
    

    public function __construct(UserRepository $userRepo)
    {
        $this->userRepository = $userRepo;
    }

    protected function sendMessageRequest(Request $request){

        $sender_id = $request->sender_id;
        $receiver_id = $request->receiver_id;

        //push initial
        $sender = User::where('id', $sender_id)->first();
        $deviceTokens = array();
        $receiver = User::where('id', $receiver_id)->first();
        array_push($deviceTokens, $receiver->deviceToken);
        $messageBody = $sender->displayName . " sent message request.";

        $photo = $receiver->photoURL;
        if($photo && $photo != ''){
            $photo = url('user/avatar/'.$photo);
        }else{
            $photo = url('user/avatar/default.png');
        }

        $receiverInfo = [
            'id' => $receiver->id,
            'deviceToken' => $receiver->deviceToken,
            'averageRate' => $receiver->avg_rating,
            'bio' => $receiver->bio,
            'displayName' => $receiver->displayName,
            'email' => $receiver->email,
            'firstName' => $receiver->firstName,
            'lastName' => $receiver->lastName,
            'location' => $receiver->location,
            'photoURL' => $photo,
            'website' => $receiver->website,
            'creativeField' => $receiver->creative_field,
        ];

        $chattingroom = $this->isChattingroom($sender_id, $receiver_id);

        if($chattingroom){

            $thread = Thread::where('id', $chattingroom->thread_id)->first();
            $thread->unread = $thread->isUnread($sender_id);

            $thread->lastMessage = $thread->latestMessage;

            $participants = $thread->participants()->get();
            $messagesInfo = array();

            foreach ($participants as $key => $participant) {
                if ($participant->user->id != $sender_id) {
                    $thread->user = $participant->user;
                    $uInfo = $this->getUserInfo($participant->user);
                    $messages = $this->getThreadMessages($thread->id);
                    $msgData = [
                        'state' => 1,
                        'thread_id' => $thread->id,
                        'userInfo' => $uInfo,
                        'messages' => $messages,
                        'unread' => $thread->unread,
                    ];
                    array_push($messagesInfo, $msgData);
                    break;
                }
            }            

            $result = "Chatting room already exist";
            return response()->json(['status' => '200','result'=>$result , 'sender_id' => $sender_id, 'receiver_id' => $receiver_id, 'receiverInfo' => $receiverInfo, 'messagesInfo'=>$messagesInfo]);
        }else{
            $requestData = [
                'sender_id'        => $sender_id,
                'receiver_id'      => $receiver_id,
            ];
            $msg_req = MessageRequest::where($requestData)->first();
            if($msg_req){
                $reverseData = [
                    'receiver_id'        => $sender_id,
                    'sender_id'      => $receiver_id,
                ];
                $revReq = MessageRequest::where($reverseData)->first();
                if($revReq){
                    $revReq->state = 1;
                    $revReq->save();

                    $request_id = $revReq->id;
                    $result = false;
                    $msgRequest = MessageRequest::where('id', $request_id)->first();
                    if($msgRequest){
                        $msgRequest->state = 1;
                        $result = $msgRequest->save();

                        $thread = Thread::create(
                            [
                                'subject' => isset($input['subject']) ? $input['subject'] : '',
                            ]
                        );


                        //sending push notification
                        //push initial
                        $sender = User::where('id', $sender_id)->first();
                        $deviceTokens = array();
                        $receiver = User::where('id', $receiver_id)->first();
                        array_push($deviceTokens, $receiver->deviceToken);
                        $messageBody = $sender->displayName . "accept message request .";
            
                        $newMessages = MessageRequest::where('receiver_id', $receiver_id)->where('isnew', 1)->get();
                        $unread_number = count($newMessages);
        
                        $unreads = Push::getAllUnread($receiver_id);
                        $pushdata = [
                            'type' => 'chat_request',
                            'unread_numbers' => $unreads,
                            'thread_id' => $thread->id
                        ];
                        Push::sendPush($deviceTokens, 'Accept message', $messageBody, $unread_number, $pushdata);

                        $sender_id = $msgRequest->sender_id;
                        $receiver_id = $msgRequest->receiver_id;

                        //sender
                        Participant::create(
                            [
                                'thread_id' => $thread->id,
                                'user_id'   => $sender_id,
                                'last_read' => new Carbon(),
                            ]
                        );

                        //reciever
                        Participant::create(
                            [
                                'thread_id' => $thread->id,
                                'user_id'   => $receiver_id,
                                'last_read' => new Carbon(),
                            ]
                        );

                    }else{
                       
                    }

                    $thread->unread = $thread->isUnread($sender_id);
                    $thread->lastMessage = $thread->latestMessage;
                    $participants = $thread->participants()->get();
                    $messagesInfo = array();

                    foreach ($participants as $key => $participant) {
                        if ($participant->user->id != $sender_id) {
                            $thread->user = $participant->user;
                            $uInfo = $this->getUserInfo($participant->user);
                            $messages = $this->getThreadMessages($thread->id);
                            $msgData = [
                                'state' => 1,
                                'thread_id' => $thread->id,
                                'userInfo' => $uInfo,
                                'messages' => $messages,
                                'unread' => $thread->unread,
                            ];
                            array_push($messagesInfo, $msgData);
                            break;
                        }
                    }  

                    $result = "New chatting room created";
                    return response()->json(['status' => '200','result'=>$result , 'sender_id' => $sender_id, 'receiver_id' => $receiver_id, 'receiverInfo' => $receiverInfo, 'messagesInfo'=>$messagesInfo]);
                }else{
                    $result = "Request was already sent";
                    return response()->json(['status' => '201', 'result' => $result]);
                }
            }else{
                $reverseData = [
                    'receiver_id'        => $sender_id,
                    'sender_id'      => $receiver_id,
                ];
                $result = "New request sent";
                $msgrequest = MessageRequest::create($requestData);

                //sending push notification
                $newMessages = MessageRequest::where('receiver_id', $receiver_id)->where('isnew', 1)->get();
                $unread_number = count($newMessages);

                // $unreads = $this->getTotalUnreadInfo($receiver_id);
                $unreads = Push::getAllUnread($receiver_id);
                $pushdata = [
                    'type' => 'chat_request',
                    'unread_numbers' => $unreads
                ];

                $deviceTokens = array();
                $receiver = User::where('id', $receiver_id)->first();
                array_push($deviceTokens, $receiver->deviceToken);
        
                Push::sendPush($deviceTokens, 'New message request', $messageBody, $unread_number, $pushdata);

                if($msgrequest){
                    $result = true;
                }
                return response()->json(['status' => '202', 'sender_id' => $sender_id, 'receiver_id' => $receiver_id, 'result' => $result]);
            }
        }
    }


    protected function pushTest(){
        Push::pushTest();
    }

    protected function testUnread(Request $request)
    {
        $user_id = $request->user_id;
        $result = Push::getAllUnread($user_id);
        dd($result);
        
    }

    protected function getConnectionList(Request $request){
        $sender_id = $request->sender_id;
        $receiver_id = $sender_id;
        $senderCond = [
            'sender_id' => $sender_id,
            'state' => 0
        ];
        $receiverCond = [
            'receiver_id' => $receiver_id,
            'state' => 1
        ];
    }

    protected function acceptMessageRequest(Request $request){
        $sender_id = $request->sender_id;
        $receiver_id = $request->receiver_id;
        $request_id = $request->request_id;
        $result = false;
        $msgRequest = MessageRequest::where('id', $request_id)->first();
        if($msgRequest){
            $msgRequest->state = 1;
            $result = $msgRequest->save();
            
            $thread = Thread::create(
                [
                    'subject' => isset($input['subject']) ? $input['subject'] : '',
                ]
            );

            //sending push notification
             //push initial
             $sender = User::where('id', $sender_id)->first();
             $deviceTokens = array();
             $receiver = User::where('id', $receiver_id)->first();
             array_push($deviceTokens, $receiver->deviceToken);
             $messageBody = $sender->displayName . "accept message request .";
 
             $newMessages = MessageRequest::where('receiver_id', $receiver_id)->where('isnew', 1)->get();
             $unread_number = count($newMessages);
           
            //  $unreads = $this->getTotalUnreadInfo($receiver_id);
             $unreads = Push::getAllUnread($receiver_id);
             $pushdata = [
                 'type' => 'chat_request',
                 'unread_numbers' => $unreads,
                 'thread_id' => $thread->id
             ];
             Push::sendPush($deviceTokens, 'Accept message', $messageBody, $unread_number, $pushdata);

            $sender_id = $msgRequest->sender_id;
            $receiver_id = $msgRequest->receiver_id;

            $receiver = User::where('id', $receiver_id)->first();
            $receiverInfo = $this->getUserInfo($receiver);

            //sender
            Participant::create(
                [
                    'thread_id' => $thread->id,
                    'user_id'   => $sender_id,
                    'last_read' => new Carbon(),
                ]
            );

            //reciever
            Participant::create(
                [
                    'thread_id' => $thread->id,
                    'user_id'   => $receiver_id,
                    'last_read' => new Carbon(),
                ]
            );

        }else{
            $result = false;
        }

        return response()->json(['status' => '200','result' => $result, 'thread_id' => $thread->id, 'userInfo' => $receiverInfo, 'unread' => false]);
    }

    public function rejectMessageRequest(Request $request){
        $request_id = $request->request_id;
        $req = MessageRequest::where('id', $request_id)->first();
        $result = $req->delete();
        return response()->json(['status' => '200','result' => $result]);
    }

     protected function getChattingroom(Request $request){
        $sender_id = $request->sender_id;
        $receiver_id = $request->receiver_id;
        $user_ids = [$sender_id, $receiver_id];
        $p_array = array();

        $participants = Participant::where('user_id', $sender_id)->get();
        // dd($sender_id);
        for($i = 0; $i < count($participants); $i++){
            $p = $participants[$i];
            array_push($p_array, $p->thread_id);
        }
        $ppp = Participant::where('user_id', $receiver_id)->whereIn('thread_id', $p_array)->first();
        $thread_id = $ppp->thread_id;
        return response()->json(['status' => '200','thread_id' => $thread_id]);
    }

    protected function isChattingroom($sender_id, $receiver_id){
        $user_ids = [$sender_id, $receiver_id];
        $p_array = array();

        $participants = Participant::where('user_id', $sender_id)->get();
        // dd($sender_id);
        for($i = 0; $i < count($participants); $i++){
            $p = $participants[$i];
            array_push($p_array, $p->thread_id);
        }

        $ppp = Participant::where('user_id', $receiver_id)->whereIn('thread_id', $p_array)->first();
        return $ppp;
    }

    protected function checkCensored()
    {
        $messages['not_contains'] = 'The :attribute must not contain banned words';
        if($this->request->method() == 'POST') {
            // Adjust the rules as needed
            $this->validate($this->request, 
                [
                  'name'          => 'not_contains',
                  'about'         => 'not_contains',
                  'title'         => 'not_contains',
                  'description'   => 'not_contains',
                  'tag'           => 'not_contains',
                  'email'         => 'not_contains',
                  'body'          => 'not_contains',
                  'link'          => 'not_contains',
                  'address'       => 'not_contains',
                  'website'       => 'not_contains',
                  'display_name'  => 'not_contains',
                  'key'           => 'not_contains',
                  'value'         => 'not_contains',
                  'subject'       => 'not_contains',
                  'username'      => 'not_contains',
                  'email'         => 'email',
                ],$messages);
        }
    }

    /**
     * Show all of the message threads to the user.
     *
     * @return mixed
     */
    public function index()
    {
        $trending_tags = Hashtag::orderBy('count', 'desc')->get();
        if (count($trending_tags) > 0) {
            if (count($trending_tags) > (int) Setting::get('min_items_page')) {
                $trending_tags = $trending_tags->random((int) Setting::get('min_items_page'));
            }
        } else {
            $trending_tags = '';
        }

        $theme = Theme::uses(Setting::get('current_theme', 'default'))->layout('default');
        $theme->setTitle(trans('common.messages').' '.Setting::get('title_seperator').' '.Setting::get('site_title').' '.Setting::get('title_seperator').' '.Setting::get('site_tagline'));

        return $theme->scope('messenger.index', compact('trending_tags'))->render();
    }

    /**
     * Shows a message thread.
     *
     * @param $id
     *
     * @return mixed
     */
    public function show($id)
    {
        try {
            $thread = Thread::findOrFail($id);
        } catch (ModelNotFoundException $e) {
            Session::flash('error_message', 'The thread with ID: '.$id.' was not found.');

            return redirect('messages');
        }

        // don't show the current user in list
        $userId = Auth::user()->id;
        $users = User::whereNotIn('id', $thread->participantsUserIds($userId))->get();

        $thread->markAsRead($userId);

        $messages = [];
        $thread->conversationMessages = $thread->messages()->orderBy('created_at', 'ASC')->latest()->with('user')->paginate(10);

        // $thread->conversationMessages->sortBy('created_at', 'desc');

        // dd($thread->conversationMessages->toArray());


//         SELECT * FROM (
//     SELECT * FROM messages WHERE thread_id=1 LIMIT 5
// ) sub
// ORDER BY created_at ASC


        return response()->json(['status' => '200', 'data' => $thread]);

        $theme = Theme::uses(Setting::get('current_theme', 'default'))->layout('default');

        return $theme->scope('messenger.show', compact('thread', 'users'))->render();
    }

    /**
     * Creates a new message thread.
     *
     * @return mixed
     */
    public function create()
    {
        $users = User::where('id', '!=', Auth::id())->get();

        $theme = Theme::uses(Setting::get('current_theme', 'default'))->layout('default');
        $theme->setTitle(trans('common.create_message').' '.Setting::get('title_seperator').' '.Setting::get('site_title').' '.Setting::get('title_seperator').' '.Setting::get('site_tagline'));

        return $theme->scope('messenger.create', compact('users'))->render();
    }

    /**
     * Stores a new message thread.
     *
     * @return mixed
     */
    public function store(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'recipients' => 'required',
            'message'    => 'required',
        ]);


        if ($validator->fails()) {
            return response()->json(['status' => '200', 'data' => $validator->errors()]);
        }

        $recipients = explode(',', $input['recipients']);
        $recipients[1] = (string) Auth::id();
        $thread = Thread::whereHas('participants', function ($query) use ($recipients) {
            $query->whereIn('user_id', $recipients)
                ->groupBy('thread_id')
                ->havingRaw('COUNT(thread_id)='.count($recipients));
        })->first();


        if (!$thread) {
            $thread = Thread::create(
                [
                    'subject' => isset($input['subject']) ? $input['subject'] : '',
                ]
            );

              // Sender
            Participant::create(
                [
                    'thread_id' => $thread->id,
                    'user_id'   => Auth::user()->id,
                    'last_read' => new Carbon(),
                ]
            );

            // Recipients
            if (Input::has('recipients')) {
                $recipients = explode(',', $input['recipients']);
                $thread->addParticipant($recipients);
            }
        }

        $message = new Message([
                'user_id'   => Auth::user()->id,
                'body'      => $input['message'],
            ]);

        $thread->messages()->save($message);
        $thread = Thread::findOrFail($thread->id);
        $thread->lastMessage = $thread->latestMessage;

        $participants = $thread->participants()->get();

        foreach ($participants as $key => $participant) {
            if (Auth::id() != $participant->user->id) {
                // echo $participant->user->id;
                Event::fire(new MessagePublished($message, $participant->user));
            }
            if ($participant->user->id != Auth::user()->id) {
                $thread->user = $participant->user;
            }
        }

        return response()->json(['status' => '200', 'data' => $thread]);
    }

    public function getUserchattinglist(Request $request)
    {
        $page = 1;
        if($request->page){
            $page = $request->page;
        }
        $token = $request->token;
        $self = User::where('remember_token', $token)->first();
        $currentUserId = $self->id;
        // All threads that user is participating in
        $threads = Thread::forUser($currentUserId)->latest('updated_at')->paginate(20);
        $messagesInfo = array();
        $total_unread = 0;

        if($page == 1){
            $sentRequests = MessageRequest::where('sender_id', $self->id)->where('state', 0)->orderBy('created_at', 'desc')->get();
            foreach ($sentRequests as $key => $sent) {
                $user_id = $sent->receiver_id;
                $user = User::where('id', $user_id)->first();
                $uInfo = $this->getUserInfo($user);
                $msgData = [
                    'request_id'=> $sent->id,
                    'state' => 2,
                    'userInfo' => $uInfo,
                    'created_at' => $sent->created_at
                ];
                array_push($messagesInfo, $msgData);
            }

            $receiveReqests = MessageRequest::where('receiver_id', $self->id)->where('state', 0)->orderBy('created_at', 'desc')->get();
            foreach ($receiveReqests as $key => $receive) {
                $user_id = $receive->sender_id;
                $user = User::where('id', $user_id)->first();
                $unread_number = 0;
                if($receive->isnew == 1)
                {
                    $unread_number = 1;  
                }else{
                    $unread_number = 0;
                }
                $uInfo = $this->getUserInfo($user);
                $msgData = [
                    'request_id'=> $receive->id,
                    'state' => 3,
                    'userInfo' => $uInfo,
                    'unread_number' => $unread_number,
                    'created_at' => $receive->created_at
                ];
                array_push($messagesInfo, $msgData);
            }
        }

        foreach ($threads as $key => $thread) {

            $thread->unread = $thread->userUnreadMessages($currentUserId);
            $lastMessageRow = $thread->latestMessage;

      
            
            $lastMessage = [
                'id' => $lastMessageRow['id'],
                'thread_id' => $lastMessageRow['thread_id'],
                'user_id' => $lastMessageRow['user_id'],
                'body' => $lastMessageRow['body'],
                'created_at' => $lastMessageRow['created_at'],
                'updated_at' => $lastMessageRow['updated_at']
            ];

            $participants = $thread->participants()->get();
            $unread_number = count($thread->unread);     
            
            foreach ($participants as $key => $participant) {
                if ($participant->user->id != $currentUserId) {
                    $thread->user = $participant->user;
                    $uInfo = $this->getUserInfo($participant->user);
                
                    // $messages = $this->getThreadMessages($thread->id);
                    $receiveReqests = MessageRequest::where('sender_id', $self->id)->where('receiver_id', $uInfo['id'])->where('isnew', 1)->get();
                    $blocked = false;
                    if($participant->block == 1){
                        $blocked = true;
                    }

                    // var_dump(count($receiveReqests));
                    if(!$lastMessage['id']){

                        if(count($receiveReqests) > 0){
                            $unread_number = 1;
                        }else{
                            $unread_number = 0;
                        }
                    }
                    
                    $msgData = [
                        'state' => 1,
                        'thread_id' => $thread->id,
                        'userInfo' => $uInfo,
                        // 'messages' => $messages,
                        // 'unread' => $thread->unread,
                        'unreadNumber' => $unread_number,
                        'lastMessage' => $lastMessage,
                        'blocked' => $blocked
                    ];
                    array_push($messagesInfo, $msgData);
                    break;
                }
            }
        }

        $lastPage = $threads->lastPage();
        return response()->json(['status' => '200', 'messagesInfo' => $messagesInfo, 'lastPage' => $lastPage]);
    }

    public function getThreadChattinglist(Request $request)
    {
        $currentUserId = $request->user_id; 
        $thread_id = $request->thread_id;

        $thread = Thread::where('id', $thread_id)->first();
            $lastMessageRow = $thread->latestMessage;
            $lastMessage = [
                'id' => $lastMessageRow['id'],
                'thread_id' => $lastMessageRow['thread_id'],
                'user_id' => $lastMessageRow['user_id'],
                'body' => $lastMessageRow['body'],
                'created_at' => $lastMessageRow['created_at'],
                'updated_at' => $lastMessageRow['updated_at']
            ];

            $participants = $thread->participants()->get();
            $unread_number = count($thread->unread);     
            $msgData = array();
            foreach ($participants as $key => $participant) {
                if ($participant->user->id != $currentUserId) {
                    $thread->user = $participant->user;
                    $uInfo = $this->getUserInfo($participant->user);
                
                    // $messages = $this->getThreadMessages($thread->id);
                    $receiveReqests = MessageRequest::where('sender_id', $currentUserId)->where('receiver_id', $uInfo['id'])->where('isnew', 1)->get();

                    // var_dump(count($receiveReqests));
                    if(!$lastMessage['id']){

                        if(count($receiveReqests) > 0){
                            $unread_number = 1;
                        }else{
                            $unread_number = 0;
                        }
                    }
                    
                    $msgData = [
                        'state' => 1,
                        'thread_id' => $thread->id,
                        'userInfo' => $uInfo,
                        // 'messages' => $messages,
                        // 'unread' => $thread->unread,
                        'unreadNumber' => $unread_number,
                        'lastMessage' => $lastMessage
                    ];
                    break;
                }
            }
            return response()->json(['status' => '200', 'messageInfo' => $msgData]);
        
    }

    public function blockChattingroom(Request $request){
        $thread_id = $request->thread_id;
        $receiver_id = $request->receiver_id;
        $cond = [
            'thread_id' => $thread_id,
            'user_id' => $receiver_id
        ];
        $ptc = Participant::where($cond)->first();
        if($ptc){
            $result = $ptc->delete();
        }
        return response()->json(['status' => '200', 'result' => $result]);
    }

    public function getThreadMessages($thread_id){
        $messages = Message::where('thread_id', $thread_id)->orderBy('created_at', 'desc')->paginate(20);
        $msgs = array();
        for($i = 0; $i < count($messages->items()); $i++){
            $msg = $messages->items()[$i];
            $msgUser = $msg->user;
            $userInfo = $this->getUserInfo($msgUser);
            $msgInfo = [
                'userInfo' => $userInfo,
                'message' => $msg->body,
                'created_at' => $msg->created_at,
            ];
            array_push($msgs, $msgInfo);
        }
        return $msgs;
    }

    public function getPreviousMessages(Request $request){
        if($request->page){
            $page = $request->page;
        }
        $thread_id = $request->thread_id;
        $user_id = $request->user_id;
        $messages = Message::where('thread_id', $thread_id)->orderBy('created_at', 'desc')->paginate(20);
        $msgs = array();
        for($i = count($messages->items()) - 1; $i >= 0; $i--){
            $msg = $messages->items()[$i];
            $msgUser = $msg->user;
            $userInfo = $this->getUserInfo($msgUser);
            $msgInfo = [
                'userInfo' => $userInfo,
                'message' => $msg->body,
                'created_at' => $msg->created_at,
            ];
            array_push($msgs, $msgInfo);
        }
        $lastPage = $messages->lastPage();
        $thread = Thread::where('id', $thread_id)->first();
        $thread->markAsRead($user_id);
        return response()->json(['status' => '200', 'messagesInfo' => $msgs, 'lastPage' => $lastPage]);

    }

    public function removeUnread(Request $request){
        $thread_id = $request->thread_id;
        $user_id = $request->user_id;
        $thread = Thread::where('id', $thread_id)->first();
        $thread->markAsRead($user_id);
        // $unreads = $this->getTotalUnreadInfo($user_id);
        $unreads = Push::getAllUnread($user_id);

        $thread = Thread::where('id', $thread_id)->first();
        $participants = $thread->participants()->get();
        foreach ($participants as $key => $participant) {
            if ($participant->user->id != $user_id) {
                $thread->user = $participant->user;
                $uInfo = $this->getUserInfo($participant->user);
                // $messages = $this->getThreadMessages($thread->id);
                $receiveReqest = MessageRequest::where('sender_id', $user_id)->where('receiver_id', $uInfo['id'])->first();
                $receiveReqest->isNew = 0;
                $receiveReqest->save();
            }
        }
    

        return response()->json(['status' => '200', 'unread' => 0, 'data'=>$unreads]);
    }

    public function getUserInfo($user){
        $photo = $user->photoURL;
        if($photo && $photo != ''){
            $user->photoURL = url('user/avatar/'.$user->photoURL);
        }else{
            $user->photoURL = url('user/avatar/default.png');
        }
        $userinfo = [
            'id' => $user->id,
            'devideToken' => $user->deviceToken,
            'displayName' => $user->displayName,
            'email' => $user->email,
            'averageRate' => $user->avg_rating,
            'firstName' => $user->firstName,
            'lastName' => $user->lastName,
            'location' => $user->location,
            'photoURL' => $user->photoURL,
            'website' => $user->website,
            'creativeField' => $user->creative_field,
            'token' => $user->remember_token
        ];  
        return $userinfo;
    }

    public function getTotalUnread(Request $request)
    {
        $token = $request->token;
        
        Push::isLogged($token);

        $self = User::where('remember_token', $token)->first();
        $currentUserId = $self->id;
        $result = Push::getAllUnread($currentUserId);
        return response()->json(['status' => '200', 'unreadMessage' => $result['unreadMessage'], 'unreadAction' => $result['unreadAction'], 'unreadFriendrequest' => $result['unreadFriendrequest'], 'unreadAcceptrequest' => $result['unreadAcceptrequest']]);
    }

    /**
     * Adds a new message to a current thread.
     *
     * @param $id
     *
     * @return mixed
     */

    public function sendMessage(Request $request)
    {
        $sender_id = $request->sender_id;
        $thread_id = $request->thread_id;
        $messageBody = $request->message;

        $mypart = Participant::where('thread_id', $thread_id)->where('user_id', $sender_id)->first();
        $blocked = $mypart->block;
        
        $part = Participant::where('thread_id', $thread_id)->where('user_id', '!=', $sender_id)->first();
        $receiver_id = $part->user_id;

        // Message
        $message = Message::create(
            [
                'thread_id' => $thread_id,
                'user_id'   => $sender_id,
                'body'      => $messageBody,
            ]
        );
        $receiver = User::where('id', $receiver_id)->first();
        $deviceTokens = array($receiver->deviceToken);

        $thread = Thread::where('id', $thread_id)->first();
        $thread->unread = $thread->userUnreadMessages($receiver_id);
        $unread_number = count($thread->unread);   

        $unreads = Push::getAllUnread($receiver_id);
        $pushdata = [
            'type' => 'msg',
            'thread_id' =>  $thread_id,
            'unread_numbers' => $unreads
        ];

        if($blocked == 0){
            Push::sendPush($deviceTokens, 'New message', $messageBody, $unread_number, $pushdata);
        }
        
        $sender = User::where('id', $sender_id)->first();
        $senderInfo = $this->getUserInfo($sender);

        $usersInfo = array();
        $pcs = Participant::where('thread_id', $thread_id)->get();
        for($i = 0; $i < count($pcs); $i++){

            $user = User::where('id', $pcs[$i]->user_id)->first();
            $userinfo = $this->getUserInfo($user);
            array_push($usersInfo, $userinfo);
        }

        // $tmp = Push::getAllUnread($sender_id);

        return response()->json(['status' => '200', 'message' => $messageBody, 'created_at'=>$message->created_at, 'updated_at'=>$message->updated_at, 'usersInfo' => $usersInfo, 'senderInfo' => $senderInfo, 'blocked' => $blocked,  'unreads'=>$unreads]);
    }

    public function getMessagesFromUser(Request $request){
        $id = $request->id;
        $user_id = $request->user_id;
        $this->getMessage($id, $user_id);

    }

    public function push_test()
    {

    }

    public function update($id)
    {
        $thread = Thread::findOrFail($id);

        // Message
        $message = Message::create(
            [
                'thread_id' => $thread->id,
                'user_id'   => Auth::id(),
                'body'      => Input::get('message'),
            ]
        );

        $message->user = $message->user;

        $thread->activateAllParticipants();
        // activate all participants
        $participants = $thread->participants()->withTrashed()->get();
        foreach ($participants as $participant) {
            $participant->restore();
            if (Auth::id() != $participant->user->id) {
                // echo $participant->user->id;
                Event::fire(new MessagePublished($message, $participant->user));
            }
        }


        // Add replier as a participant
        $participant = Participant::firstOrCreate(
            [
                'thread_id' => $thread->id,
                'user_id'   => Auth::user()->id,
            ]
        );
        $participant->last_read = new Carbon();
        $participant->save();

        // Recipients
        if (Input::has('recipients')) {
            $thread->addParticipant(Input::get('recipients'));
        }
        return response()->json(['status' => '200', 'data' => $message]);
    }

    // Custom classes for Vuejs

    public function getMessages()
    {
        $currentUserId = Auth::user()->id;

        // All threads that user is participating in
        $threads = Thread::forUser($currentUserId)->latest('updated_at')->paginate(30);

        foreach ($threads as $key => $thread) {
            $thread->unread = $thread->isUnread($currentUserId);

            $thread->lastMessage = $thread->latestMessage;

            $participants = $thread->participants()->get();

            foreach ($participants as $key => $participant) {
                if ($participant->user->id != Auth::user()->id) {
                    $thread->user = $participant->user;
                    break;
                }
            }
        }
            // dd($threads);
            return response()->json(['status' => '200', 'data' => $threads]);
    }

    public function getMessage($id, $user_id)
    {
        $thread = Thread::findOrFail($id);
        $thread->lastMessage = $thread->latestMessage;
        $thread->unread = true;

        $participants = $thread->participants()->get();

        foreach ($participants as $key => $participant) {
            if ($participant->user->id != $user_id) {
                $thread->user = $participant->user;
                break;
            }
        }

        return response()->json(['status' => '200', 'data' => $thread]);
    }

    public function getTotalUnreadInfo($user_id)
    {
        $self = User::where('id', $user_id)->first();
        $currentUserId = $self->id;
        // All threads that user is participating in
        $threads = Thread::forUser($currentUserId)->latest('updated_at')->get();
        $messagesInfo = array();

        $total_unreadMessage = 0;
        $total_unreadFriendrequest = 0;
        $total_unreadFriendaccept = 0;
        $total_notification = 0;

        foreach ($threads as $key => $thread) {
            $thread->unread = $thread->userUnreadMessages($currentUserId);
            $unread_number = count($thread->unread);       
            $total_unreadMessage += $unread_number;
        }

        $pendingfollowers = DB::table('followers')->where('leader_id', $user_id)->where('status', 'pending')->where('isnew', '1')->get();
        $total_unreadFriendrequest = count($pendingfollowers);
    
        $acceptfollers = DB::table('followers')->where('follower_id', $user_id)->where('status', 'approved')->where('isnew', '1')->get();
        $total_unreadFriendaccept = count($acceptfollers);

        $result = [
            'unreadMessage' => $total_unreadMessage,
            'unreadFriendrequest' => $total_unreadFriendrequest,
            'unreadAcceptrequest' => $total_unreadFriendaccept,
            'unreadAction' => $total_notification,
        ];
        return $result;
    }

    public function getUnreadMessages()
    {
        return response()->json(['status' => '200', 'unread_conversations' => Auth::user()->newThreadsCount()]);
    }

    public function getPrivateConversation($userId)
    {
        $recipients = [$userId, Auth::id()];
        $recipients[1] = (string) Auth::id();

        $thread = Thread::whereHas('participants', function ($query) use ($recipients) {
            $query->whereIn('user_id', $recipients)
                ->groupBy('thread_id')
                ->havingRaw('COUNT(thread_id)='.count($recipients));
        })->first();

        $messages = [];

        if (!$thread) {
            $thread = Thread::create(
                [
                    'subject' => isset($input['subject']) ? $input['subject'] : '',
                ]
            );

              // Sender
            Participant::create(
                [
                    'thread_id' => $thread->id,
                    'user_id'   => Auth::user()->id,
                    'last_read' => new Carbon(),
                ]
            );

            // Recipients
            $thread->addParticipant($recipients);
        }

        $thread = Thread::findOrFail($thread->id);

        foreach ($thread->messages as $key => $value) {
            $messages[$key] = $value;
            $messages[$key]['user'] = $value->user;
        }

        $thread->conversationMessages = collect($messages);


        $participants = $thread->participants()->get();

        foreach ($participants as $key => $participant) {
            if ($participant->user->id != Auth::user()->id) {
                $thread->user = $participant->user;
            }
        }
        return response()->json(['status' => '200', 'data' => $thread]);
    }

    public function blockThreadUser(Request $request)
    {
        $thread_id = $request->thread_id;
        $user_id = $request->user_id;
        $cond['sender_id'] = $request->current_userid;
        $cond['receiver_id'] = $user_id;
        if($thread_id == 0){
            $request = MessageRequest::where($cond)->first();
            $request->delete();
            return response()->json(['status' => '200']);
        }
        $thread = Thread::where('id', $thread_id)->first();
        $participant = $thread->participants()->where('user_id', $user_id)->first();
        $participant->block = 1;
        $participant->save();
        return response()->json(['status' => '200']);
        
    }
}
