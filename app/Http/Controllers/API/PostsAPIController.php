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

use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
/**
 * Class PostsAPIController.
 */
class PostsAPIController extends AppBaseController
{
    /** @var UserRepository */
    private $userRepository;

    public function __construct(UserRepository $userRepo)
    {
        $this->userRepository = $userRepo;
    }

    /**
     * API for getting all posts
     */
    public function getPosts(Request $request)
    {
        $user = JWTAuth::user();
        $page = $request->query('page');
        $pageNum = (int)$page;
        $query = 'SELECT posts.id, posts.isnew, posts.content, posts.youtubeURL,posts.bandcamURL, posts.photoURL, posts.audioURL, posts.type, posts.created_at, posts.user_id, posts.hide, users.photoURL as poster_photo, users.displayName as poster, post_likes.count as likes, comments.count as comments, liked.user_id as liked FROM `posts` LEFT JOIN users on posts.user_id=users.id left join (SELECT count(*) as count, post_likes.post_id from post_likes GROUP by post_likes.post_id) as post_likes on post_likes.post_id=posts.id left join (SELECT count(*) as count, comments.post_id from comments GROUP by comments.post_id) as comments on comments.post_id=posts.id left join (SELECT * from post_likes where post_likes.user_id='.$user->id.') as liked on liked.post_id=posts.id ORDER by posts.created_at DESC LIMIT 10 OFFSET '.$pageNum*10;

        $posts = DB::select( DB::raw($query) );
        $lastPage = DB::table('posts')->paginate(10)->lastpage();
        return response()->json(['posts' => $posts, 'lastPage'=>$lastPage, 'user'=>$user]);
    }
    
    /**
     * API for adding like or unlike
     */
    public function addPostLike(Request $request)
    {
        $user = JWTAuth::user();
        $post_id = $request->post_id;
        $liked = DB::table('post_likes')->where([
            'user_id' => $user->id,
            'post_id' => $post_id,
        ])->first();

        $islike = 0;
        if($liked){
            DB::table('post_likes')->where(['user_id' => $user->id,'post_id' => $post_id])->delete();
        }else{
            DB::table('post_likes')->insert(['post_id' => $post_id, 'user_id'=>$user->id, 'created_at'=>Carbon::now(), 'updated_at'=>Carbon::now()]);
            $islike = 1;
        }
        return response()->json(['isLike'=>$islike], 200);
    }

    /**
     * API for adding Comments
     */
    public function addPostComment(Request $request)
    {
        $user = JWTAuth::user();
        $post_id = $request->post_id;
        $description = $request->description;
        DB::table('comments')->insert(['post_id' => $post_id, 'user_id'=>$user->id, 'description'=>$description, 'created_at'=>Carbon::now(), 'updated_at'=>Carbon::now()]);
        return response()->json(['message'=>'success'], 200);
    }

    /**
     * API for getting Comments for post
     */
    public function getCommentsforPost(Request $request)
    {
        $post_id = $request->post_id;
        $query = 'SELECT comments.*, users.displayName as commenter_name, users.photoURL as commenter_photo from comments left join users on users.id=comments.user_id where comments.post_id='.$post_id.' order by comments.created_at desc';
        $comments = DB::select( DB::raw($query) );
        return response()->json(['comments'=>$comments], 200);
    }
}
