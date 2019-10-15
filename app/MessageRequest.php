<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

//use Illuminate\Database\Eloquent\SoftDeletes;

class MessageRequest extends Model
{
    //use SoftDeletes;

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    //protected $dates = ['deleted_at'];
    protected $table = 'msg_request';

    protected $fillable = ['sender_id', 'receiver_id', 'state', 'isnew', 'created_at', 'updated_at', 'deleted_at'];

}
