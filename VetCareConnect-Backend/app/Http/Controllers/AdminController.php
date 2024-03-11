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

    public function deleteOwner($id) {

        $owner = Owner::where('id', '=', $id)
            ->get();

        if (count($owner) == 0) return $this->sendError('Bad request', 'Nincs ilyen orvos', 404);

        $cures = Cure::with([
            'pet' => function ($query) {
                $query->where('owner_id', '=', Auth::user()->id);
            }
        ])
        ->get();

        foreach ($cures as $cure) {
            $cure->delete();
        }

        $pets = Pet::where('owner_id', '=', $id)
        ->get();

        foreach ($pets as $pet) {
            $pet->delete();
        }

        Owner::find($id)
            ->delete();

        return  $this->sendResponse($owner, 'Sikeres művelet!');
    }

    public function getAllVet() {

        $vets = Vet::all();
        // unset($vets['password']);
        return  $this->sendResponse($vets, 'Sikeres művelet!');
    }

    public function deleteVet($id) {

        $vet = Vet::where('id', '=', $id)
            ->get();

        if (count($vet) == 0) return $this->sendError('Bad request', 'Nincs ilyen orvos', 404);

        $cures = Cure::where('vet_id', '=', $id)
        ->get();

        foreach ($cures as $cure) {
            $cure->delete();
        }

        $openings = Opening::where('vet_id', '=', $id)
        ->get();

        foreach ($openings as $opening) {
            $opening->delete();
        }

        $special_openings = Opening::where('vet_id', '=', $id)
        ->get();

        foreach ($special_openings as $opening) {
            $opening->delete();
        }

        Vet::find($id)
            ->delete();

        return  $this->sendResponse($vet, 'Sikeres művelet!');
    }
}
