<?php

namespace Tests\Feature;

use Illuminate\Http\Response;
use Tests\TestCase;

use Illuminate\Foundation\Testing\DatabaseTransactions;

use App\Models\Owner;
use App\Models\Vet;

class RegisterTest extends TestCase
{
    use DatabaseTransactions;

    public function testRegisterWithRightData(): void
    {
        $password = fake()->password();

        $owner = Owner::factory()->make();
        $vet = Vet::factory()->make();
        
        $registerOwnerData = $owner->toArray();
        $registerVetData = $vet->toArray();        

        unset($registerOwnerData['email_verified_at']);
        unset($registerVetData['email_verified_at']);

        $registerOwnerData = array_merge($registerOwnerData, ['role' => 0, 'password' => $password, 'confirm_password' => $password]);
        $registerVetData = array_merge($registerVetData, ['role' => 1, 'password' => $password, 'confirm_password' => $password]);

        $response = $this->postJson('/api/register', $registerOwnerData);
        $response
            ->assertStatus(200);

        $response = $this->postJson('/api/register', $registerVetData);
           $response
            ->assertStatus(200);

        $remove = ['role', 'password', 'confirm_password'];
        $ownerDB = array_diff_key($registerOwnerData, array_flip($remove));
        $vetDB = array_diff_key($registerVetData, array_flip($remove));
        
        $this->assertDatabaseHas('vet', $vetDB);
        $this->assertDatabaseHas('owner', $ownerDB);

    }

    public function testRegisterMissingData(): void {

        $password = fake()->password();

        $owner = Owner::factory()->make();
        $vet = Vet::factory()->make();
        
        $registerOwnerData = $owner->toArray();
        $registerVetData = $vet->toArray();        

        unset($registerOwnerData['email_verified_at']);
        unset($registerVetData['email_verified_at']);

        $registerOwnerData = array_merge($registerOwnerData, ['role' => 0, 'password' => $password, 'confirm_password' => $password]);
        $registerVetData = array_merge($registerVetData, ['role' => 1, 'password' => $password, 'confirm_password' => $password]);

        unset($registerOwnerData[array_rand($registerOwnerData, 1)]);
        unset($registerVetData[array_rand($registerOwnerData, 1)]);

        $response = $this->postJson('/api/register', $registerOwnerData);
        $response
            ->assertStatus(400);

        $response = $this->postJson('/api/register', $registerVetData);
           $response
            ->assertStatus(400);
    }

    // public function testRegisterUsedEmail(): void {
    //     $password = fake()->password();

    //     $owner = [
    //         "name" => fake()->name(),
    //         "email" => "test.email.used.owner@example.com",
    //         "password" => $password,
    //         "confirm_password" => $password,
    //         "postal_code" => fake()->numberBetween(1000, 9999),
    //         "phone" => fake()->randomNumber(9, true),
    //         "role" => 0,
    //     ];

    //     $vet = $owner;
    //     $vet['role'] = 1;
    //     $vet['email'] = "test.email.used.vet@example.com";
    //     $vet += [
    //         "address" => substr(fake()->address, 5),
    //         "stamp_number"=> fake()->randomNumber(4, true),
    //     ];

    //     $response = $this->postJson('/api/register', $owner);
    //     $response
    //         ->assertStatus(400);

    //     $response = $this->postJson('/api/register', $vet);
    //        $response
    //         ->assertStatus(400);
    // }
}
