<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Owner;
use App\Models\Vet;

class VerificationController extends BaseController
{

    public function verify($user_id, Request $request) {
        if (!$request->hasValidSignature()) {
            return response()->json(["msg" => "Invalid/Expired url provided."], 401);
        }

        $user = Vet::find($user_id);
        if ($user == null) {
            $user = Owner::find($user_id);
        }

        if ($user == null) {
            return $this->sendResponse('','Hibás verifikáció!');
        }

        if (!$user->hasVerifiedEmail()) {
            $user->markEmailAsVerified();
        }

        return $this->sendResponse('','Sikeres megerősítés!');
    }

    public function resend($user_id) {
        $user = Vet::find($user_id);
        if ($user === null) {
            $user = Owner::find($user_id);
        }

        if ($user === null) {
            return $this->sendResponse('','Nincs ilyen user!');
        }

        if ($user->hasVerifiedEmail()) {
            return $this->sendResponse('','Az email már lett erősítve!');
        }

        $user->sendEmailVerificationNotification();

        return $this->sendResponse('','Új megerősítő email sikeresen elküldve!');
    }


}
