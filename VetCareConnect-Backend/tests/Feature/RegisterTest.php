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

    private function RegisterData(&$ownerData, &$vetData)  {

        $password = fake()->password();

        $owner = Owner::factory()->make();
        $vet = Vet::factory()->make();

        $vetData = $vet->toArray();
        $ownerData = $owner->toArray();

        unset($ownerData['email_verified_at']);
        unset($vetData['email_verified_at']);

        $ownerData = array_merge($ownerData, ['role' => 0, 'password' => $password, 'confirm_password' => $password]);
        $vetData = array_merge($vetData, ['role' => 1, 'password' => $password, 'confirm_password' => $password]);

    }

    public function testRegisterWithRightData(): void
    {
        $registerOwnerData;
        $registerVetData;
        $this->RegisterData($registerOwnerData, $registerVetData);

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

        $registerOwnerData;
        $registerVetData;
        $this->RegisterData($registerOwnerData, $registerVetData);

        unset($registerOwnerData[array_rand($registerOwnerData, 1)]);
        unset($registerVetData[array_rand($registerOwnerData, 1)]);

        $response = $this->postJson('/api/register', $registerOwnerData);
        $response
            ->assertStatus(400);

        $response = $this->postJson('/api/register', $registerVetData);
           $response
            ->assertStatus(400);
    }

    public function testRegisterUsedEmail(): void {

        $usedEmail = fake()->safeEmail();

        Vet::factory()->create([
            'email' => $usedEmail,
        ]);

        $registerOwnerData;
        $registerVetData;
        $this->RegisterData($registerOwnerData, $registerVetData);

        $registerOwnerData['email'] = $usedEmail;
        $registerVetData['email'] = $usedEmail;

        $response = $this->postJson('/api/register', $registerOwnerData);
        $response
            ->assertStatus(400);

        $response = $this->postJson('/api/register', $registerVetData);
           $response
            ->assertStatus(400);
    }

    
}
