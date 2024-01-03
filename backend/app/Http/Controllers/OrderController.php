<?php

namespace App\Http\Controllers;

use App\Events\sent;
use App\Models\User;
use App\Models\Order;
use App\Events\NewOrder;
use App\Models\OrderItem;
use App\Http\Requests\statusRequest;
use App\Notifications\OrderNotification;
use Illuminate\Support\Facades\Gate;
use App\Http\Resources\OrderCollection;
use App\Http\Requests\StoreOrderRequest;
use App\Http\Requests\UpdateOrderRequest;
use App\Http\Resources\MedcineCollection;
use App\Http\Requests\billingStatusRequest;
use App\Notifications\OrderStatusNotification;

class OrderController extends Controller
{  /**
    * Place a new order.
    */
   public function placeOrder(StoreOrderRequest $request)
   {
    Gate::authorize('placeOrder',Order::class);
       $order = Order::create([
           'user_id' => auth()->user()->id,
       ]);
       foreach ($request->input('items') as $item) {
           OrderItem::create([
               'order_id' => $order->id,
               'medcine_id' => $item['medcine_id'],
               'qtn_requested' => $item['qtn'],
           ]);
       }
       //call the new order event for listner
       event(new NewOrder($order));
       $orderid = $order->id;
       $storeOwner = User::where('isStoreOwner', true)->first();
       $owner_id = $storeOwner->id;
       $pharmacist=User::find($owner_id);
       $notafication=new OrderNotification($orderid);
 
       return response()->json(['message' => 'Order placed successfully']);
   }

   /**
    * View orders for the authenticated pharmacy user.
    */
   public function index()
   {
       return new OrderCollection(Order::where('user_id', auth()->user()->id)->get());
   }

   /**
    * View all orders from the warehouse perspective.
    */
   public function viewAllOrders()
   {
       return new OrderCollection(Order::all());
   }

   // delete an order
   public function destroy(Order $order){
    $order->delete();
    return response()->json([
        "message"=> "the order has been deleted successfully",
    ],201);
}  

   /**
    * Update the status of an order.
    */
   public function updateStatus($orderId,statusRequest $status)
   {
      
       $order = Order::findOrFail($orderId);
       if($status->status === 'sent'){
           event(new sent($order));
       }


       $order = Order::findOrFail($orderId);
       $order->status = $status->status;
       $order->save();

       $pharmacist_id = $order->user_id;
       $pharmacist = User::where('id', $pharmacist_id)->first(); 
       //$pharmacist->notify(new OrderStatusNotification($order));

       return response()->json(['message' => 'Order status updated']);
   }

   /**
    * Update the billing status of an order.
    */
   public function updateBillingStatus($orderId,billingStatusRequest $billingstatus)
   {

       $order = Order::findOrFail($orderId);
       $order->billingstatus = $billingstatus->status;
       $order->save();

       return response()->json(['message' => 'Payment status updated']);
   }
     


//    public function __construct()
//    {
//        $this->authorizeResource(Order::class, 'orders');
//    }
}
