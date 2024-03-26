<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class AppointmentDeleted extends Mailable
{
    use Queueable, SerializesModels;

    public $appointmentData;

    /**
     * Create a new message instance.
     *
     * @param array $appointmentData
     * @return void
     */
    public function __construct($appointmentData)
    {
        $this->appointmentData = $appointmentData;
    }

    public function envelope(): Envelope
    {
        return new Envelope(
            from: 'vetcareconnect@gmail.com',
            subject: 'VetCareConnect - Sikeres időpont lemondás!',
        );
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
{
    return $this->markdown('emails.appointment_deleted')
                ->with(['appointmentData' => $this->appointmentData]);
}
}
