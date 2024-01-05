<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Owner;

class MainController extends Controller
{
    public function getOwnerData() {

        $ownerData = Owner::select('name', 'email', 'address', 'phone')
        ->get();

        return response()->json($ownerData, 200);
    }
}
