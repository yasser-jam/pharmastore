<?php
// File: app/Notifications/OrderNotification.php

namespace App\Notifications;

use Illuminate\Notifications\Notification;

class OrderNotification extends Notification
{
    public $order;

    public function __construct($orderid)
    {
        $this->orderid = $orderid;
    }

    public function toDatabase($notifiable)
    {
        return [
            'order_id' => $this,
            // Add other data if needed
        ];
    }
}
