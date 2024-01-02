<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class OrderItemsResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $medcines=$this->medcine()->get();
        return [
            "medcine_id"=>$this->medcine_id,
            'order_id'=>$this->order_id,
            'qtn_requested'=>$this->qtn_requested,
            "medcines"=> MedcineResource::collection($medcines)
        ];
    }
}
