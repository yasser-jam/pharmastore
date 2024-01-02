<?php

namespace Database\Factories;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Factories\Factory;

class OrderItemFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $medcine_ids=DB::table('medcines')->pluck('id');
        $order_ids=DB::table('Orders')->pluck('id');
        return [
          'medcine_id'=>$this->faker->randomElement($medcine_ids),
          'order_id'=>  $this->faker->randomElement($order_ids),
          'qtn_requested'=>$this->faker->numberBetween(1,50)
        ];
    }
}
