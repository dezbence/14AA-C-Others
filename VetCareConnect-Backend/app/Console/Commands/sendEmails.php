<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

use Illuminate\Support\Facades\Mail;

use App\Models\Cure_type;
use App\Models\Cure;
use App\Models\Owner;
use App\Models\Pet;
use App\Models\Vet;
use Carbon\Carbon;
use App\Mail\AppointmentReminder;

class sendEmails extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sendEmails';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $cures = Cure::with('pet.owner', 'vet', 'cure_type')
            ->where('date', 'like', Carbon::now()->add(1, 'hour')->add(1, 'day')->toDateString().'%')
            ->get();

        foreach ($cures as $cure) {
            $appointmentData = [
                'owner_name' => $cure->pet->owner->name,
                'pet_name' =>  $cure->pet->name,
                'cure_type_name' => $cure->cure_type->type,
                'vet_name' => $cure->vet->name,
                'vet_address' => $cure->vet->address,
                'vet_postal' => $cure->vet->postal_code,
                'date' => $cure->date
            ];
            Mail::to($cure->pet->owner->email)->send(new AppointmentReminder($appointmentData));
        }
    }
}
