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
    public function getVetAppointments()
    {
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
}
