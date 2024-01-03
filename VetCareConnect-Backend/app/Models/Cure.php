<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cure extends Model
{
    use HasFactory;

    protected $fillable =[
        'date',
        'pet_id',
        'cure_type_id',
        'vet_id'
    ];

}
