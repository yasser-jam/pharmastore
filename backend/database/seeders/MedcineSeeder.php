<?php

namespace Database\Seeders;

use App\Models\Medcine;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class MedcineSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $jsonString = file_get_contents('C:\xampp\htdocs\MedicalBay\public\temp.json');
        $data = json_decode($jsonString, true);
        
        foreach ($data as $items) {
            foreach($items as $item){
                $item['category_id']=$item['category']['id'];
                unset($item['category']);
                Medcine::create($item);
            }
            
        }
    }
}
