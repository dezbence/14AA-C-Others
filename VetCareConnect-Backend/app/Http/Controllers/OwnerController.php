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

use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

class OwnerController extends BaseController
{
    public function getPets()
    {
        $pets = Pet::where('owner_id', '=', Auth::user()->id)
            ->get();

        return  $this->sendResponse($pets, 'Sikeres művelet!');
    }

    public function addNewPet(Request $request) {

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

    public function modifyPet() {

    }

    public function deletePet(Request $request) {

        $validatorFields = [
            'id' => 'required'
        ];

        $validator = Validator::make($request->all(), $validatorFields);

        if ($validator->fails()){
            return $this->sendError('Bad request', $validator->errors(), 400);
        }

        Pet::where('id', '=', $request->id)
            ->where('owner_id', '=', Auth::user()->id)
            ->delete();

        return $this->sendResponse('', 'Sikeres művelet!');
    }

    public function getFreeAppointments(Request $request)
    {

        $validatorFields = [
            'id' => 'required',
            'date' => 'required'
        ];

        $validator = Validator::make($request->all(), $validatorFields);

        if ($validator->fails()){
            return $this->sendError('Bad request', $validator->errors(), 400);
        }


        $vets = Vet::with([
        'special_openings' => function ($query) use($request) {
            $query->where('date', '=', $request->date);
        },
        'openings' => function ($query) use($request){
            $query->where('day', '=', $this->getDayName(date('l', strtotime($request->date))));
        }
        ])
            ->where('id', '=', $request->id)
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

        $cures = Cure::where('vet_id', '=', $request->id)
            ->where('date', 'like', $request->date.'%')
            ->get();

        foreach($cures as $cure) {

            $appointments = array_diff($appointments, [date('H:i', strtotime($cure->date))]);

        }

        return $this->sendResponse($appointments, 'Sikeres művelet!');
    }

    public function addNewAppointment(Request $request){

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

        if (Pet::find($request->pet_id)->owner_id == Auth::user()->id) {
            Cure::create($request->all());
        } else {
            return $this->sendError('Bad request', ['error'=>'nincs ilyen állata'], 400);
        }

        return  $this->sendResponse('', 'Sikeres művelet!');
    }

    public function getOwnerAppointments()
    {
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
                    'vet_postal_code' => $appointment->vet->postal_code,
                    'cure_date' => $appointment->date
                 ];
            }

         }

        return $this->sendResponse($return, 'Sikeres művelet!');
    }

    public function deleteAppointment(Request $request) {

        $cures = Cure::with([
        'pet.owner' => function ($query) {
            $query->where('id', '=', Auth::user()->id);
        }
        ])
            ->where('id', '=', $request->id)
            ->get();

        $validCure = null;

        foreach ($cures as $cure) {
            if ($cure['pet']['owner'] != null) {
                $validCure = $cure;
                break;
            }
        }

        if ($validCure == null) {
            return $this->sendError('Bad request', ['error'=>'nincs ilyen időpontja'], 400);
        } else {
            Cure::find($validCure->id)->delete();
        }

        return $this->sendResponse("", 'Sikeres művelet!');

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

}