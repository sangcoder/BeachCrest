<?php

namespace App\Http\Controllers\API;

use App\User;
use App\Http\AppResponse;
use Illuminate\Http\Request;
use App\Http\Requests\UserRequest;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
        /**
    * @OA\Get(
    *         path="/api/user",
    *         tags={"User Manager"},
    *         summary="Get list user",
    *         description="Nhận thông tin của user",
    *         operationId="index",
    *         @OA\Response(
    *             response=200,
    *             description="Thành công"
    *         ),
    *         @OA\Response(
    *             response=500,
    *             description="Server error"
    *         ),
    * )
    */
    public function index(Request $request)
    {
        // return UserResource::collection(User::paginate(10));
        $query = DB::table('users')
                ->join('model_has_roles', 'users.id', '=', 'model_has_roles.model_id')
                ->join('roles', 'roles.id', '=', 'model_has_roles.role_id')
                ->select('users.id','users.name','users.email','users.bio','users.photo','users.active', 'roles.name as roleName');
                // ->orderBy('users.id', 'asc');
        
        if ($request->exists('sortById') && $request->sortById == 'ascend') {
            $query->orderBy('users.id', 'asc');
        }
        if ($request->exists('sortById') && $request->sortById == 'descend') {
            $query->orderBy('users.id', 'desc');
        }
        if($request->exists('searchEmail')) {
            $query->where('users.email', 'LIKE','%'. $request->searchEmail .'%');
        }
        if($request->exists('active')) {
            $query->where('active','=',$request->active);
        }
        $user = $query->paginate(5);
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $user
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(UserRequest $request)
    {
        // return $request->all();
        $user = new User;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->bio = $request->bio;
        $user->photo = $request->photo;
        $user->password = Hash::make($request->password);
        $user->save();
        return ['data' => $user];
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $user = User::findOrFail($id);

        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email|unique:users,email,'.$user->id,
            'password' => 'sometimes|min:6'
        ]);
        if ($request->photo) {
            $imageName = preg_match_all('/data\:image\/([a-zA-Z]+)\;base64/',$request->photo,$matched);
            $ext = isset($matched[1][0]) ? $matched[1][0] : false;
            $imageName = sha1(time()) . '.' .$ext;
            \Image::make($request->photo)->save(public_path('/images/user').$imageName);
            return $imageName;
        }

        // $user->update($request->all());
        // return [
        //     'message' => 'Updated user'
        // ];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::findOrFail($id);
        //  Delete user
        $user->delete();
        return [
            'message' => 'User Deleted'
        ];
    }
}
