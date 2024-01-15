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

class MainController extends BaseController
{


    public function getOwnerData($id) {

        $ownerData = Owner::select('name', 'email', 'postal_code', 'phone')
            ->where('id', '=', $id)
            ->get();

        return  $this->sendResponse($ownerData, 'Sikeres művelet!');
    }

    public function getVetData($id) {

        $vetData = Vet::select('name', 'email', 'address', 'phone')
            ->where('id', '=', $id)
            ->get();

        return  $this->sendResponse($vetData, 'Sikeres művelet!');
    }

    public function getAllVet() {

        $vets = Vet::select('name', 'email', 'address', 'phone')
            ->get();

        return  $this->sendResponse($vets, 'Sikeres művelet!');
    }

    public function getOpenings($id) {

        $vets = Vet::with('openings', 'special_openings')
            ->where('id', '=', $id)
            ->get();

        foreach ($vets as $vet) {
            $return = [
                "openings" => $vet->openings,
                "special_openings" => $vet->special_openings
            ];
        }

        return  $this->sendResponse($return, 'Sikeres művelet!');
    }

    public function getPets($id)
    {
        $pets = Pet::with('owner')
        ->where('owner_id', '=', $id)
        ->get();

        foreach ($pets as $pet) {
            unset($pet['owner']);
        }

        return  $this->sendResponse($pets, 'Sikeres művelet!');
    }

    public function addNewPet(Request $request) {

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
                $appointment += strtotime('00:15', 0);
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
