<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Laravel\Socialite\Facades\Socialite;

class SocialAuthController extends Controller
{

    // Dang nhap mang xa hoi google facebook
    public function redirectFacebook () {
        return Socialite::driver('facebook')->redirect();
    }
    public function callbackFacebook () {
        $user = Socialite::driver('facebook')->user();
        dd($user->user);
    }
    // đăng nhập facebook
    public function facebook (Request $request) {
        $facebook = $request->only('access_token');
        if (!$facebook || !isset($facebook['access_token'])) {
            return $this->responseErrors(config('code.user.login_facebook_failed'), 'Đăng nhập facebook thất bại');
        }
        // Khởi tạo Facebook graph SDK
        $fb = new Facebook([
            'app_id' => config('services.facebook.app_id'),
            'app_secret' => config('services.facebook.app_secret'),
        ]);
        try {
            // get thông tin facebook qua access token
            $response = $fb->get('/me?fields?=id,name,email,link,birthday', $facebook['access_token']);
            $profile = $response->getGraphUser();
            if (!$profile || !isset($profile['id'])) {
                // Không lây được thông tin user
                return reponse()->json([
                    'success' =>  AppResponse::STATUS_FAILURE
                ], config('code.user.login_facebook_failed'));
            }

            $email = $profile['email'] ?? null;
            $social = SocialNetwork::where('social_id', $profile['id'])-where('type', 1)->first();
            // Kiểm tra userId facebook tồn tại trong bảng social network
            // => nếu có đã đăng nhập rồi => tạo token jwt trả về client
            // => Nếu chưa, tiếp tục kiểm tra email => đã tồn tại trong hệ thồng thì lấy user đó
            // => Nếu chưa có hết tạo bản ghi mới vào social network trả về token cho client
            if ($social) {
                $user = $social->user;
            } else {
                $user = $email? User::firstOrCreate(['email' => $email]) : User::create();
                $user->socialNetWork([
                    'social_id' => $profile['id'],
                    'type' => 1
                ]);
                $user->name = $profile['name'];
                $user->save();
                // Create token 
                $token = JWTAuth::fromUser($user);
                return response()->json([
                    'success' => AppResponse::STATUS_SUCCESS,
            ], AppResponse::HTTP_OK)->withCookie('token', $token, config('jwt.ttl'),'/', null, false, true);
            }
        } catch (\Exception $e) {
            Log::error('Error when login with facebook: ' . $e->getMessage());

        }
        
    }
}
