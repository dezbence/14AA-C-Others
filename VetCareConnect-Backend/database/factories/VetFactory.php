<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Vet>
 */
class VetFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
                "name" => fake()->name(),
                "email" => fake()->unique()->safeEmail(),
                "password" => fake()->password(),
                "postal_code" => fake()->numberBetween(1000, 9999),
                "phone" => fake()->randomNumber(9, true),
                "email_verified_at" => fake()->date(),
                "address" => substr(fake()->address, 5),
                "stamp_number"=> fake()->randomNumber(4, true),
        ];
    }
}
