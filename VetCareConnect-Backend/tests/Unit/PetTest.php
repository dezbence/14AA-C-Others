<?php

namespace Tests\Unit;

use Illuminate\Http\Response;
// use PHPUnit\Framework\TestCase;
use Tests\TestCase;

class PetTest extends TestCase
{
    /**
     * A basic unit test example.
     */
    public function testPets(): void
    {
        $response = $this->postJson('/api/login', $loginDataVet);
        $response
            ->assertStatus(200);
    }
}
