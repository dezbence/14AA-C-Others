<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PasswordForgotController extends Controller
{
    public function sendResetEmail(Request $request)
    {
        $request->validate(['email' => 'required|email']);

        $status = Password::sendResetLink($request->only('email'));

        return $status === Password::RESET_LINK_SENT
            ? response()->json(['message' => __($status)])
            : response()->json(['error' => __($status)], 400);
    }
}
