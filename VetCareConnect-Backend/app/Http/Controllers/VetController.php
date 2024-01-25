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

class VetController extends BaseController
{
    public function getVetAppointments() {
        $appointments = Cure::with('cure_type', 'vet', 'pet.owner')
            ->get();

        $return = [];

        foreach ($appointments as $appointment) {
            if ($appointment->vet->id == Auth::user()->id) {
                if (strtotime($appointment->date) > strtotime(date('Y-m-d')))
                {
                    $return[] = [
                        'pet_species' => $appointment->pet->species,
                        'cure_type' => $appointment->cure_type->type,
                        'cure_date' => $appointment->date
                    ];
                }
            }
        }

        return $this->sendResponse($return, 'Sikeres művelet!');
    }

    public function addOpenings(Request $request) {

        $validatorFields = [
            'working_hours'=> 'required',
            'day'=> 'required'
        ];

        foreach ($request->all() as $opening) {
            $validator = Validator::make($opening, $validatorFields);
        }

        if ($validator->fails()){
            return $this->sendError('Bad request', $validator->errors(), 400);
        }

        foreach ($request->all() as $opening) {
            $opening['vet_id'] = Auth::user()->id;
            return $opening;
            Opening::create($opening);
        }

        return $this->sendResponse('', 'Sikeres művelet!');
    }

    public function addSpecialOpenings(Request $request) {

        $validatorFields = [
            'working_hours' => 'required',
            'date' => 'required'
        ];

        foreach ($request->all() as $specialOpening) {
            $validator = Validator::make($specialOpening, $validatorFields);
        }

        if ($validator->fails()){
            return $this->sendError('Bad request', $validator->errors(), 400);
        }

        $test = [];

        foreach ($request->all() as $specialOpening) {
            $specialOpening['vet_id'] = Auth::user()->id;
            Special_opening::create($specialOpening);
        }

        return $this->sendResponse('', 'Sikeres művelet!');
    }
}
