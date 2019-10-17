<?php

use Cmgmyr\Messenger\Models\Message;
use Intervention\Image\Facades\Image;

// Route::get('/{any}', function () {
//     return view('app');
// })->where('any', '.*');

// /*
// |--------------------------------------------------------------------------
// | Image routes
// |--------------------------------------------------------------------------
// */

Route::get('user/avatar/{filename}', function ($filename) {
    return Image::make(storage_path().'/uploads/users/avatars/'.$filename)->response();
});

Route::get('user/cover/{filename}', function ($filename) {
    return Image::make(storage_path().'/uploads/users/covers/'.$filename)->response();
});

Route::get('user/gallery/video/{filename}', function ($filename) {
    $fileContents = Storage::disk('uploads')->get("users/gallery/{$filename}");
    $file = storage_path() . '/uploads/users/gallery/' . $filename;
    // $response = Response::make($fileContents, 200);
    // $response->header('Content-Type', 'video/mp4');

        $start = 0;
        $end = filesize($file) - 1;
        $size = filesize($file);
        $headers = array(
            // 'Accept-Ranges: 0-' . (filesize($file) -1) ,
            'Content-Type'=>'audio/mpeg',
            'Content-Range' => "bytes $start-$end/$size",

        );

    $stream = fopen($file, "r");

return Response::stream(function () use ($stream) {
    fpassthru($stream);
}, 200, $headers);
    // return $response;
});

Route::get('user/gallery/audio/{filename}', function ($filename) {

    $file = storage_path() . '/uploads/users/gallery/' . $filename;
    $path = $file;
    $fp = fopen($path, 'r');
    $etag = md5(serialize(fstat($fp)));
    fclose($fp);
    $fsize = filesize($path);
    $shortlen = $fsize - 1;

    $byteOffset = 0;
    $byteLength = $fileSize = $fsize;

    $mime_type = "audio/mpeg";
    $headers = array(
        // 'Accept-Ranges: 0-' . (filesize($file) -1) ,
        'Content-Length' => filesize($file),
        'Content-Type' => $mime_type,
        'Content-Disposition' => 'inline; filename="'.$filename.'"',
        'Pragma' => 'public',
        'Expires' => -1,
        'Content-Transfer-Encoding' => 'binary',
        'Content-Range' => sprintf('Content-Range: bytes %d-%d/%d', $byteOffset, $byteLength, $fileSize),
        'Accept-Ranges' => 'bytes',
        'X-Pad' => 'avoid browser bug',
        'Cache-Control' => 'no-cache',
        'Etag' => $etag

    );
    $file_location = $file;
    return response()->file($file, $headers);
//    $stream = fopen($file_location, "r");
//    return Response::stream(function () use ($stream) {
//        fpassthru($stream);
//    }, 200, $headers);
});

Route::get('user/gallery/{filename}', function ($filename) {
    return Image::make(storage_path().'/uploads/users/gallery/'.$filename)->response();
});


Route::get('page/avatar/{filename}', function ($filename) {
    return Image::make(storage_path().'/uploads/pages/avatars/'.$filename)->response();
});

Route::get('page/cover/{filename}', function ($filename) {
    return Image::make(storage_path().'/uploads/pages/covers/'.$filename)->response();
});

Route::get('group/avatar/{filename}', function ($filename) {
    return Image::make(storage_path().'/uploads/groups/avatars/'.$filename)->response();
});

Route::get('group/cover/{filename}', function ($filename) {
    return Image::make(storage_path().'/uploads/groups/covers/'.$filename)->response();
});

Route::get('setting/{filename}', function ($filename) {
    return Image::make(storage_path().'/uploads/settings/'.$filename)->response();
});

Route::get('event/cover/{filename}', function ($filename) {
    return Image::make(storage_path().'/uploads/events/covers/'.$filename)->response();
});

Route::get('event/avatar/{filename}', function ($filename) {
    return Image::make(storage_path().'/uploads/events/avatars/'.$filename)->response();
});

Route::get('/page/{pagename}', 'PageController@page');

Route::get('album/{filename}', function ($filename) {
    return Image::make(storage_path().'/uploads/albums/'.$filename)->response();
});

Route::get('wallpaper/{filename}', function ($filename) {
    return Image::make(storage_path().'/uploads/wallpapers/'.$filename)->response();
});


Route::get('/{vue?}', function () {
    return view('app');
})->where('vue', '[\/\w\.-]*')->name('home');