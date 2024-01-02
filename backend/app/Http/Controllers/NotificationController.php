<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class NotificationController extends Controller
{
    // In a controller, e.g., NotificationController.php
public function getPharmacistNotifications(Request $request)
{
    $user = $request->user();
    $notifications = $user->unreadNotifications;

    return response()->json(['notifications' => $notifications]);
}
public function getAdminNotifications(Request $request)
{
    $user = $request->user();
    $notifications = $user->unreadNotifications;

    return response()->json(['notifications' => $notifications]);
}
}
