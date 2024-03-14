<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Owner;
use Illuminate\Support\Facades\Mail;
use App\Mail\AppointmentReminder;

class MailController extends BaseController
{
    public function AppointmentReminder(Request $request) {

        $appointments = Cure::with('vet', 'pet.owner')
        ->where('date', 'like', date('Y-M-D'))
        ->get();

    if (count($appointments) == 0) return $this->sendResponse('Nincs időpont', 'Sikeres művelet!');

        $user = Owner::where('email', $request->email)->first();

        if ($user == null) {
            return $this->sendError('User not found','Nincs fiók ezzel az email címmel!', 404);
        }

        Mail::to($user)->send(new AppointmentReminder());
    }
}
