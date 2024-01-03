<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Special_opening extends Model
{
    use HasFactory;

    protected $fillable =[
        'working_hours',
        'date',
        'vet_id'
    ];
}
