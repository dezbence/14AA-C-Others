<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ApiCode;
use App\Models\Owner;
use App\Models\Vet;

class VerificationController extends BaseController
{

    public function verify($user_id, Request $request) {
        if (!$request->hasValidSignature()) {
            return response()->json(["msg" => "Invalid/Expired url provided."], 401);
        }



        // $vet = Vet::findOrFail($user_id);
        $owner = Owner::findOrFail($user_id);

        if (!$owner->hasVerifiedEmail()) {
            $owner->markEmailAsVerified();
        }


        // if (!$vet->hasVerifiedEmail()) {
        //     $vet->markEmailAsVerified();
        // }


        // return redirect()->to('/');

        return $this->sendResponse('','Sikeres megerősítés!');
    }

    public function resend() {
        if (user()->hasVerifiedEmail()) {
            return response()->json(["msg" => "Email already verified."], 400);
        }

        user()->sendEmailVerificationNotification();

        return response()->json(["msg" => "Email verification link sent on your email id"]);
    }
}
