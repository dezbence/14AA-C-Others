<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Owner;
use App\Models\Vet;

use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{

    public function register(Request $request) {

        $validator = Validator::make($request->all(),
        [
            'name' => 'required',
            'email' => 'required|email|unique:App\Models\Owner,email|unique:App\Models\Vet,email',
            'address' => 'required',
            'phone' => 'required',
            'password' => 'required',
            'confirm_password' => 'required|same:password',
            'role' => 'required|integer'
        ],
        [
            'name.required' => "Kötelező kitölteni!",

            'email.required' => "Kötelező kitölteni!",
            'email.email' => "Hibás az email cím!",
            'email.unique' => "Az email cím már létezik",

            'address.required' => "Kötelező kitölteni!",

            'phone.required' => "Kötelező kitölteni!",

            'password.required' => "Kötelező kitölteni!",

            'confirm_password.required' => "Kötelező kitölteni!",
            'confirm_password.same' => "A két jelszó nem egyezik!",

            'role.required' => "Kötelező kitölteni!",
            'role.integer' => "Csak szám lehet!",
        ]);

         if ($validator->fails()){
            return response()->json($validator->errors(), 400);
         }

        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        if ($input['role'] == 0) {
            unset($input['role']);
            unset($input['confirm_password']);

            $owner = Owner::create($input);

            $success['token'] = $owner->createToken('Secret')->plainTextToken;
            $success['name'] = $owner->name;
        } else {
            unset($input['role']);
            unset($input['confirm_password']);

            $vet = Vet::create($input);

            $success['token'] = $vet->createToken('Secret')->plainTextToken;
            $success['name'] = $vet->name;
        }
        $data = [
            "message" => "Success",
            "token" => $success['token']
        ];
        return response()->json($data, 200);
    }


    public function login(Request $request){

        //https://stackoverflow.com/questions/46292391/authenticate-users-from-more-than-two-tables-in-laravel-5

        if (Auth::guard('owner')->attempt([
            'email' => $request->email,
            'password' => $request->password
        ])) {

            $user = Auth::guard('owner')->user();
            $success['token'] = $user->createToken('Secret')->plainTextToken;
            $success['name'] = $user->name;
            $success['id'] = $user->id;
            $success['message'] = "Sikeres bejelentkezés owner";

            return response()->json($success, 200);

        } elseif (Auth::guard('vet')->attempt([
            'email' => $request->email,
            'password' => $request->password
        ])) {

            $user = Auth::guard('vet')->user();
            $success['token'] = $user->createToken('Secret')->plainTextToken;
            $success['name'] = $user->name;
            $success['id'] = $user->id;
            $success['message'] = "Sikeres bejelentkezés vet";

            return response($success, 200);

        } else {
            return response()->json('Unauthorized',401);
        }

    }

    public function logout(Request $request){
        auth()->user()->tokens()->delete();
        return response()->json('Sikeres kijelentkezés!');
    }
}
