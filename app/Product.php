<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'product';
    protected $fillable = ['id',
        'product_group',
        'product_name',
        'product_subname',
        'product_code',
        'benefits',
        'compatibility',
        'dilution',
        'warning',
        'caution',
        'net_contents',
        'image_url',
        'added_by',
        'last_update_by',
        'create_dte',
        'last_update'];
    public $timestamps = false;
    protected $dateFormat = 'U';
}
