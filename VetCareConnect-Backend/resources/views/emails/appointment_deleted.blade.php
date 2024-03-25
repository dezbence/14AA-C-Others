@component('mail::message')
# Időpont lemondva!

Időpont részletei:

- **Gazda neve:** {{ $appointmentData['owner_name'] }}
- **Állat neve:** {{ $appointmentData['pet_name'] }}
# Kezelés dátuma: {{ $appointmentData['date'] }}

@endcomponent
