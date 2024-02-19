<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MailController extends Controller
{
    public function sendRegisterConfirmMail() {
        Mail::to($request->email)->send(new RegisterConfirm($request->email, $request->name));
    }

    public function sendLoginMail() {
        Mail::to($request->email)->send(new SuccesfulSignIn($request->email, $request->name));
    }

    public function sendPasswordResetMail() {
        Mail::to($request->email)->send(new PasswordReset($request->email, $request->name));
    }


}
