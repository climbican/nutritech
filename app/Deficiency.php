<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Deficiency extends Model
{
    protected $table = 'deficiency';
    protected $fillable = ['id',
        'element_id',
        'crop_id',
        'name_short',
        'deficiency_description',
        'image_1',
        'image_2',
        'image_3',
        'image_4'];
    public $timestamps = false;
    protected $dateFormat = 'U';
}
