<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Naux\Mail\SendCloudTemplate;
use Illuminate\Support\Facades\Mail;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'avatar', 'confirmation_token'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function owns(Model $model)
    {
        return $this->id = $model->user_id;
    }

    public function answers()
    {
        return $this->hasMany(Answer::class);
    }

    public function sendPasswordResetNotification($token)
    {
        $data = [
            'url' => route('password.reset', $token),
        ];
        $template = new SendCloudTemplate('zhihu_app_password_reset', $data);

        Mail::raw($template, function ($message) {
            $message->from('735624429@qq.com', 'Laravel');
            $message->to($this->email);
        });
    }
}
