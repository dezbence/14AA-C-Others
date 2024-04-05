<?php

namespace Tests\Feature;

use Illuminate\Http\Response;
use Tests\TestCase;
use Illuminate\Foundation\Testing\DatabaseTransactions;

use App\Models\Owner;
use App\Models\Vet;

class LoginTest extends TestCase
{
    use DatabaseTransactions;

    public function testLoginWithRightData(): void
    {

        $owner = Owner::factory()->create([
            'password' => 'Teszt123',
        ]);

        $vet = Vet::factory()->create([
            'password' => 'Teszt123',
        ]);

        $loginDataOwner = [
            'email' => $owner->email,
            'password' => "Teszt123"
        ];

        $loginDataVet = [
            'email' => $vet->email,
            'password' => "Teszt123"
        ];

        $response = $this->postJson('/api/login', $loginDataOwner);
        $response
            ->assertStatus(200);

        $response = $this->postJson('/api/login', $loginDataVet);
        $response
            ->assertStatus(200);

    }

    public function testLoginWithWrongData()  {

        $owner = Owner::factory()->create([
            'password' => 'Teszt123',
        ]);

        $vet = Vet::factory()->create([
            'password' => 'Teszt123',
        ]);

        $loginDataOwner = [
            'email' => $owner->email,
        ];

        $loginDataVet = [
            'email' => $vet->email,
        ];

        $isFake = false;
        $wrongPassword;
        do {
            $wrongPassword = fake()->unique()->password();
            if ($wrongPassword != "Teszt123") {
                $isFake = true;
            }
        } while (!$isFake);

        $loginDataOwner['password'] = $wrongPassword;
        $loginDataVet['password'] = $wrongPassword;

        $response = $this->postJson('/api/login', $loginDataOwner);
        $response
            ->assertStatus(401);

        $response = $this->postJson('/api/login', $loginDataVet);
        $response
            ->assertStatus(401);
    }
}
