<?php

namespace Tests\Unit;

use Illuminate\Http\Response;
// use PHPUnit\Framework\TestCase;
use Tests\TestCase;

class LoginTest extends TestCase
{
    /**
     * A basic unit test example.
     */
    public function testLoginWithRightData(): void
    {
        $loginDataOwner = [
            'email' => 'test.email.used.owner@example.com',
            'password' => "Teszt123"
        ];

        $loginDataVet = [
            'email' => 'test.email.used.vet@example.com',
            'password' => "Teszt123"
        ];

        $isFake = false;
        $wrongPassword;
        do {
            $wrongPassword = fake()->unique()->password();
            if ($wrongPassword != "Teszt123") {
                $isFake = true;
            }
        } while (!$isFake);

        $response = $this->postJson('/api/login', $loginDataOwner);
        $response
            ->assertStatus(200);

        $response = $this->postJson('/api/login', $loginDataVet);
        $response
            ->assertStatus(200);

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
