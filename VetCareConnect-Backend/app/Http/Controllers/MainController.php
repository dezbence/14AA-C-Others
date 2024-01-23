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

    public function getAllVet() {

        $vets = Vet::all();
        unset($vets['email']);
        unset($vets['password']);

        return  $this->sendResponse($vets, 'Sikeres művelet!');
    }

    public function getPets(Request $request)
    {
        if ($this->getUserType($request) != "owner") {
            return $this->sendError('unauthorized',['error'=>'Gazda bejelentkezés szükséges!'],401);
        }

        $pets = Pet::where('owner_id', '=', Auth::user()->id)
            ->get();

        return  $this->sendResponse($pets, 'Sikeres művelet!');
    }

    public function addNewPet(Request $request) {

        if ($this->getUserType($request) != "owner") {
            return $this->sendError('unauthorized',['error'=>'Gazda bejelentkezés szükséges!'],401);
        }

        $validatorFields = [
            'name' => 'required',
            'species'=> 'required',
            'gender' => 'required',
            'weight' => 'required',
            'born_date' => 'required',
            'chip_number' => 'required',
            'pedigree_number'=> 'required'
        ];

        $validator = Validator::make($request->all(), $validatorFields);


        if ($validator->fails()){
            return $this->sendError('Bad request', $validator->errors(), 400);
        }

        $petData = $request->all();
        $petData['owner_id'] = Auth::user()->id;

        $newPet = Pet::create($petData);

        return  $this->sendResponse('', 'Sikeres művelet!');
    }

    public function addNewAppointment(Request $request){
        $this->isOwner($request);

        $validatorFields = [
            'date' => 'required',
            'pet_id'=> 'required',
            'cure_type_id' => 'required',
            'vet_id' => 'required'
        ];

        $validator = Validator::make($request->all(), $validatorFields);


        if ($validator->fails()){
            return $this->sendError('Bad request', $validator->errors(), 400);
        }

        $appointmentData = $request->all();
        $appointmentData['owner_id'] = Auth::user()->id;

        $newAppointment = Pet::create($appointmentData);

        return  $this->sendResponse('', 'Sikeres művelet!');
    }

    public function getCureTypes()
    {
        $cure_types = Cure_type::all();

        return  $this->sendResponse($cure_types, 'Sikeres művelet!');
    }

    public function getOwnerAppointments(Request $request)
    {
        if ($this->getUserType($request) != "owner") {
            return $this->sendError('unauthorized',['error'=>'Gazda bejelentkezés szükséges!'],401);
        }

        $appointments = Cure::with('cure_type', 'vet', 'pet.owner')
            ->get();

        $return = [];

        foreach ($appointments as $appointment) {
            if ($appointment->pet->owner->id == Auth::user()->id) {
                $return[] = [
                    'owner_id' => $appointment->pet->owner->id,
                    'pet_name' => $appointment->pet->name,
                    'cure_type' => $appointment->cure_type->type,
                    'vet_name' => $appointment->vet->name,
                    'vet_address' => $appointment->vet->address,
                    'cure_date' => $appointment->date
                 ];
            }

         }

        return $this->sendResponse($return, 'Sikeres művelet!');
    }

    public function getFreeAppointments($id, $date)
    {

        $vets = Vet::with([
        'special_openings' => function ($query) use($date) {
            $query->where('date', '=', $date);
        },
        'openings' => function ($query) use($date){
            $query->where('day', '=', $this->getDayName(date('l', strtotime($date))));
        }
        ])
            ->where('id', '=', $id)
            ->get();


        $opening_hours = [];

        if (count($vets[0]['special_openings']) == 0) {
            foreach ($vets[0]['openings'] as $opening) {
                array_push($opening_hours, $opening->working_hours);
            }
            } else {
            foreach ($vets[0]['special_openings'] as $special_opening) {
                    array_push($opening_hours, $special_opening->working_hours);
                }
            }


        $appointments = [];

        foreach ($opening_hours as $interval) {

            $appointment = strtotime(explode('-', $interval)[0], 0);
            $closeTime = strtotime(explode('-', $interval)[1], 0);

            while($appointment < $closeTime) {
                array_push($appointments, date('H:i', $appointment));
                $appointment += strtotime('00:30', 0);
            }

        }

        $cures = Cure::where('vet_id', '=', $id)
            ->where('date', 'like', $date.'%')
            ->get();

        foreach($cures as $cure) {

            $appointments = array_diff($appointments, [date('H:i', strtotime($cure->date))]);

        }

        return $this->sendResponse($appointments, 'Sikeres művelet!');
    }

    public function deletePet($id) {
        if ($this->getUserType($request) != "owner") {
            return $this->sendError('unauthorized',['error'=>'Gazda bejelentkezés szükséges!'],401);
        }

        Pet::where('id', '=', $id)
            ->where('owner_id', '=', Auth::user()->id)
            ->delete();

        return $this->sendResponse('', 'Sikeres művelet!');
    }

    public function modifyPet() {

    }

    public function modifyUserData() {

    }

    public function deleteAppointment(Request $request, $id) {
        if ($this->getUserType($request) != "owner") {
            return $this->sendError('unauthorized',['error'=>'Gazda bejelentkezés szükséges!'],401);
        }

        $cures = Cure::with([
        'pet.owner' => function ($query) {
            $query->where('id', '=', Auth::user()->id);
        }
        ])
            ->where('id', '=', $id)
            ->get();

        $validCure = null;

        foreach ($cures as $cure) {
            if ($cure['pet']['owner'] != null) {
                $validCure = $cure;
                break;
            }
        }

        if ($validCure == null) {
            return "eznul";
        } else {
            Cure::find($validCure->id)->delete();
        }

        return $this->sendResponse("", 'Sikeres művelet!');

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

        // if ($this->getUserType($request) == "vet") {
        //     return 'vet';
        // }
        // if ($this->getUserType($request) == "owner") {
        //     return 'owner';
        // }

        return $this->sendResponse(Auth::user(), 'Sikeres művelet!');
    }

    private function getDayName($day) {

        $days = [
            'Monday' =>'hétfő',
            'Tuesday' => 'kedd',
            'Wednesday' => 'szerda',
            'Thursday' => 'csütörtök',
            'Friday' => 'péntek',
            'Saturday' => 'szombat',
            'Sunday' => 'vasárnap'
        ];

        return $days[$day];
    }

    private function getUserType(Request $request) {
        //$request->bearerToken()

        if (PersonalAccessToken::findToken($request->bearerToken())->tokenable_type == "App\\Models\\Vet") {
            return "vet";
        }
        if (PersonalAccessToken::findToken($request->bearerToken())->tokenable_type == "App\\Models\\Owner") {
            return "owner";
        }

        return "else";
    }

    private function isOwner(Request $request) {
        if ($this->getUserType($request) != "owner") {
            return $this->sendError('unauthorized',['error'=>'Gazda bejelentkezés szükséges!'],401);
        }
    }

    private function isVet() {
        if ($this->getUserType($request) != "vet") {
            return $this->sendError('unauthorized',['error'=>'Orvos bejelentkezés szükséges!'],401);
        }
    }

}
