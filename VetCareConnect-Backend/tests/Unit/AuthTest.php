<?php

namespace Tests\Unit;

use Illuminate\Http\Response;
// use PHPUnit\Framework\TestCase;
use Tests\TestCase;

class AuthTest extends TestCase
{
    /**
     * A basic unit test example.
     */
    public function testRegister(): void
    {
        $password = fake()->password();

            $owner = [
                "name" => fake()->name(),
                "email" => fake()->unique()->safeEmail(),
                "password" => $password,
                "confirm_password" => $password,
                "postal_code" => fake()->numberBetween(1000, 9999),
                "phone" => fake()->randomNumber(9, true),
                "role" => 0,
            ];

            $vet = $owner;
            $vet['role'] = 1;
            $vet['email'] = fake()->unique()->safeEmail();
            $vet += [
                "address" => substr(fake()->address, 4),
                "stamp_number"=> fake()->randomNumber(4, true),
            ];


        $response = $this->postJson('/api/register', $owner);
        $response
            ->assertStatus(200);

        $response = $this->postJson('/api/register', $vet);
           $response
            ->assertStatus(200);

        //$this->assertDatabaseHas('vet',$payload);

    }
}
