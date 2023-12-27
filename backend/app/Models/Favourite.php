<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Favourite extends Model
{
    use HasFactory;

    protected $fillable = ['user_id', 'medcine_id'];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function medcines()
    {
        return $this->belongsTo(Medcine::class);
    }
}
