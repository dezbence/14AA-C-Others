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

class MainController extends BaseController
{


    public function getOwnerData($id) {

        $ownerData = Owner::where('id', '=', $id)
            ->get();

        unset($ownerData['email']);
        unset($ownerData['password']);

        return  $this->sendResponse($ownerData, 'Sikeres művelet!');
    }

    public function getVetData($id) {

        $vetData = Vet::where('id', '=', $id)
            ->get();

        unset($vetData['email']);
        unset($vetData['password']);

        return  $this->sendResponse($vetData, 'Sikeres művelet!');
    }

    public function getAllVet() {

        $vets = Vet::all();
        unset($vets['email']);
        unset($vets['password']);

        return  $this->sendResponse($vets, 'Sikeres művelet!');
    }

    public function getPets($id)
    {
        $pets = Pet::where('owner_id', '=', $id)
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
            'pedigree_number'=> 'required',
            'owner_id'=> 'required'
        ];

        $validator = Validator::make($request->all(), $validatorFields);


         if ($validator->fails()){
            return $this->sendError('Bad request', $validator->errors(), 400);
         }

        $newPet = Pet::create($request->all());

        return  $this->sendResponse($request, 'Sikeres művelet!');
    }

    public function getCureTypes()
    {
        $cure_types = Cure_type::all();

        return  $this->sendResponse($cure_types, 'Sikeres művelet!');
    }

    public function getOwnerAppointments($id)
    {
        $appointments = Cure::with('cure_type', 'vet', 'pet.owner')
            ->get();

        $return = [];

        foreach ($appointments as $appointment) {
            if ($appointment->pet->owner->id == $id) {
                $return[] = [
                    'ownerId' => $appointment->pet->owner->id,
                    'petName' => $appointment->pet->name,
                    'cureType' => $appointment->cure_type->type,
                    'vetName' => $appointment->vet->name,
                    'vetAddress' => $appointment->vet->address,
                    'cureDate' => $appointment->date
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
        Pet::where('id', '=', $id)->delete();

        return $this->sendResponse('', 'Sikeres művelet!');
    }

    public function modifyPet() {

    }

    public function modifyUserData() {

    }

    public function deleteAppointment() {

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
