<?php

namespace Tests\Feature;

use Illuminate\Http\Response;
use Illuminate\Foundation\Testing\RefreshDatabase;

use Tests\TestCase;
use App\Models\Owner;
use App\Models\Vet;
use App\Models\Pet;


class PetTest extends TestCase
{
    public function testgetPets(): void
    {

       $owner = Owner::factory()->create([
            'email' => 'test.email.used.owner@example.com',
            'password' => "Teszt123"
       ]);

       $pet = Pet::factory()->create([
        'owner_id' => $owner->id
       ]);

       $token = $owner->createToken('Secret')->accessToken;
       dd($token);

        $response = $this->actingAs($owner)
        
            ->getJson('/api/pets');

        $response->assertStatus(200);

        dd($response);







        //new pet
        

        // $response = $this->withHeader('Authorization', 'Bearer '.$token)
        //     ->postJson('/api/new-pet', $newPet);

        // $response->assertStatus(200);

        // $newPet['comment'] = null;
        // $this->assertDatabaseHas('pet', $newPet);

        // //missing data new pet
        // $response = $this->withHeader('Authorization', 'Bearer '.$token)
        //     ->postJson('/api/new-pet', $newPet);
    }
}
