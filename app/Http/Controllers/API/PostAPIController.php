<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\AppBaseController;
use App\Http\Requests\API\CreateUserAPIRequest;
use App\Http\Requests\API\UpdateUserAPIRequest;
use App\Repositories\UserRepository;
use App\User;
use App\Post;
use App\Push;
use App\Notification;
use App\Comment;
use Illuminate\Support\Facades\Mail;
use Illuminate\Http\Request;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use InfyOm\Generator\Utils\ResponseUtil;
use Prettus\Repository\Criteria\RequestCriteria;
use Response;
use Validator;
use DB;
use Auth;
use Folour\Flavy\Flavy;
use App\Media;
use Carbon\Carbon;
use Teepluss\Theme\Facades\Theme;
use Config;
use App\Setting;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Storage;
use SebastianBergmann\Environment\Console;
/**
 * Class UserController.
 */
class PostAPIController extends AppBaseController
{
    /** @var UserRepository */
    private $userRepository;

    public function __construct(UserRepository $userRepo)
    {
        $this->userRepository = $userRepo;
    }

    //Add email to mailchimp list
    public function createPost(Request $request)
    {
        $input = $request->all();
        $input['timeline_id'] = 1;
        // $post->notifications_user()->sync([Auth::user()->id], true);
        $img_state = false;

        if ($request->file('image')) {
            $postImage = $request->file('image');
           $img_state = true;
            $photoName = time().'_'.$postImage->getClientOriginalName();
            $avatar = Image::make($postImage->getRealPath());
            // $avatar->orientate();
           
            $avatar->save(storage_path().'/uploads/users/gallery/'.$photoName, 60);

            list($width, $height) = getimagesize(storage_path().'/uploads/users/gallery/'.$photoName);
            $input['photo_width'] = $width;
            $input['photo_height'] = $height;
            $input['photoURL'] = $photoName;
        }

        if ($request->hasFile('audio')) {
            $uploadedFile = $request->file('audio');
            $s3 = Storage::disk('uploads');
            $timestamp = date('Y-m-d-H-i-s');
            $strippedName = $timestamp.str_replace(' ', '', $uploadedFile->getClientOriginalName());
            $s3->put('users/gallery/'.$strippedName, file_get_contents($uploadedFile));
            $basename = $timestamp.basename($request->file('audio')->getClientOriginalName(), '.'.$request->file('audio')->getClientOriginalExtension());
            $input['audioURL'] = $strippedName;

        }

        $post = Post::create($input);     
        return response()->json(['status' => '200', 'data' => $post]);
    }

    public function editPost(Request $request)
    {
        $input = $request->all();
        $post = Post::where('id', $request->post_id)->with('user')->first();
        $post->title = $request->title;
        $post->youtubeURL = $request->youtubeURL;
        $post->content = $request->content;
        $post->bandcamURL = $request->bandcamURL;
        $post->type = $request->type;

        if ($request->file('image')) {
            $oldImage = $post->photoURL;
            if($oldImage && $oldImage != ''){
                Storage::delete('uploads/users/gallery', $oldImage);
            }

            $postImage = $request->file('image');
            $strippedName = str_replace(' ', '', $postImage->getClientOriginalName());
            $photoName = date('Y-m-d-H-i-s').$strippedName;

            $avatar = Image::make($postImage->getRealPath());
            $avatar->save(storage_path().'/uploads/users/gallery/'.$photoName, 60);
            $media = Media::create([
                    'title'  => $photoName,
                    'type'   => 'image',
                    'source' => $photoName,
                ]);
            $post->photoURL = $photoName;
            list($width, $height) = getimagesize(storage_path().'/uploads/users/gallery/'.$photoName);
            $post->photo_width = $width;
            $input->photo_height= $height;
        }

        if ($request->hasFile('audio')) {
            $oldFile = $post->audioURL;
            if($oldFile && $oldFile!=''){
                Storage::delete('uploads/users/gallery', $oldFile);
            }

            $uploadedFile = $request->file('audio');
            $s3 = Storage::disk('uploads');
            $timestamp = date('Y-m-d-H-i-s');
            $strippedName = $timestamp.str_replace(' ', '', $uploadedFile->getClientOriginalName());
            $s3->put('users/gallery/'.$strippedName, file_get_contents($uploadedFile));
            $basename = $timestamp.basename($request->file('audio')->getClientOriginalName(), '.'.$request->file('audio')->getClientOriginalExtension());

            $media = Media::create([
                      'title'  => $basename,
                      'type'   => 'audio',
                      'source' => $strippedName,
                    ]);
            $post->audioURL = $strippedName;
        }

        $post->save();
        return response()->json(['status' => '200']);
    }

