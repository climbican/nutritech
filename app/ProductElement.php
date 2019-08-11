<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductElement extends Model
{
    protected $table = 'product_element';
    protected $fillable = [
        'product_id',
        'element_id',
        'percent',
	    'is_guaranteed_amt',
        'weight',
        'create_dte',
        'last_update'];
    public $timestamps = false;
    protected $dateFormat = 'U';
}
