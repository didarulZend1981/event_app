<?php

namespace App\Http\Controllers;

use App\Models\Event;
use Illuminate\Http\Request;

class EventsController extends Controller
{
    public function events(){
        $events = Event::all();
        return response()->json([
            'status'=> true,
            'message'=> 'Events data',
            'data'=> $events,
        ], 200);
    }

    public function getEvent(Event $event) {
        return response()->json([
            'status'=> true,
            'message'=> 'Event data',
            'data'=> $event,
        ], 200);
    }

    public function updateEvent(Request $request, $id){

        // dd($request->all());

        // print_r($request->all());exit;
        // print_r($request->id);exit;
        $request->validate([
            'title' => 'required',
            'start_time' => 'required',
            'end_time' => 'required',
            'ticket_price' => 'required',
        ]);

        $event = Event::findOrFail($id);

        $event->update($request->all());

        return response()->json(['message' => 'update success', 'data' => $event]);
    }



    public function createEvent(Request $request){
        // dd($request->role);
        $request->validate([
            'title' => 'required',
            'start_time' => 'required',
            'end_time' => 'required',

        ]);


        $event = Event::create([
            'title' => $request->title,
            'start_time' => $request->start_time,
            'end_time' => $request->end_time,
            'ticket_price' => $request->ticket_price,
            'descriptions' => $request->descriptions,

        ]);


        return response()->json([
            'status'=> true,
            'message'=> 'Event insert  successfull',
            'data'=> $event,

        ], 200);

    }

}
