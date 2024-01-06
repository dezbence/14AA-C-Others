<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vet extends Model
{
    use HasFactory;

    protected $table = "vet";

    protected $fillable =[
        'name',
        'email',
        'password',
        'address',
        'phone'
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'password' => 'hashed',
    ];

    public function cures() {
        return $this->hasMany(Cure::class);
    }

    public function special_openings() {
        return $this->hasMany(Special_opening::class);
    }

    public function openings() {
        return $this->hasMany(Opening::class);
    }
}
