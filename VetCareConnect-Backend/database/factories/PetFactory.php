<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Pet>
 */
class PetFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $species = ["kutya", "macska"];
        return [
            "name" => fake()->name(),
            "species"=> fake()->randomElement($species),
            "gender" => fake()->numberBetween(0, 1),
            "weight" => fake()->randomFloat(2),
            "born_date" => fake()->date(),
            "comment" => fake()->paragraph(),
            "chip_number" => fake()->regexify("[0-9]{15}"),
            "pedigree_number"=> fake()->regexify("[0-9]{8}")
        ];
    }
}
