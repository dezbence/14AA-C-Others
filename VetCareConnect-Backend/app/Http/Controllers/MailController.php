<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

use App\Mail\RegisterConfirm;
use App\Mail\PasswordReset;


class MailController extends Controller
{
    public function sendRegisterConfirmMail() {
        Mail::to($request->email)->send(new RegisterConfirm($request->email, $request->name));
    }

    public function sendPasswordResetMail(Request $request) {
        // dd($request->input('email'));
        Mail::to($request->input('email'))->send(new PasswordReset($request->email));
    }


}
