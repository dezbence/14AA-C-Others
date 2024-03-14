<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Owner;
use Illuminate\Support\Facades\Mail;
use App\Mail\AppointmentReminder;

class MailController extends BaseController
{
    public function AppointmentReminder(Request $request) {

        $cures = Cure::with('vet', 'pet.owner')
        ->where('date', 'like', now()->subDay()->toDateString().'%')
        ->get();

        foreach ($cures as $cure) {
            Mail::to($cure->pet->owner->email)->send(new AppointmentReminder());

            if ($cure->pet->owner->email == null) {
                return $this->sendError('User not found','Nincs fiók ezzel az email címmel!', 404);
            }

        }


        Mail::to($user)->send(new AppointmentReminder());
    }
}
