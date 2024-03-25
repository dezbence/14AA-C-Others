@component('mail::message')
# Sikeres időpontfoglalás

Időpont részletei:

- **Gazda neve:** {{ $appointmentData['owner_name'] }}
- **Állat neve:** {{ $appointmentData['pet_name'] }}
- **Kezelés:** {{ $appointmentData['cure_type_name'] }}
- **Állatorvos neve:** {{ $appointmentData['vet_name'] }}
- **Rendelő címe:** {{ $appointmentData['vet_address'] }}
# Kezelés dátuma: {{ $appointmentData['date'] }}

@endcomponent