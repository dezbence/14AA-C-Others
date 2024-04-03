<?php

namespace Tests\Unit;

use Illuminate\Http\Response;
// use PHPUnit\Framework\TestCase;
use Tests\TestCase;

class PetTest extends TestCase
{
    
    public function loginForPets() {
        $loginDataOwner = [
            'email' => 'test.email.used.owner@example.com',
            'password' => "Teszt123"
       ];

       $response = $this->postJson('/api/login', $loginDataOwner);
           $response->assertStatus(200);

        $return = $response->getData()->data->token;
    }

    public function testPets(): void
    {

        $token = $this->loginForPets();

        $response = $this->withHeader('Authorization', 'Bearer '.$token)
            ->json('get', '/api/pets');

        $response->assertStatus(200);

        //new pet
        $newPet = [
            "name" => "Teszt Kutya",
            "species"=> "kutya",
            "gender" => "0",
            "weight" => "15.00",
            "born_date" => "2024-01-01",
            "comment" => "",
            "chip_number" => 123456789123456,
            "pedigree_number"=> 12345678
        ];

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
