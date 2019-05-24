<?php

namespace App\Http\Controllers;

use App\User;
use Validator;
use Carbon\Carbon;
use App\PasswordReset;
use App\Enums\RoleType;
use App\Http\AppResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Notifications\RegisterActivate;
use Spatie\Permission\Models\Permission;
use Symfony\Component\HttpFoundation\Cookie;

class AuthController extends Controller
{
       /**
    * @OA\Post(
    *         path="/api/auth/register",
    *         tags={"Authentication"},
    *         summary="Register",
    *         description="Register a new user and send notification mail",
    *         operationId="register",
    *         @OA\Response(
    *             response=200,
    *             description="Successful operation"
    *         ),
    *         @OA\Response(
    *             response=422,
    *             description="Invalid input or email taken"
    *         ),
    *         @OA\Response(
    *             response=500,
    *             description="Server error"
    *         ),
    *         @OA\RequestBody(
    *             required=true,
    *             @OA\MediaType(
    *                 mediaType="application/x-www-form-urlencoded",
    *                 @OA\Schema(
    *                     type="object",
    *                     @OA\Property(
    *                         property="name",
    *                         description="Name",
    *                         type="string",
    *                     ), 
    *                     @OA\Property(
    *                         property="email",
    *                         description="Email",
    *                         type="string",
    *                     ),
    *                     @OA\Property(
    *                         property="password",
    *                         description="Password",
    *                         type="string",
    *                         format="password"
    *                     ),
    *                     @OA\Property(
    *                         property="password_confirmation",
    *                         description="Confirm password",
    *                         type="string",
    *                         format="password"
    *                     )
    *                 )
    *             )
    *         )
    * )
    */
    public function register(Request $request) 
    {
        // Ràng buộc dữ liệu
        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
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
            'name' => $request->name,
            'email' => $request->email,
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


        /**
    * @OA\Post(
    *         path="/api/auth/login",
    *         tags={"Authentication"},
    *         summary="Login",
    *         description="Login an user",
    *         operationId="login",
    *         @OA\Response(
    *             response=200,
    *             description="Successful operation"
    *         ),
    *         @OA\Response(
    *             response=422,
    *             description="Invalid input"
    *         ),
    *         @OA\Response(
    *             response=403,
    *             description="Wrong combination of email and password or email not verified"
    *         ),
    *         @OA\Response(
    *             response=500,
    *             description="Server error"
    *         ),
    *         @OA\RequestBody(
    *             required=true,
    *             @OA\MediaType(
    *                 mediaType="application/x-www-form-urlencoded",
    *                 @OA\Schema(
    *                     type="object",
    *                      @OA\Property(
    *                         property="email",
    *                         description="Email",
    *                         type="string",
    *                     ),
    *                     @OA\Property(
    *                         property="password",
    *                         description="Password",
    *                         type="string",
    *                         format="password"
    *                     ),
    *                 )
    *             )
    *         )
    * )
    */

    
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
            ], AppResponse::HTTP_UNPROCESSABLE_ENTITY);
        }
        // dd($request->all());
        // Nhận data từ client
        $credentials = request(['email', 'password']);
        $credentials['active'] = 1;
        $credentials['deleted_at'] = null;
        // Kiểm tra email password, kiểm tra tình trạng đã active hay chưa 
        $token = auth('api')->attempt($credentials);
        if(!$token) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'message' => 'Email hoặc mật khẩu không đúng xin vui lòng kiểm tra.'
            ],AppResponse::HTTP_OK);
        }
        // Get thông tin user
        $user = auth('api')->user();
        // dd($user);
        // Get quyền của user
        $data = $user;
        $roles = $data['roles'];
        $data['roles'] = $data->getRoleNames();
        $per = $this->getPermision($roles[0]->id);
        $data['permistion'] = $per;
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $data
        ], AppResponse::HTTP_OK)->withCookie('token', $token, config('jwt.ttl'),'/', null, false, true); // Set cookie  xuông browser
    }

    public function logout() {
        // Xóa cookie token
        auth()->logout(true);
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'message' => 'Đăng xuất thành công'
        ], AppResponse::HTTP_OK)->withCookie('token', '', config('jwt.ttl'),'/', null, false, true);
    }
    /**
    * @OA\Get(
    *         path="/api/auth/getUser",
    *         tags={"Authentication"},
    *         summary="Get user",
    *         description="Retrieve information from current user",
    *         operationId="getUser",
    *         @OA\Response(
    *             response=200,
    *             description="Successful operation"
    *         ),
    *         @OA\Response(
    *             response=500,
    *             description="Server error"
    *         ),
    * )
    */
    public function getUser(Request $request)
    {
        $data = $request->user();
        $roles = $data['roles'];
        $data['roles'] = $data->getRoleNames();
        $per = $this->getPermision($roles[0]->id);
        $data['permistion'] = $per;
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $data
        ], AppResponse::HTTP_OK);
    }
     /**
    * @OA\Get(
    *         path="/api/auth/register/activate/{token}",
    *         tags={"Authentication"},
    *         summary="Activate user",
    *         description="Activate an registered user",
    *         operationId="activateUser",
    *         @OA\Parameter(
    *             name="token",
    *             in="path",
    *             description="User activating token (should be included in the verification mail)",
    *             required=true,
    *             @OA\Schema(
    *                 type="string",
    *             )
    *         ),
    *         @OA\Response(
    *             response=200,
    *             description="Successful operation"
    *         ),
    *         @OA\Response(
    *             response=400,
    *             description="Invalid token"
    *         ),
    *         @OA\Response(
    *             response=500,
    *             description="Server error"
    *         ),
    * )
    */
    public function activate($token) 
    {
        $user = User::where('activation_token', $token)->first();
        if (!$user) 
        {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'message' => 'This activation token is invalid'
            ], AppResponse::HTTP_BAD_REQUEST);
        }
        // Cập nhập thông tin
        $user->active = true;
        $user->activation_token = '';
        $user->email_verified_at = Carbon::now();
        $user->save();

        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $user
        ], AppResponse::HTTP_OK);
    }

    public function createPasswordResetToken(Request $request) 
    {
        // Kiểm tra dữ liệu
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email',
        ]);
        if($validator->fails()) {
            return response()->json([
                'succes' => AppResponse::STATUS_FAILURE,
                'errors' => $validator->errors()
            ], AppResponse::HTTP_UNPROCESSABLE_ENTITY);
        }
        //  Tìm email
        $user = User::where('email', $request->email)->first();

        // Nếu ko tồn tại trả về message
        if(!$user) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'message' => 'Chúng tôi không tìm thấy Email trong hệ thống chúng tôi'
            ], AppResponse::HTTP_BAD_REQUEST);
        }
        // Nếu tìm thấy create new Token
        $passwordReset = PasswordReset::updateOrCreate(
            [
                'email' => $user->email,
            ],
            [
                'email' => $user->email,
                'token' => str_random(60)
            ]
        );
        if($user && $passwordReset) {
            $user->notify(new PasswordResetRequest($passwordReset->token));
        }

        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'message' => 'Chúng tôi đã gửi link đến địa chỉ email bạn.'
        ]);
    }

    public function findPasswordResetToken($token) {
        $passwordReset = PasswordReset::where('token', $token)->first();
        if(!$passwordReset) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'message' => 'This password reset token is invalid'
            ], AppResponse::HTTP_BAD_REQUEST);
        }
        if (Carbon::parse($passwordReset->updated_at)->addMinutes(720)->isPast()) {
            $passwordReset->delete();
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'message' => 'This password invalid'
            ]);
        }
        return response()->json([
            'success' => AppResponse::STATUS_SUCCCESS,
            'data' => $passwordReset
        ], AppResponse::HTTP_OK);
    }

    public function resetPassword(Request $request) {
        //  Ràng buộc dữ liệu
        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'email' => 'required|string|email|unique:users',
            'password' => 'required|string',
            'password_confirmation' => 'required|string:same:password',
            'token' => 'required|string'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE, 
                'errors'=>$validator->errors()
            ], AppResponse::HTTP_UNPROCESSABLE_ENTITY);
        }

        $passwordReset = PasswordReset::where([
            ['token', $request->token],
            ['email', $request->email]
        ])->first();
        if($passwordReset) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'message' => 'Dữ liệu không hợp lệ'
            ], AppResponse::HTTP_BAD_REQUEST);
        }
        $user = User::where('email', $passwordReset->email)->first();
        if(!$user) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                'message' => 'Không tìm tài khoản nào trùng với địa chỉ chỉ email này'
            ], AppRespose::HTTP_BAD_REQUEST);
        }
        // lưu new password
        $user->password= brcypt($request->password);
        $user->save();
        // xóa password reset token
        $passwordReset->delete();
        //  gửi mail thông báo
        $user->notify(new PasswordResetSuccess($passwordReset));
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $user
        ], AppResponse::HTTP_OK);
    }
    public function changePassword(Request $request) 
    {
        $user = $request->all();

        $email = $user->email;
        $validator = Validator::make($request->all(), [
            'password' => 'required|string',
            'new_password' => 'required|string|confirmed'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE, 
                'errors'=>$validator->errors()
            ], AppResponse::HTTP_UNPROCESSABLE_ENTITY);
        }

        // Kiểm tra email & password đúng mới đổi
        $credentials = request(['password']);
        $credentials['email'] = $email;
        $credentials['active'] = 1;
        $credentials['deleted_at'] = null;

        if(!Auth::guard('web')->attempt($credentials)) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE, 
                'message' => 'Email chưa được xác thực'
            ], AppResponse::HTTP_UNAUTHORIZED);
        }

        // save new password
        $user->password = bcrypy($request->new_password);
        $user->save();
        // send Email thông báo
        $user->notify(new PasswordChangeSuccess());

        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $user
        ], AppResponse::HTTP_OK);
    
    }

    public function getPermision($idRole) {
        return DB::table('role_has_permissions')->where('role_id', $idRole)->get();
    }
}
