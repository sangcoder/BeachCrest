<?php

namespace App\Http\Controllers;

use Validator;
use App\Http\AppResponse;
use Illuminate\Http\Request;
use App\Notifications\RegisterActivate;

class AuthController extends Controller
{
    public function register(Request $request) 
    {
        // Ràng buộc dữ liệu
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|unique:users',
            'password' => 'required|string',
            'password_confirmation' => 'required|string:same:password'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE, 
                'errors' => $validator->errors()
            ], AppResponse::HTTP_UNPROCESSABLE_ENTITY);
        }
        // Lưu user vào CSDL
        $user = new User([
            'email' => $request->$request->email,
            'password' => bcrypt($request->password),
            'activation_token' => str_random(60)
        ]);
        $user->save();
        // Tất cả đăng kí mới mặc định là member
        $user->assignRole(RoleType::MEMBER);
        // Gửi email xác thực tài khoản
        $user->notify(new RegisterActivate($user));
        // trả về status
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $user
        ],AppResponse::HTTP_OK);
    }

    // Login API
    public function login(Request $request) 
    {
        // Kiểm tra data
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email',
            'password' => 'required|string'
        ]);
        // Nếu có lỗi trả về front end
        if($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'errors' => $validator->errors()
            ], AppResponsee::HTTP_UNPROCESSABLE_ENTITY);
        }
        // dd($request->all());
        // Nhận data từ client
        $credentials = request(['email', 'password']);
        $credentials['active'] = 1;
        $credentials['delete_at'] = null;
        // Kiểm tra email password, kiểm tra tình trạng đã active hay chưa 
        $token = auth('api')->attempt($credentials);
        if(!$token) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'message' => 'Email chưa được xác thực. Vui lòng check mail để xác thực xin cảm ơn.'
            ],AppResponse::HTTP_UNAUTHORIZED);
        }
        // Get thông tin user
        $user = auth('api')->user();
        // Get quyền của user
        $user['roles'] = $user->getRoleNames();

        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $user
        ], AppResponse::HTTP_OK)->withCookie('token', $token, config('jwt.ttl'),'/', null, false, true); // Set cookie  xuông browser
    }
}
