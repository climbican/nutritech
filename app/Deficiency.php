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
        'deficiency_description'];
    public $timestamps = false;
    protected $dateFormat = 'U';
}
