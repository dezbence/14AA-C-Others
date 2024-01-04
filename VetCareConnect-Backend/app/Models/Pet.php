<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pet extends Model
{
    use HasFactory;

    protected $table = "pet";

    protected $fillable =[
        'name',
        'species',
        'gender',
        'weight',
        'born_date',
        'comment',
        'register_number',
        'owner_id'
    ];

    public function owner() {
        return $this->belongsTo(Owner::class, 'owner_id', 'id');
    }

    public function cures() {
        return $this->hasMany(Cure::class);
    }
}
