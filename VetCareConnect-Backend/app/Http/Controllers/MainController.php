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

use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

use Laravel\Sanctum\PersonalAccessToken;

class MainController extends BaseController
{
    public function getUserData() {
        return  $this->sendResponse(Auth::user(), 'Sikeres művelet!');
    }

    public function modifyUserData() {

    }

    public function getAllVet() {

        $vets = Vet::all();
        unset($vets['email']);
        unset($vets['password']);

        return  $this->sendResponse($vets, 'Sikeres művelet!');
    }

    public function getAllCureTypes()
    {
        $cure_types = Cure_type::all();

        return  $this->sendResponse($cure_types, 'Sikeres művelet!');
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

        return $this->sendResponse(Auth::user(), 'Sikeres művelet!');
    }



}
