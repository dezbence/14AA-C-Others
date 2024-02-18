@component('mail::message')
<img src="{{ $message->embed(public_path().'/VetCareConnect_green.png') }}">
Sikeres bejelentkezés!
Üdvözli Önt a VetCareConnect csapata!
{{ $username }}
@component('mail::button', ['url' => 'http://localhost:5173/'])
    Tovább az oldalra!
@endcomponent

@endcomponent
