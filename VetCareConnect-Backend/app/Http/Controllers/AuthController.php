<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Owner;
use App\Models\Vet;

use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

class AuthController extends BaseController
{

    public function register(Request $request) {

        $ownerValidatorFields = [
            'name' => 'required',
            'email' => 'required|email|unique:App\Models\Owner,email|unique:App\Models\Vet,email',
            'postal_code' => 'required',
            'phone' => 'required',
            'password' => 'required',
            'confirm_password' => 'required|same:password',
            'role' => 'required|integer'
        ];

        $vetValidatorFields = $ownerValidatorFields;
        $vetValidatorFields += [
            'stamp_number' => 'required',
            'address' => 'required'
        ];

        $validatorMessages = [
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

            'stamp_number.required' => "Kötelező kitölteni!",

            'postal_code.required' => "Kötelező kitölteni!",
        ];

        if ($request['role'] == 0) {
            $validator = Validator::make($request->all(), $ownerValidatorFields, $validatorMessages);
        } else {
            $validator = Validator::make($request->all(), $vetValidatorFields, $validatorMessages);
        }

         if ($validator->fails()){
            return $this->sendError('Bad request', $validator->errors(), 400);
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

        return $this->sendResponse($success,'Sikeres regisztráció!');
    }


    public function login(Request $request){

        //https://stackoverflow.com/questions/46292391/authenticate-users-from-more-than-two-tables-in-laravel-5

        $validatorFields = [
            'email' => 'required',
            'password'=> 'required'
        ];

        $validator = Validator::make($request->all(), $validatorFields);

        if ($validator->fails()){
           return $this->sendError('Bad request', $validator->errors(), 400);
        }

        if (Auth::guard('owner')->attempt([
            'email' => $request->email,
            'password' => $request->password
        ])) {

            $user = Auth::guard('owner')->user();
            $success['token'] = $user->createToken('Secret')->plainTextToken;
            $success['name'] = $user->name;
            $success['id'] = $user->id;

            return $this->sendResponse($success,'Sikeres bejelentkezés!');

        } elseif (Auth::guard('vet')->attempt([
            'email' => $request->email,
            'password' => $request->password
        ])) {

            $user = Auth::guard('vet')->user();
            $success['token'] = $user->createToken('Secret')->plainTextToken;
            $success['name'] = $user->name;
            $success['id'] = $user->id;

            return $this->sendResponse($success,'Sikeres bejelentkezés!');

        } else {
            return $this->sendError('Unauthorized',['error' => 'Sikertelen bejelentkezés!'],401);
        }

    }

    public function logout(Request $request){

        auth()->user()->tokens()->delete();
        return $this->sendResponse('','Sikeres kijelentkezés!');
    }
}
