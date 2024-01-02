<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Medcine;
use Illuminate\Http\Request;
use App\Http\Resources\OrderItemsResource;

class ReportsController extends Controller
{
    function getReport(){
        $pharmacists=User::where("isStoreOwner",false)->get();
        $sum=0;
        $max=0;
        $allorders=0;
        $sales=0;
        $noMed=0;
        $maxpharmacist=null;
        foreach($pharmacists as $pharmacist){
            $orders=$pharmacist->orders()->get();
            $allorders+=$orders->count();
            if($orders->count()>$max){
                $max=$orders->count();
                $maxpharmacist=$pharmacist;
            }
            foreach($orders as $order){
                $items=$order->items()->get();
                foreach($items as $item){
                    $noMed+=$item->qtn_requested;
                    $medcine=$item->medcine()->get();
                    $sum+=$item->qtn_requested *$medcine[0]["price"];    
                }
            }
        }
        
        
        return response()->json([
            "No_of_pharmacies"=> $pharmacists->count(),
            "Most_ordering_pharmacy"=>$maxpharmacist,
            "Most_ordering_pharmacy_number_Of_orders"=>$max,
            "Sum_of_all_Orders"=>$allorders,
            "Total_Sales"=>$sum,
            "Total_of_medcines_Sold"=>$noMed
        ]);
    }
}
