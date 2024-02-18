@component('mail::message')

<h1>Üdvözli Önt a VetCareConnect!</h1>
<img src="{{ $message->embed(public_path().'/VetCareConnect_green.png') }}">
Már csak egy kattintásnyira van attól, hogy elkezdje a VetCareConnect használatát. Csak igazolnia kell az e-mail címét ({{ $username }}) a fiók aktiválásához!

@component('mail::button', ['url' => 'http://localhost:5173/bejelentkezes'])
    Fiók aktiválása!
@endcomponent

@endcomponent
