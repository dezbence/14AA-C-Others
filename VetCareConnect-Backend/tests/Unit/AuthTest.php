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
        $payload = [
            "name" => fake()->name(),
            "email" => fake()->unique()->safeEmail(),
            "password" => fake()->password(12),
            "confirm_password" => fake()->password(12),
            "address" => "orvos",
            "postal_code" => "1123",
            "phone" => "a",
            "role" => 1,
            "stamp_number"=> "123",
        ];

        $response = $this->postJson('/api/register', $payload);
        $response
            ->assertStatus(200);
        $this->assertEquals(1, 1);

        //$this->assertDatabaseHas('vet',$payload);

    }
}
