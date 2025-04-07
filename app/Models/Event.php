<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Event extends Model{


    protected $fillable = ['title', 'descriptions', 'start_time', 'end_time', 'ticket_price'];

    public function bookings(){
        return $this->hasMany(Booking::class);
    }



}
