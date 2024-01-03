<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class Pet extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        //return parent::toArray($request);
        return [
            'id' => $this->id,
            'species' => $this->species,
            'gender' => $this->gender,
            'weight' => $this->weight,
            'born_date' => $this->born_date->format('Y.m.d'),
            'comment' => $this->comment,
            'owner_id' => $this->owner->id,
            'owner_name' => $this->owner->id
        ];
    }
}
