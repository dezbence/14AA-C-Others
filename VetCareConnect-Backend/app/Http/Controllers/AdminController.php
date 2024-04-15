<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Cure;
use App\Models\Opening;
use App\Models\Special_opening;
use App\Models\Owner;
use App\Models\Pet;
use App\Models\Vet;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AdminController extends BaseController
{

    public function modifyUserEmail(Request $request)  {

        $validatorFields = [
            'id' => 'required',
            'role'=> 'required',
            'email' => 'required',
        ];

        $validator = Validator::make($request->all(), $validatorFields);

        if ($validator->fails()){
            return $this->sendError('Bad request', $validator->errors(), 400);
        }

        if ($request->role == 0) {
            $user = Owner::find($request->id);
        } else {
            $user = Vet::find($request->id);

        }

        $user->update(['email' => $request->email]);

        return  $this->sendResponse($user, 'Sikeres művelet!');
    }

    public function getAllOwner() {
        $owners = Owner::all();
        return  $this->sendResponse($owners, 'Sikeres művelet!');
    }

    public function deleteOwner($id) {
        $owner = Owner::find($id);

        if ($owner == null) return $this->sendError('Not found','Nincs ilyen felhasználó!', 404);
        $owner->delete();

        return  $this->sendResponse($owner, 'Sikeres művelet!');
    }

    public function getAllVet() {
        $vets = Vet::all();
        return  $this->sendResponse($vets, 'Sikeres művelet!');
    }

    public function deleteVet($id) {

        $vet = Vet::find($id);

        if ($vet == null) return $this->sendError('Not found','Nincs ilyen felhasználó!', 404);
        $vet->delete();

        return  $this->sendResponse($vet, 'Sikeres művelet!');
    }
}
