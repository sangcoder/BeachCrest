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

    public function deleteRoles (Role $role) {
        $role->delete();
        return response()->json([
            'success' => AppResponse::STATUS_SUCCESS
        ]);
    }
}
