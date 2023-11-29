<?php

namespace Database\Seeders;

use App\Models\Role;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Création des rôles
        $adminRole = Role::where('name', 'admin')->first();
        $managerRole = Role::where('name', 'manager')->first();

        // Création des utilisateurs avec rôles
        $adminUser = User::create([
            'name' => 'Admin User',
            'email' => 'admin@gmail.com',
            'password' => 'admin',
        ]);
        $adminUser->roles()->attach($adminRole);

        $managerUser = User::create([
            'name' => 'Manager User',
            'email' => 'manager@gmail.com',
            'password' => 'manager',
        ]);
        $managerUser->roles()->attach($managerRole);
    }
}