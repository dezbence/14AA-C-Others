<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class VerificationController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('signed')->only('verify');
        $this->middleware('throttle:6,1')->only('verify', 'resend');
    }

    // /**
    //  * Display an email verification notice.
    //  *
    //  * @return \Illuminate\Http\Response
    //  */
    public function notice(Request $request)
    {
        return $request->user()->hasVerifiedEmail();
    }

    // /**
    //  * User's email verificaiton.
    //  *
    //  * @param  \Illuminate\Http\EmailVerificationRequest $request
    //  * @return \Illuminate\Http\Response
    //  */
    public function verify(EmailVerificationRequest $request)
    {
        $request->fulfill();
    }

    // /**
    //  * Resent verificaiton email to user.
    //  *
    //  * @param  \Illuminate\Http\Request  $request
    //  * @return \Illuminate\Http\Response
    //  */
    public function resend(Request $request)
    {
        $request->user()->sendEmailVerificationNotification();
        return back()
        ->withSuccess('A fresh verification link has been sent to your email address.');
    }

}