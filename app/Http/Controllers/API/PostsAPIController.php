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

    public function getPosts(Request $request)
    {
        $page = $request->query('page');
        $posts = Post::where('user_id', $user_id)->orderBy('created_at', 'desc')->paginate(Setting::get('items_page'));
        
        return response()->json(['status' => '200', 'postsInfo' => $postsInfo, 'lastPage' => $lastPage]);
        
        return response()->json(['page' => $name]);
    }
}