    public function addPostLike(Request $request){
        $post = Post::findOrFail($request->post_id);
        $posted_user = $post->user;     
        $like_count = $post->users_liked()->count();
        $token = $request->token;
        $self = User::where('remember_token', $token)->first();
        $self_id = $self->id;
        //Like the post
        if (!$post->users_liked->contains($self_id)) {
            $post->users_liked()->attach($self_id, ['created_at' => Carbon::now(), 'updated_at' => Carbon::now()]);
            $post->notifications_user()->attach($self_id);

            //Notify the user for post like
            $notify_message = ' dug your post';
            $notify_type = 'dug';
            $status_message = 'successfully dug';
            if ($post->user->id != $self_id) {
                Notification::create(['user_id' => $post->user->id, 'post_id' => $post->id, 'notified_by' => $self_id, 'description' => $self->displayName.' '.$notify_message, 'type' => $notify_type]);
            }
            $like_count = $post->users_liked()->count();

            //push initial
            $deviceTokens = array();
            $receiver = $posted_user;
            array_push($deviceTokens, $receiver->deviceToken);
            $messageBody = $self->displayName.' '.$notify_message;

            $unreads = Push::getAllUnread($receiver->id);
            $pushdata = [
                'type' => 'dug',
                'unread_numbers' => $unreads,
                'post_id' => $post->id
            ];
            Push::sendPush($deviceTokens, 'Post dig', $messageBody, $like_count, $pushdata);
            return response()->json(['status' => '200', 'liked' => true, 'message' => $status_message, 'likecount' => $like_count]);
        } //Unlike the post
        else {
            $post->users_liked()->detach([$self_id]);
            $post->notifications_user()->detach([$self_id]);
            $notification =Notification::where('post_id', $post->id)->where('notified_by', $self_id)->first();
            if($notification){
                $notification->delete();
                
            }
            $like_count = $post->users_liked()->count();
            return response()->json(['status' => '200', 'liked' => false, 'likecount' => $like_count]);
        }

        return response()->json(['status' => '200']);
    }

    public function addPostComment(Request $request)
    {
        $token = $request->token;
        $self = User::where('remember_token', $token)->first();
        $self_id = $self->id;

        $comment = Comment::create([
                    'post_id'     => $request->post_id,
                    'description' => $request->description,
                    'user_id'     => $self_id,
                    // 'parent_id'   => $request->comment_id,
                  ]);

        $post = Post::where('id', $request->post_id)->first();
        $posted_user = $post->user;

        if ($comment) {
            if ($self_id != $post->user_id) {
                //Notify the user for comment on his/her post
                Notification::create(['user_id' => $post->user_id, 'post_id' => $request->post_id, 'notified_by' => $self_id, 'description' => $self->displayName.' gave their 2 cents on your post.', 'type' => 'comment_post']);
            }

            //push initial
            $deviceTokens = array();
            $receiver = $posted_user;
            array_push($deviceTokens, $receiver->deviceToken);
            $messageBody = $self->displayName.' gave their 2 cents on your post';

            $commentedNumber = count($posted_user->comments());
            $unreads = Push::getAllUnread($receiver->id);
            $pushdata = [
                'type' => 'comment',
                'unread_numbers' => $unreads,
                'post_id' => $post->id
            ];
            Push::sendPush($deviceTokens, 'New comment', $messageBody, $commentedNumber, $pushdata);
        }
        return response()->json(['status' => '200', 'comment_id' => $comment->id]);
    }

    public function checkPostRead(Request $request)
    {
        $post_id = $request->post_id;
        DB::table('notifications')->where('post_id', $post_id)->update(['seen' => 0]);
        return response()->json(['status' => '200']);
    }

    public function getUserPosts(Request $request){
        $token = $request->token;
        $self = User::where('remember_token', $token)->first();
        $self_id = $self->id;

        $user_id = $request->user_id;
        $user = User::where('id', $user_id)->first();
        $disyplayName = $user->displayName;
        $currentPage = 1;
        if($request->page){
            $currentPage = $request->page;
        }

        if($self_id*1 == $user_id*1){
            $posts = Post::where('user_id', $user_id)->orderBy('created_at', 'desc')->paginate(Setting::get('items_page'));
        }else{
            $posts = Post::where('user_id', $user_id)->where('hide', '0')->orderBy('created_at', 'desc')->paginate(Setting::get('items_page'));
        }
        
        $lastPage = $posts->lastPage();
        $items = $posts->items();
        $postsInfo = array();
        $i = 0;
        for($i = 0; $i < count($items); $i++){
            $postInfo = $this->getPostInfo($items[$i], $self_id);
            array_push($postsInfo, $postInfo);
        }
        return response()->json(['status' => '200', 'postsInfo' => $postsInfo, 'lastPage' => $lastPage]);
    }

