<?php

namespace App\Listeners;

use App\Events\sent;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class updateMedcineQuantity
{
    /**
     * Create the event listener.
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     */
    public function handle(sent $event): void
    {
        // Retrieve the order from the event and update the quantities of medicines
        $order = $event->order;
        
        // Assuming you have a relationship between Order and OrderItem
        $order->items()->each(function ($item) {
            $medcine = $item->medcine;
            $medcine->decrement('qtn', $item->qtn_requested);
        });
    }
}
