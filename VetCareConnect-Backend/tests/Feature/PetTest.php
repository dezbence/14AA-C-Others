<?php

namespace Tests\Feature;

use Illuminate\Http\Response;
use Illuminate\Foundation\Testing\DatabaseTransactions;

use Tests\TestCase;
use App\Models\Owner;
use App\Models\Vet;
use App\Models\Pet;


class PetTest extends TestCase
{
    use DatabaseTransactions;

    public function testgetPets(): void
    {

       $owner = Owner::factory()->create([
            'email' => 'test.email.used.owner@example.com',
            'password' => "Teszt123"
       ]);

       $pet = Pet::factory()->create([
        'owner_id' => $owner->id
       ]);

       $token = $owner->createToken('Secret')->plainTextToken;
       

        $response = $this->withHeaders(['Authorization' => "Bearer $token"])
            ->getJson('/api/pets');

        $response->assertStatus(200);
        $response->assertJsonFragment(["name" => $pet->name]);
    }

    public function testNewPet() {

        $owner = Owner::factory()->create([
            'password' => "Teszt123"
       ]);

       $newPet = Pet::factory()->make([
        "owner_id" => $owner->id,
       ]);

       $token = $owner->createToken('Secret')->plainTextToken;
       
        $response = $this->withHeader('Authorization', "Bearer $token")
            ->postJson('/api/new-pet', $newPet->toArray());
        
        $response->assertStatus(200);

        // $newPet['comment'] = null;
        // $this->assertDatabaseHas('pet', $newPet);


        //missingdata
    }
}
