<?php

namespace App;

use Zizaco\Entrust\EntrustRole;

class Role extends EntrustRole
{
    /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
    protected $fillable = ['name', 'display_name', 'description'];

    public function users()
    {
        return $this->belongsToMany('App\User', 'role_user', 'role_id', 'user_id');
    }
}
