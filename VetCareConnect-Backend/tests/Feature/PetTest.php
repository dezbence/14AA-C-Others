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

       $owner = Owner::factory()->create();

       $pet = Pet::factory()->create([
        'owner_id' => $owner->id
       ]);

       $token = $owner->createToken('Secret')->plainTextToken;
       

        $response = $this->withHeaders(['Authorization' => "Bearer $token"])
            ->getJson('/api/pets');

        $response->assertStatus(200);
        $response->assertJsonFragment(["name" => $pet->name]);
    }

    public function testNewPetWithValidData() {

        $owner = Owner::factory()->create();

        $newPet = Pet::factory()->make([
            "owner_id" => $owner->id,
        ]);

       $token = $owner->createToken('Secret')->plainTextToken;
       
        $response = $this->withHeader('Authorization', "Bearer $token")
            ->postJson('/api/new-pet', $newPet->toArray());
        
        $response->assertStatus(200);
        $this->assertDatabaseHas('pet', $newPet->toArray());
    }

    public function testNewPetWithMissingData() {

        $owner = Owner::factory()->create();

        $newPet = Pet::factory()->make();
        $token = $owner->createToken('Secret')->plainTextToken;

        $newPet = $newPet->toArray();
        unset($newPet['owner_id']);

        do {
            $randomKey = array_rand($newPet, 1);
        } while ($randomKey == "comment");

        unset($newPet[$randomKey]);
       
        $response = $this->withHeader('Authorization', "Bearer $token")
            ->postJson('/api/new-pet', $newPet);
        $response->assertStatus(400);

        

        $this->assertDatabaseMissing('pet', $newPet);
    }

    public function testmodifyPetWithValidData() {

        $owner = Owner::factory()->create();

        $token = $owner->createToken('Secret')->plainTextToken;

        $pet = Pet::factory()->create([
            "owner_id" => $owner->id,
        ]);

        $updatedPet = Pet::factory()->make([
            "id" => $pet['id']
        ]);

        $response = $this->withHeader('Authorization', "Bearer $token")
            ->putJson('/api/modify-pet', $updatedPet->toArray());

        $response->assertStatus(200);
        $this->assertDatabaseHas('pet', $updatedPet->toArray());
    }

    public function testmodifyPetWithMissingData() {

        $owner = Owner::factory()->create();

        $token = $owner->createToken('Secret')->plainTextToken;

        $pet = Pet::factory()->create([
            "owner_id" => $owner->id,
        ]);

        $updatedPet = Pet::factory()->make([
            "id" => $pet['id']
        ]);

        do {
            $randomKey = array_rand($updatedPet->toArray(), 1);
        } while ($randomKey == "comment");
        unset($updatedPet[$randomKey]);

        $response = $this->withHeader('Authorization', "Bearer $token")
            ->putJson('/api/modify-pet', $updatedPet->toArray());

        $response->assertStatus(400);
        $this->assertDatabaseHas('pet', $pet->toArray());
    }

    public function testdeletePet() {

        $owner = Owner::factory()->create();

        $newPet = Pet::factory()->create([
            "owner_id" => $owner->id,
        ]);

        $token = $owner->createToken('Secret')->plainTextToken;
       
        $response = $this->withHeader('Authorization', "Bearer $token")
            ->deleteJson("/api/delete-pet/$newPet->id");
        
        $response->assertStatus(200);
        $this->assertDatabaseMissing('pet', $newPet->toArray());
    }

    public function testdeleteOthersPet() {

        $otherOwner = Owner::factory()->create();

        $pet = Pet::factory()->create([
            "owner_id" => $otherOwner->id,
        ]);

        $owner = Owner::factory()->create();

        $token = $owner->createToken('Secret')->plainTextToken;
       
        $response = $this->withHeader('Authorization', "Bearer $token")
            ->deleteJson("/api/delete-pet/$pet->id");
        
        $response->assertStatus(404);
        $this->assertDatabaseHas('pet', $pet->toArray());
    }
}
