<?php

namespace Tests\Unit;

use Illuminate\Http\Response;
// use PHPUnit\Framework\TestCase;
use Tests\TestCase;
use App\Models\Owner;
use App\Models\Vet;
use App\Models\Pet;


class PetTest extends TestCase
{
    //private $token;

    // public function testloginForPets() {


    //    $response = $this->postJson('/api/login', $loginDataOwner);
    //        $response->assertStatus(200);

    //     $token = $response->getData()->data->token;
    // }

    public function testPets(): void
    {
        $loginDataOwner = [
            'email' => 'test.email.used.owner@example.com',
            'password' => "Teszt123"
       ];

       $owner = Owner::factory()->create([
            'email' => 'test.email.used.owner@example.com',
            'password' => "Teszt123"
       ]);

        $response = $this->actingAs($owner)
            ->json('get', '/api/pets');


        $response->assertStatus(200);

        //new pet
        $pet = Pet::factory()->create();

        $response = $this->withHeader('Authorization', 'Bearer '.$token)
            ->postJson('/api/new-pet', $newPet);

        $response->assertStatus(200);

        $newPet['comment'] = null;
        $this->assertDatabaseHas('pet', $newPet);

        //missing data new pet
        $response = $this->withHeader('Authorization', 'Bearer '.$token)
            ->postJson('/api/new-pet', $newPet);
    }
}
