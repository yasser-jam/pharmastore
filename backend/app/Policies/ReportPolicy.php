<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Report;

class ReportPolicy
{
    public function getReport(User $user){
        return $user->isStoreOwner;
    }
    public function pharmacySales(User $user){
        return $user->isStoreOwner;
    }
}
