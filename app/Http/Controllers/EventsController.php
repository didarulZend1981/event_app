<?php

namespace App\Http\Controllers;

use App\Models\Event;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

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

   






public function updateEvent(Request $request, $id)
{
    $request->validate([
        'title' => 'required',
        'start_time' => 'required',
        'end_time' => 'required',
        'ticket_price' => 'required',
    ]);

    $event = Event::findOrFail($id);
    $event->update($request->except('event_image'));

    if ($request->hasFile('event_image')) {

        // ✅ পুরাতন ইমেজ থাকলে ডিলিট করুন
        if (!empty($event->event_image)) {
            $oldImage = basename($event->event_image);
            $path = 'event_images/' . $oldImage;

            if (Storage::exists($path)) {
                Storage::delete($path);
            }
        }

        // ✅ নতুন ইমেজ আপলোড করুন
        $image = $request->file('event_image');
        $imageName = 'event_image_' . time() . '.' . $image->getClientOriginalExtension();
        $image->storeAs('event_images', $imageName);

        $event->event_image = 'event_images/' . $imageName;
        $event->save();
    }

    return response()->json([
        'message' => 'Update success',
        'data' => $event
    ]);
}

    public function createEvent(Request $request){
        // dd($request->all());
        $request->validate([
            'title' => 'required',
            'start_time' => 'required',
            'end_time' => 'required',
            //add this line live host
            'event_image' => 'nullable|mimes:jpg,jpeg,png,gif,webp|max:2048'

        ]);
        //add this line live host
        $event_image = null;
        if($request->hasFile('event_image')){
            // $profile_image = $request->file('profile_image')->store('profile_images');
            $image = $request->file('event_image');
            $event_image_name = 'event_image_'.time(). '.' . $image->getClientOriginalExtension();
            $image->storeAs('event_images', $event_image_name);
            $event_image = 'event_images/'.$event_image_name;
        }





        $event = Event::create([
            'venue_name' => $request->venue_name,
            'title' => $request->title,
            'start_time' => $request->start_time,
            'end_time' => $request->end_time,
            'ticket_price' => $request->ticket_price,
            'descriptions' => $request->descriptions,
            //add this line live host
            'event_image' => $event_image,

        ]);



        return response()->json([
            'status'=> true,
            'message'=> 'Event insert  successfull',
            'data'=> $event,
            //  'data'=> $data,

        ], 200);




    }


    public function deleteEvent($id){
                // Step 1: ইভেন্ট খুঁজে বের করা
                $event = Event::findOrFail($id);

                // Step 2: ইমেজ ফাইলের নাম বের করা (যদি ইমেজ থাকে)
                if (!empty($event->event_image)) {
                    // event_image এর path থেকে basename (ফাইল নাম) বের করা
                    $fileName = basename($event->event_image); // উদাহরণ: event_image_17234543.jpg

                    // Step 3: স্টোরেজ path ঠিক করা
                    $filePath = 'event_images/' . $fileName;

                    // Step 4: ফাইলটি থাকলে মুছে ফেলা
                    if (Storage::disk('public')->exists($filePath)) {
                        Storage::disk('public')->delete($filePath);
                    }
                }

                // Step 5: ডাটাবেজ থেকে ইভেন্ট ডিলিট করা
                $event->delete();

                // Step 6: রেসপন্স পাঠানো
                return response()->json([
                    'message' => 'Delete success',
                    'data' => ''
                ]);
            }






}
