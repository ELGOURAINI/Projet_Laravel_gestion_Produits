<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = ['description', 'price'];

    public function images()
    {
        return $this->hasMany(Product_images::class);
    }
}