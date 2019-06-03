<?php

namespace App\Http\Middleware;

use Closure;
use Tymon\JWTAuth\Token;
use Tymon\JWTAuth\JWTAuth;
use Illuminate\Support\Facades\Auth;

class JWTAuthenticate
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        // dd($request->user());
        // Middleware decode token từ front end JWT
        $rawToken = $request->cookie('token'); // Nhận token từ cookie front end
        dd($rawToken);
        $token = new Token($rawToken);
        $payload = JWTAuth::decode($token);
        Auth::loginUsingId($payload['sub']); // Get ID and Login
        // pass 
        return $next($request);

    }
}
