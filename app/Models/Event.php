<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Event extends Model{


    protected $fillable = ['title','venue_name','descriptions', 'start_time', 'end_time', 'ticket_price','event_image'];

    public function bookings(){
        return $this->hasMany(Booking::class);
    }



}
