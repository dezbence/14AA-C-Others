<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Owner;
use App\Models\Vet;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{

    public function register(Request $request) {

        $emailValidation = ['required|email|unique:App\Models\Owner,email', 'required|email|unique:App\Models\Vet,email'];

        $validator = Validator::make($request->all(),
        [
            'name' => 'required',
            'email' => $emailValidation[$request['role']],
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

        return response()->json('Sikerült', 200);
    }


    public function postTest(Request $request) {
        $input = $request->all();
        $input['password'] = bcrypt($input['password']);

        if ($input['role'] == 0) {
            $input['roleZero'] = true;
        }


            unset($input['role']);


        return response()->json($input, 200);
    }
}
