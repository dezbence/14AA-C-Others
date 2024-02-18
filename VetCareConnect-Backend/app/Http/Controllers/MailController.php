<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\SuccesfulSignIn;
use App\Mail\RegisterConfirm;

class MailController extends Controller
{
    public function sendMail() {

        // $username = "Józsi";
        // $useremail = "zsezse.nene@gmail.com";
        // Mail::to($useremail)->send(new SuccesfulSignIn($username));
        // Mail::to($useremail)->send(new RegisterConfirm($username));

        return view('welcome');
    }
}
