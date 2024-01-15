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
        $appoinments = Cure::with('cure_type', 'vet', 'pet.owner')
            ->get();

        $return = [];

        foreach ($appoinments as $appoinment) {
            if ($appoinment->pet->owner->id == $id) {
                $return[] = [
                    'ownerId' => $appoinment->pet->owner->id,
                    'petName' => $appoinment->pet->name,
                    'cureType' => $appoinment->cure_type->type,
                    'vetName' => $appoinment->vet->name,
                    'vetAddress' => $appoinment->vet->address,
                    'cureDate' => $appoinment->date

                    // 'petName' => $appoinment->pets->species
                    // 'cureDate' => $appoinment->pets->cures->date
                 ];
            }

         }

        return $this->sendResponse($return, 'Sikeres művelet!');
    }

    public function getFreeAppointments($id, $date)
    {

        $vets = Vet::with(['special_openings' => function ($query) use($date) {
            $query->where('date', '=', $date);
        }, 'openings'])
            ->where('id', '=', $id)
            ->get();





        // $vets = Vet::with('cures', 'special_openings', 'openings')
        //     ->where('id', '=', $id)
        //     ->get();

        // $opening_hours = [];

        // $hasSpecialOnDate = false;

        // foreach ($vets as $vet) {
        //     if ($vet['special_openings']) {
        //         foreach ($vet['special_openings'] as $special_opening) {
        //             if ($special_opening->date == $date) {
        //                 $hasSpecialOnDate == true;
        //                 array_push($opening_hours, $special_opening->working_hours);
        //             }
        //         }

        //     } else {
        //         foreach ($vet['openings'] as $opening) {
        //             if ($opening->day == date('l', strtotime($date))) {
        //                 array_push($opening_hours, $opening);

        //             }
        //         }
        //     }
        // }




        return $this->sendResponse($vets, 'Sikeres művelet!');
    }
}
