<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create a single user with your specific information
        User::factory()->create([
            'name' => 'Hisham Alzain',
            'password' => bcrypt('12345678'),
            'isStoreowner'=>True,
            'phoneNumber'=>"0931465737",
            'email' => 'manger@gmail.com',
            "address"=>"damascus"
            // Add other user attributes as needed
        ]);
    }
}
