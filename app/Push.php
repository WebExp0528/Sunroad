<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

//use Illuminate\Database\Eloquent\SoftDeletes;
use Pushok\AuthProvider;
use Pushok\Client;
use Pushok\Notification;
use Pushok\Payload;
use Pushok\Payload\Alert;
use App\User;
use DB;
use Cmgmyr\Messenger\Models\Message;
use Cmgmyr\Messenger\Models\Participant;
use Cmgmyr\Messenger\Models\Thread;
use Symfony\Component\VarDumper\Cloner\Data;

class Push extends Model
{
    private $options;

    public function __construct()
    {
        $this->options = [
            'key_id' => '54RHYNWG49', // The Key ID obtained from Apple developer account
            'team_id' => '43Y4943P47', // The Team ID obtained from Apple developer account
            'app_bundle_id' => 'com.sunroadco.sunroad', // The bundle ID for app obtained from Apple developer account
            'private_key_path' => storage_path('AuthKey_54RHYNWG49.p8'), // Path to private key
            'private_key_secret' => null // Private key secret
        ];
    }
    //use SoftDeletes;

    // *
    //  * The attributes that should be mutated to dates.
    //  *
    //  * @var array
     
    // protected $dates = ['deleted_at'];
    protected function isLogged($token)
    {
        $users = User::where('remember_token', $token)->get();
        if($token == '' || count($users) == 0)
        {
            echo json_encode(array('status' => 201, 'message' => 'Authentication failed'));
            exit();
        }
    }

    protected function pushTest(){
        $authProvider = AuthProvider\Token::create($this->options);
        $alert = Alert::create()->setTitle('Hello!');
        $alert = $alert->setBody('First push notification');

        $payload = Payload::create()->setAlert($alert);

        //set notification sound to default
        $payload->setSound('default');
        $payload->setBadge(4);

        //add custom value to your notification, needs to be customized
        $payload->setCustomValue('key', 'value');

        $deviceTokens = ['24267d020487652a853989110f78ddc4de450dfc99947a4858a7cf76cd0c1e25'];

        $notifications = [];
        foreach ($deviceTokens as $deviceToken) {
            $notifications[] = new Notification($payload,$deviceToken);
        }

        $client = new Client($authProvider, $production = false);
        $client->addNotifications($notifications);



        $responses = $client->push(); // returns an array of ApnsResponseInterface (one Response per Notification)

        foreach ($responses as $response) {
            $response->getApnsId();
            $response->getStatusCode();
            $response->getReasonPhrase();
            $response->getErrorReason();
            $response->getErrorDescription();
        }
    }

    protected function sendPush($deviceTokens, $title, $body, $badgeNum=0, $data=null){
        $authProvider = AuthProvider\Token::create($this->options);
        $alert = Alert::create()->setTitle($title);
        $alert = $alert->setBody($body);

        $payload = Payload::create()->setAlert($alert);

        //set notification sound to default
        $payload->setSound('default');
        $payload->setBadge($badgeNum);

        //add custom value to your notification, needs to be customized
        $payload->setCustomValue('data', $data);
        $notifications = [];
        foreach ($deviceTokens as $deviceToken) {
            $notifications[] = new Notification($payload,$deviceToken);
        }

        $client = new Client($authProvider, $production = true);
        $client->addNotifications($notifications);

        $responses = $client->push(); // returns an array of ApnsResponseInterface (one Response per Notification)
        foreach ($responses as $response) {
            $response->getApnsId();
            $response->getStatusCode();
            $response->getReasonPhrase();
            $response->getErrorReason();
            $response->getErrorDescription();
        }
    }

    protected function getAllUnread($user_id)
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
            $unread_number = $thread->receiverUnreadMessagesCount($currentUserId);
            $total_unreadMessage += $unread_number;
        }

        $pendingfollowers = DB::table('followers')->where('leader_id', $user_id)->where('status', 'pending')->where('isnew', '1')->get();
        $total_unreadFriendrequest = count($pendingfollowers);
    
        $acceptfollers = DB::table('followers')->where('follower_id', $user_id)->where('status', 'approved')->where('isnew', '1')->get();
        $total_unreadFriendaccept = count($acceptfollers);

        $notifications = DB::table('notifications')->where('user_id', $user_id)->where('seen', 1)->get();
        $total_notification = count($notifications);

        $receiveReqests = MessageRequest::where('receiver_id', $currentUserId)->where('state', 0)->orderBy('created_at', 'desc')->get();
        foreach ($receiveReqests as $key => $receive) {
            $unread_number = 0;
            if ($receive->isnew == 1) {
                $total_unreadMessage += 1;
            }
        }
        
        foreach ($threads as $key => $thread) {
            $participants = $thread->participants()->get();

            foreach ($participants as $key => $participant) {
                if ($participant->user->id != $currentUserId) {
                    $thread->user = $participant->user;
                    $uInfo = $this->getUserInfo($participant->user);
                    $receiveReqests = MessageRequest::where('sender_id', $self->id)->where('receiver_id', $uInfo['id'])->where('isnew', 1)->get();
                    if($participant->block == 0){
                        $p_count = $thread->receiverUnreadMessagesCount($participant->user->id);
                        if($p_count > 0){
                            // $total_unreadMessage += $p_count;
                        }else{
                            if(count($receiveReqests) > 0){
                                $total_unreadMessage += 1; 
                            }
                        }
                    }
                }
            }
        }

        $result = [
            'unreadMessage' => $total_unreadMessage,
            'unreadFriendrequest' => $total_unreadFriendrequest,
            'unreadAcceptrequest' => $total_unreadFriendaccept,
            'unreadAction' => $total_notification,
        ];

        return $result;
    }

    protected function getUserInfo($user){
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


}
