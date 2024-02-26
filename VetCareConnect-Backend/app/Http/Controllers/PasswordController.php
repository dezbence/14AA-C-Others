<?php

namespace App\Http\Controllers;

use App\Models\Owner;
use App\Models\Vet;
use Illuminate\Support\Str;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Mail\PasswordReset as PasswordResetMail;
use Illuminate\Support\Facades\Mail;


class PasswordController extends BaseController
{
    // public function forgotPassword(Request $request)
    // {
    //     $request->validate([
    //         'email' => 'required|email',
    //     ]);

    //     $status = Password::sendResetLink(
    //         $request->only('email')
    //     );

    //     if ($status == Password::RESET_LINK_SENT) {
    //         return [
    //             'status' => __($status)
    //         ];
    //     }
    //     throw ValidationException::withMessages([
    //         'email' => [trans($status)],
    //     ]);
    //     dd($status);
    // }

    // public function reset(Request $request)
    // {
    //     $request->validate([
    //         'token' => 'required',
    //         'email' => 'required|email',
    //         'password' => ['required', 'confirmed', RulesPassword::defaults()],
    //     ]);

    //     $status = Password::reset(
    //         $request->only('email', 'password', 'password_confirmation', 'token'),
    //         function ($user) use ($request) {
    //             $user->forceFill([
    //                 'password' => Hash::make($request->password),
    //                 'remember_token' => Str::random(60),
    //             ])->save();

    //             $user->tokens()->delete();

    //             event(new PasswordReset($user));
    //         }
    //     );

    //     if ($status == Password::PASSWORD_RESET) {
    //         return response([
    //             'message'=> 'Password reset successfully'
    //         ]);
    //     }

    //     return response([
    //         'message'=> __($status)
    //     ], 500);

    // }


    public function forgotPassword(Request $request) {

        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
        ]);

        if($validator->fails()){
            return $this->sendError('Bad request', $validator->errors(), 400);
        }

        $user = Vet::where('email', $request->email)->first();
        if ($user == null) {
            $user = Owner::where('email', $request->email)->first();
        }

        if ($user == null) {
                return $this->sendError('','Nincs fiók ezzel az email címmel!', 404);
        }

        $token = Str::random(60);

        // dd(Carbon::now('GMT+1')->timestamp + 3600);
        Mail::to($user)->send(new PasswordResetMail($token));

        dd('halo');
        $passwordReset = password_reset_token::create(['email' => $request->email,'token' => $token, 'created_at' => Carbon::now('GMT+1')->timestamp]);
        // DB::table('password_reset_tokens')->insert([
        //     'email' => $request->email,
        //     'token' => $token,
        //     'created_at' => Carbon::now('GMT+1')->timestamp
        // ]);

        return $this->sendResponse('','Az email sikeresen elküldve!', 200);
    }

}
