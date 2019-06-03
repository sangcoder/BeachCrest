<?php

namespace App\Http\Controllers;

use App\User;
use App\SocialNetwork;
use App\Enums\RoleType;
use App\Http\AppResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Cookie;
use Laravel\Socialite\Facades\Socialite;
// use Spatie\Permission\Models\Permission;
use Tymon\JWTAuth\Contracts\Providers\Auth;

class SocialAuthController extends Controller
{

    // Dang nhap mang xa hoi google facebook
    public function redirectFacebook () {
        return Socialite::driver('facebook')->redirect();
    }
    public function callbackFacebook () {

        $response = Socialite::driver('facebook')->user();
        // dd($response);
        $token = $response->token;
        if (!$token) {
            return response()->json([
                'messages' => 'Đăng nhập facebook thất bại'
            ],config('code.user.login_facebook_failed'));
        }

        try {
            $profile = $response->user;
            if(!$profile || !isset($profile['id'])) {
                return response()->json([
                    'messages' => 'Đăng nhập facebook thất bại'
                ],config('code.user.login_facebook_failed'));
            }
            $email = $profile['email'] ?? null;
            $social = SocialNetwork::where('social_id', $profile['id'])->where('type', 1)->first();
            if ($social) {
                $user = $social->user;
            } else {
                $user = $email ? User::firstOrCreate(['name' => $profile['name'],'email' => $email, 'photo' => $response->avatar, 'active' => 1]) : User::create();
                $user->roles()->syncWithoutDetaching([
                    1 => [
                        'model_type' => 'App\User'
                    ]
                ]);
                $user->socialNetWork()->create([
                    'social_id' => $profile['id'],
                    'type' => 1
                ]);
                $user->name = $profile['name'];
                $user->save();
            }
            // dd($user);
            $userToken = JWTAuth::fromUser($user);
            $cookie = cookie('token', $userToken, 600);
            return redirect('/auth/login')->withCookie($cookie);
            

        } catch (\Exception $e) {
            Log::error('Error when login with facebook: ' . $e->getMessage());
        }
    }
    public function redirectGoogle () {
        return Socialite::driver('google')->redirect();
    }

    public function callbackGoogle () {
        
    }

}
