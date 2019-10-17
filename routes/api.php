<?php

use Illuminate\Http\Request;
// use Symfony\Component\Routing\Annotation\Route;
use Illuminate\Support\Facades\Route;
// use Illuminate\Routing\Route;

// use Symfony\Component\Routing\Annotation\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// TODO: Remove this apis
Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:api');

//Mobile user api
Route::group(['prefix'=>'user'], function (){
    Route::post('/login',  'UserAPIController@login');
    Route::post('/register',  'UserAPIController@register');
    Route::post('/editProfile', 'UserAPIController@editProfile');
    Route::post('/getOwnInfo', 'UserAPIController@getOwnerinformation'); // Get user info
    Route::post('/getOtherInfo', 'UserAPIController@getOtherinformation');
    Route::post('/friendRequest', 'UserAPIController@sendFriendrequest');
    Route::post('/acceptFriend', 'UserAPIController@acceptFollowRequest');
    Route::post('/rejectFriend', 'UserAPIController@rejectFollowRequest');
    Route::post('/getArtists', 'UserAPIController@getArtists');
    Route::post('/giveReview', 'UserAPIController@giveReview');
    Route::get('/seeReviews', 'UserAPIController@seeReviews');
    Route::get('/getPendingFriends', 'UserAPIController@getPendingFriends');
    Route::get('/getFriends', 'UserAPIController@getFriends');
    Route::get('/getNotifications', 'UserAPIController@getNotifications');
    Route::post('/social_login', 'UserAPIController@social_login');
    Route::post('/deleteFriend', 'UserAPIController@deleteFriend');
    Route::post('/logout', 'UserAPIController@logout');

    Route::post('/sendPasschangeEmail', 'UserAPIController@sendPasschangeEmail');
    Route::post('/confirmPasswordcode', 'UserAPIController@confirmPasswordcode');
    Route::post('/changePassword', 'UserAPIController@changePassword');

    Route::get('/email_test', 'UserAPIController@email_test');
});

Route::group(['prefix'=>'post'], function (){
    Route::post('/createPost',  'PostAPIController@createPost');
    Route::post('/editPost', 'PostAPIController@editPost');
    Route::post('/addPostLike', 'PostAPIController@addPostLike');
    Route::post('/addPostComment', 'PostAPIController@addPostComment');
    Route::get('/getUserPosts', 'PostAPIController@getUserPosts'); //Get posts for user
    Route::get('/getPostComments', 'PostAPIController@getPostComments');
    Route::get('/getNewsFeeds', 'PostAPIController@getNewsFeeds'); 
    Route::post('/setPostHide', 'PostAPIController@setPostHide'); 
    Route::post('/disablePostHide', 'PostAPIController@disablePostHide'); 
    Route::post('/deletePost', 'PostAPIController@deletePost'); 
    Route::post('/checkPostRead', 'PostAPIController@checkPostRead');

});

Route::group(['prefix'=>'message'], function (){
    Route::post('/sendMessageRequest',  'MessageAPIController@sendMessageRequest');
    Route::post('/acceptMessageRequest',  'MessageAPIController@acceptMessageRequest');
    Route::post('/getChattingroom', 'MessageAPIController@getChattingroom');
    Route::post('/sendMessage', 'MessageAPIController@sendMessage');
    Route::get('/getUserchattinglist', 'MessageAPIController@getUserchattinglist');
    Route::get('/getPreviousMessages', 'MessageAPIController@getPreviousMessages');
    Route::get('/getConnectionList', 'MessageAPIController@getConnectionList');
    Route::post('/rejectMessageRequest', 'MessageAPIController@rejectMessageRequest');
    Route::post('/blockChattingroom', 'MessageAPIController@blockChattingroom'); 
    Route::post('/pushTest', 'MessageAPIController@pushTest');
    Route::get('/getTotalUnread', 'MessageAPIController@getTotalUnread'); 
    Route::post('/removeUnread', 'MessageAPIController@removeUnread'); 
    Route::post('/testUnread', 'MessageAPIController@testUnread'); 
    Route::get('/getThreadChattinglist', 'MessageAPIController@getThreadChattinglist');
    Route::post('/blockThreadUser', 'MessageAPIController@blockThreadUser');
});


//Create new api for frontend
// TODO: Changes All apis
Route::group(['prefix' => 'auth'], function () {
    Route::post('login','AuthAPIController@login');
    Route::post('register','AuthAPIController@register');
    Route::get('logout','AuthAPIController@logout');
    Route::get('check','AuthAPIController@check');
    Route::post('email-exist','AuthAPIController@emailExist');
});

// public route
Route::group(['prefix' => 'public'], function () {
    Route::get('get-creative-fields','PublicAPIController@getCreativeFields');
});

// user route
Route::group(['prefix' => 'users', 'middleware' => 'jwt.verify'], function (){
    Route::get('get-user','UsersAPIController@getUser');
});

Route::group(['prefix'=>'posts', 'middleware' => 'jwt.verify'], function (){
    Route::get('/get-posts',  'PostsAPIController@getPosts');
    Route::post('/add-post-like',  'PostsAPIController@addPostLike');
    Route::post('/add-post-comment',  'PostsAPIController@addPostComment');
});