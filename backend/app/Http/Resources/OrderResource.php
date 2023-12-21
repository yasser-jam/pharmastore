<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use App\Http\Resources\OrderItemsCollection;
use Illuminate\Http\Resources\Json\JsonResource;

class OrderResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $items=$this->items()->get();
        return [
            "id"=>$this->id,
            "user_id"=>$this->user_id,
            "status"=> $this->status,
            "billingstatus"=>$this->billingstatus,
            "items"=> OrderItemsResource::collection($items)
        ];
    }
}
