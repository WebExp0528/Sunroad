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


/**
 * Class UserController.
 */
class PublicAPIController extends AppBaseController
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
    public function getCreativeFields(Request $request)
    {
      
      $data = DB::select( DB::raw("SELECT * FROM creative_fields ORDER BY INET_ATON(SUBSTRING_INDEX(CONCAT(path,'.0.0.0'),'.',4))") );
      return response()->json(['data' => $data], 200);
    }

}
