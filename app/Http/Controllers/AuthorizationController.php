<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
}
