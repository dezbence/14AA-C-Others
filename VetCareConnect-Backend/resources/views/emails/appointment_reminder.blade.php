@component('mail::message')
# Közelgő időpontja van

Időpont részletei:

- **Gazda neve:** {{ $appointmentData['owner_name'] }}
- **Állat neve:** {{ $appointmentData['pet_name'] }}
- **Kezelés:** {{ $appointmentData['cure_type_name'] }}
- **Állatorvos neve:** {{ $appointmentData['vet_name'] }}
- **Rendelő címe:** {{ $appointmentData['vet_postal']}} {{$appointmentData['vet_address']}}
# Kezelés dátuma: {{ $appointmentData['date'] }}

Kérjük legalább 10 perccel érkezzen hamarabb a helyszínre! Köszönjük!

@endcomponent
