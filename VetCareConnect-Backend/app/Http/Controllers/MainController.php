<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cure_type;
use App\Models\Cure;
use App\Models\Opening;
use App\Models\Special_opening;
use App\Models\Owner;
use App\Models\Pet;
use App\Models\Vet;
use App\Models\FAQ;

use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

use App\Mail\PasswordForgot;

use Laravel\Sanctum\PersonalAccessToken;

class MainController extends BaseController
{
    public function getUserData() {
        return  $this->sendResponse(Auth::user(), 'Sikeres művelet!');
    }

    public function modifyUserData(Request $request) {

        $validatorFields = [
            'name' => 'required',
            'postal_code' => 'required',
            'phone' => 'required'
        ];

        if (PersonalAccessToken::findToken($request->bearerToken())->tokenable_type == "App\\Models\\Vet") {
            $validatorFields['address'] = 'required';
        }

        $validator = Validator::make($request->all(), $validatorFields);

        if ($validator->fails()){
            return $this->sendError('Bad request', $validator->errors(), 400);
        }

        Auth::user()
            ->update($request->all());

            Mail::to($request->email)->send(new PasswordForgot($request->email, $request->name));
        return  $this->sendResponse('', 'Sikeres művelet!');
    }

    public function getAllVet() {

        $vets = Vet::all();
        unset($vets['email']);
        unset($vets['password']);

        return  $this->sendResponse($vets, 'Sikeres művelet!');
    }

    public function getAllCureTypes() {
        return  $this->sendResponse(Cure_type::all(), 'Sikeres művelet!');
    }

    public function getAllQuestions() {
        return  $this->sendResponse(FAQ::all(), 'Sikeres művelet!');
    }

    public function searchVets(Request $request) {
        $validatorFields = [
            'name' => 'required',
            'postal_code'=> 'required',
            'address' => 'required'
        ];

        $vets = Vet::where('name', 'like', '%'.$request->all()['name'].'%')
            ->where('postal_code', 'like', '%'.$request->all()['postal_code'].'%')
            ->where('address', 'like', '%'.$request->all()['address'].'%')
            ->get();

        return $this->sendResponse($vets, 'Sikeres művelet!');
    }

    public function bearerTest(Request $request) {

        return $this->sendResponse(2, 'Sikeres művelet!');
    }



}
