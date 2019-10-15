<?php

namespace App\Http\Controllers;

use App\User;
use App\Post;
use App\Push;
use DB;
use Auth;
use App\Setting;

// use Guzzle\Service\Client;
use Illuminate\Http\Request;
use Theme;
class SettingController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Request $request)
    {
        $this->request = $request;
        $this->checkCensored();

        $this->middleware('auth');
    }

    public function getIndex()
	{

        $id = Auth::id();
        $u_cond['id'] = $id;
        $user = User::where($u_cond)->first();        
        $userinfo = [
            'id' => $user->id,
            'averageRate' => $user->avg_rating,
            'bio' => $user->bio,
            'displayName' => $user->displayName,
            'email' => $user->email,
            'firstName' => $user->firstName,
            'lastName' => $user->lastName,
            'location' => $user->location,
            'photoURL' => $user->photoURL,
            'website' => $user->website,
            'creativeField' => $user->creative_field,
        ];

		$title = trans('common.settings').' '.Setting::get('title_seperator').' '.Setting::get('site_title');
        $data = array(
            'user'          =>$userinfo,
            'title'         =>$title,
            );
        return view('settings')->with($data);
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
}
