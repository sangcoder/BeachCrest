<?php

namespace App;

use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasRoles;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable implements MustVerifyEmail, JWTSubject
{
    use HasRoles, SoftDeletes, Notifiable;


    protected $dates = ['deleted_at'];
    
    protected $fillable = [
        'name', 'email', 'bio','photo', 'active', 'activation_token','password'
    ];

    protected $hidden = [
        'password', 'remember_token', 'activation_token'
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function reviews() {
        return $this->hasMany('App\Model\Review', 'user_id');
    }
    public function socialNetWork()
    {
        return $this->hasMany(SocialNetwork::class);
    }

    public function roles() {
        return $this->belongsToMany(Role::class, 'model_has_roles', 'model_id','role_id');
    }
    public function bookings () {
        return $this->hasMany('App\Model\Booking', 'user_id');
    }
    // Để sử dụng được JWT Auth

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }
}
