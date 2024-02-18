@component('mail::message')

<h1>Üdvözli Önt a VetCareConnect!</h1>
<img src="{{ $message->embed(public_path().'/VetCareConnect_green.png') }}">
Az új jelszavának beállításához keresse fel a (link) címet. Amennyiben a fenti linkre kattintás nem működik, a linket másolja ki a böngészőjébe. Ha a jelszócserét nem Ön kezdeményezte, akkor hagyja levelünket figyelmen kívül. Sikeres jelszócserét követően felhasználói nevével és új jelszavával ismét használhatja fiókját.

@component('mail::button', ['url' => 'http://localhost:5173/bejelentkezes'])
    Fiók aktiválása!
@endcomponent

@endcomponent
