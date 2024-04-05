<?php

namespace Tests\Unit;

use Illuminate\Http\Response;
// use PHPUnit\Framework\TestCase;
use Tests\TestCase;

class RegisterTest extends TestCase
{
    /**
     * A basic unit test example.
     */
    // public function testRegisterWithRightData(): void
    // {
    //     $password = fake()->password();

    //         $owner = [
    //             "name" => fake()->name(),
    //             "email" => fake()->unique()->safeEmail(),
    //             "password" => $password,
    //             "confirm_password" => $password,
    //             "postal_code" => fake()->numberBetween(1000, 9999),
    //             "phone" => fake()->randomNumber(9, true),
    //             "role" => 0,
    //         ];

    //         $vet = $owner;
    //         $vet['role'] = 1;
    //         $vet['email'] = fake()->unique()->safeEmail();
    //         $vet += [
    //             "address" => substr(fake()->address, 5),
    //             "stamp_number"=> fake()->randomNumber(4, true),
    //         ];

    //     $response = $this->postJson('/api/register', $owner);
    //     $response
    //         ->assertStatus(200);

    //     $response = $this->postJson('/api/register', $vet);
    //        $response
    //         ->assertStatus(200);

    //     $remove = ['role', 'password', 'confirm_password'];
    //     $ownerDB = array_diff_key($owner, array_flip($remove));
    //     $vetDB = array_diff_key($vet, array_flip($remove));
        
    //     $this->assertDatabaseHas('vet', $vetDB);
    //     $this->assertDatabaseHas('owner', $ownerDB);

    // }

    // public function testRegisterMissingData(): void {
    //     $password = fake()->password();

    //     $owner = [
    //         "name" => fake()->name(),
    //         "email" => fake()->unique()->safeEmail(),
    //         "password" => $password,
    //         "confirm_password" => $password,
    //         "postal_code" => fake()->numberBetween(1000, 9999),
    //         "phone" => fake()->randomNumber(9, true),
    //         "role" => 0,
    //     ];

    //     $vet = $owner;
    //     $vet['role'] = 1;
    //     $vet['email'] = fake()->unique()->safeEmail();
    //     $vet += [
    //         "address" => substr(fake()->address, 5),
    //         "stamp_number"=> fake()->randomNumber(4, true),
    //     ];

    //     $randomKey = array_rand($owner, 1);
    //     unset($owner[$randomKey]);

    //     $randomKey = array_rand($vet, 1);
    //     unset($vet[$randomKey]);

    //     $response = $this->postJson('/api/register', $owner);
    //     $response
    //         ->assertStatus(400);

    //     $response = $this->postJson('/api/register', $vet);
    //        $response
    //         ->assertStatus(400);
    // }

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
