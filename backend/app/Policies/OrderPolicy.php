<?php

namespace App\Policies;

use App\Models\Order;
use App\Models\User;
use Illuminate\Auth\Access\Response;

class OrderPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        return true;
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, Order $order): bool
    {
        return $user->id==$order->user_id || $user->isStoreOwner;
    }

    /**
     * Determine whether the user can create models.
     */
    public function placeOrder(User $user): bool
    {
        return true;
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, Order $order): bool
    {
        return $user->id==$order->user_id;
    }
    public function updateStatus(User $user, Order $order): bool
    {
        return $user->isStoreOwner;
    }

    public function updateBillingStatus(User $user, Order $order): bool
    {
        return $user->isStoreOwner;
    }
}
