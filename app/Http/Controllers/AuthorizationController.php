<?php

namespace App\Http\Controllers;

use App\Http\AppResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;

class AuthorizationController extends Controller
{
    public function getListRoles() {
        $role = DB::table('roles')->get();
        return $role;
    }

    public function getPermissionByRole($id) {
        $permission = DB::table('role_has_permissions')
            ->where('role_id', '=',$id)
            ->join('permissions','role_has_permissions.permission_id', '=', 'id')
            ->select('permission_id','name')
            ->get();
        return $permission;
    }
    public function getAllPermission() {
        $per = DB::table('permissions')
        ->get();
        return $per;
    }

    public function addPermissionToRole (Request $request) {
        $role = Role::find($request->roleId);
        $role->permissions()->sync($request->valueRoles);
        // dd($role->permissions);
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS
        ]);
    }

    public function addNewRole (Request $request) {
        // dd($request->all());
        $newRole = Role::create(['name' => $request->NameRoles]);
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS,
            'data' => $newRole
        ]);
    }
    public function deleteUserRole (Request $request) {
        dd($request->all());
    }
    public function deleteRoles (Role $role) {
        // Không xóa được 3 quyền mặc định của hệ thống
        if(in_array($role->id, [1, 2, 3])) {
            return response()->json([
                'success' => AppResponse::STATUS_FAILURE,
                "message" => "Không xóa được quyền mặc định của hệ thống"
            ]);
        } else {
            $role->delete();
            return response()->json([
                'success' => AppResponse::STATUS_SUCCESS
            ]);
        }

    }
}