    public function getNewsFeeds(Request $request){
        $token = $request->token;
        $self = User::where('remember_token', $token)->first();
        $self_id = $self->id;

        $user_id = $request->user_id;
        $user = User::where('id', $user_id)->first();
        $id_arr = array();
        array_push($id_arr, $user_id);
        $friends_1 = $user->followers()->where('status', 'approved')->get();
        for($id = 0; $id < count($friends_1); $id++){
            array_push($id_arr, $friends_1[$id]->id);
        }

        $friends_2 = $user->following()->where('status', 'approved')->get();
        for($id = 0; $id < count($friends_2); $id++){
            array_push($id_arr, $friends_2[$id]->id);
        }
    
        $disyplayName = $user->displayName;
        $currentPage = 1;
        if($request->page){
            $currentPage = $request->page;
        }
        $posts = Post::whereIn('user_id', $id_arr)->where('hide', '0')->orderBy('created_at', 'desc')->paginate(Setting::get('items_page'));
        $lastPage = $posts->lastPage();
        $items = $posts->items();
        $postsInfo = array();
        $i = 0;
        for($i = 0; $i < count($items); $i++){
            $postinfo = $this->getPostInfo($items[$i], $self_id);

            array_push($postsInfo, $postinfo);
        }
        return response()->json(['status' => '200', 'postsInfo' => $postsInfo, 'lastPage' => $lastPage]);
    }

    public function getPostInfo($postItem, $self_id){
        $post_id = $postItem->id;
        $post_likes = $postItem->postsLiked()->where('post_id', $post_id);
        $post_comments = $postItem->allComments()->get();

        $puser_id = $postItem->user_id;
        $puser = User::where('id', $puser_id)->first();
        $puserName = $puser->displayName;

        if($postItem->photoURL && $postItem->photoURL != ''){
            $postItem->photoURL = url('user/gallery/'.$postItem->photoURL);
        }

        if($postItem->audioURL && $postItem->audioURL != ''){
            $postItem->audioURL = url('user/gallery/audio/'.$postItem->audioURL);
        }

        $liked = false;
        if($postItem->users_liked->contains($self_id)){
            $liked = true;
        }else{
            $liked = false;
        }

        if($postItem->hide == 1){
            $hided = true;
        }else{
            $hided = false;
        }

        $postInfo = [
            'youtubeURL' => $postItem->youtubeURL,
            'bandcamURL' => $postItem->bandcamURL,
            'content' => $postItem->content,
            'image' => $postItem->photoURL,
            'audio' => $postItem->audioURL,
            'likes' => count($post_likes),
            'comments' => count($post_comments),
            'liked' => $liked,
            'type' => $postItem->type,
            'created_at' => $postItem->created_at,
            'displayName' => $puserName,
            'user_id' => $puser_id,
            'liked' => $liked,
            'post_id' => $postItem->id,
            'hided' => $hided,
            'photo_width' => $postItem->photo_width,
            'photo_height' => $postItem->photo_height
        ];
        return $postInfo;
    }

    public function getPostComments(Request $request){
        $comments_arr = array();
        $currentPage = 1;
        if($request->page){
            $currentPage = $request->page;
        }
        $post_id = $request->post_id;
        $post = Post::where('id', $post_id)->first();
        $post_comments = $post->allComments()->orderBy('created_at', 'asc')->paginate(Setting::get('items_page'));
        
        $items = $post_comments->items();
        $lastPage = $post_comments->lastPage();

        for($i = 0; $i < count($items); $i ++){
            $item = $items[$i];
            $user_id = $item->user_id;
            $user = User::where('id', $user_id)->first();
            if($user->photoURL && $user->photoURL != ''){
                $user->photoURL = url('user/avatar/'.$user->photoURL);
            }else{
                $user->photoURL = url('user/avatar/default.png');
            }
            $comentInfo = [
                'id' => $item->id,
                'description' => $item->description,
                'user_photo' => $user->photoURL,
                'user_id' => $user->id,
                'displayName' => $user->displayName,
                'created_at' => $item->created_at
            ];
            array_push($comments_arr, $comentInfo);
        }
        return response()->json(['status' => '200', 'comments' => $comments_arr, 'lastPage' => $lastPage]);
    }

    public function setPostHide(Request $request){
        $post_id = $request->post_id;
        $post = Post::where('id', $post_id)->first();
        if($post->hide == 0){
            $post->hide = 1;
        }else if($post->hide == 1){
            $post->hide = 0;
        }
        $post->save();
        if($post->hide == 0){
            $hided = false;
        }else if($post->hide == 1){
            $hided = true;
        }
        return response()->json(['status' => '200', 'hided' => $hided]);
    }

    public function disablePostHide(Request $request)
    {
        $post_id = $request->post_id;
        $post = Post::where('id', $post_id)->first();
        $post->hide = 0;
        $post->save();
        if($post->hide == 0){
            $hided = false;
        }else if($post->hide == 1){
            $hided = true;
        }
        return response()->json(['status' => '200', 'hided' => $hided]);
    }

    public function deletePost(Request $request)
    {
        $post_id = $request->post_id;
        $post = Post::where('id', $post_id)->first();
        $result = $post->deleteMe();
        // $result = $post->delete();
        return response()->json(['status' => '200', 'result' => $result]);
    }
}
