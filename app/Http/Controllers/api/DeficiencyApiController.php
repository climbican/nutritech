<?php
/**
 * Name: CropApiController
 *
 * Description: This is to be used by the app when accessing the db.
 *
 *
 * Copyright (c) 2018. All Code is the property of Ledgedog unless unless otherwise specified by contract.
 *
 *          (\ /)
 *          (O .o)
 *          (> "<)
 *          (_/\_)
 *      ]) o 0 []v[]
 *
 *
 *
 * @author Michael Rumack
 * @company Ledgedog
 * User: climbican
 * Date: 8/5/19
 * Time: 2:35 PM
 * Last Mod:
 * Notes:  TODO : NEED TO MAKE THE WHOLE IMAGE DYNAMIC, THIS IS TOO MUCH WORK.  This needs to be updated with the code from the server!!!!!!
 */

namespace App\Http\Controllers\api;

use App\Deficiency;
use App\ImageStore;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class DeficiencyApiController{
	public function __construct() {}

	public function fetch_list_from_crop_id($id) {
		$result = Deficiency::where('crop_id', '=', $id)->orderby('id', 'asc')->orderby('id', 'asc')->get(['id', 'name_short AS nameShort', 'image_1 AS image1', 'element_id AS elementId']);

		return json_encode(['status'=> 200, 'message'=>'Deficiency list', 'defList'=>$result]);
	}

	public function deficiency_detail($id) {
		$result = Deficiency::where('id', '=', $id)->get(['id', 'name_short AS nameShort', 'deficiency_description AS defDescription', 'image_1 AS image1', 'image_2 AS image2', 'image_3 AS image3', 'image_4 AS image4', 'element_id AS elementId']);

		return json_encode(['status'=> 200, 'message'=>'Deficiency detail', 'defDetail'=>$result[0]]);
	}

	/**
	 * @desc add new image which needs approval
	 * @param Request $request JSON {imageData:base64, deficiencyId:number, ?name:string, ?descriptor:string, ?deficiencyTraits}
	 * @return string - containing status of request
	 */
	public function add_new_image(Request $request) : string {
		//Log::info('what the shit');
		//Log::info('wtf>>> '.print_r(file_get_contents('php://input'), true));
		//bounce back info for now
		$tmp = json_decode(file_get_contents('php://input'));
		//echo 'value of  id>>>'.$tmp->deficiencyId;
		// CORS IS NOT PLAYING NICE SO I HAD TO USE PLAIN/TEXT ON THE REQUEST BODY
		// THE RESULT IS THAT LARAVEL DOES NOT RECOGNIZE IT AS JSON... MAKES SENSE.
		$id = $tmp->deficiencyId;// $request->input('deficiencyId');  // this works
		$image = $tmp->imageData; // $request->input('imageData');
		// validate that the deficiency exists
		$def = Deficiency::find($id);

		//FIRST LET'S MAKE SURE THE DATA IS VALID OR AS MUCH SO AS POSSIBLE.
		if(!isset($def->name_short) || $def->name_short === '') {
			return json_encode(['status'=> 400, 'message'=>'There was an issue with the request']);
		}

		if( !substr( $image, 0, 5 ) === "data:" ){
			return json_encode(['status'=> 400, 'message'=>'Invalid data format.']);
		}

		if(!$this->save_base64_image($image, $def->name_short)) {
			return ['status'=>400, 'message'=>'There was an issue while saving the uploaded image'];
		}

		// save image to database New Image Store
		$nis = new ImageStore();
		$nis->link_table = 'deficiency';
		$nis->linked_table_id = $def->id;
		$nis->image_name = $this->image_name;
		$nis->active = false;
		$nis->create_dte = time();
		$nis->create_by = 999; // current temp code for user generated image
		$nis->last_update = time();
		$nis->last_update_by = 999;

		// save the new image
		$nis->save();

		return json_encode(['status'=>200, 'message'=>'Deficiency image successfully added.']);
	}

	/**
	 * @desc CONVERT BASE 64 IMAGE TO JUST IMAGE :)
	 *
	 * NOTE: future feature would be to add thumbnail
	 *
	 * @param string $base64_image_string
	 * @param string $output_file_name_without_extension
	 *
	 * @return bool
	 */
	private final function save_base64_image(string $base64_image_string, string $output_file_name_without_extension): bool{
		$splited = explode(',', substr( $base64_image_string , 5 ) , 2);
		$mime=$splited[0];
		$data=$splited[1];

		$mime_split_without_base64=explode(';', $mime,2);
		$mime_split=explode('/', $mime_split_without_base64[0],2);
		if(count($mime_split)==2) {
			$extension=$mime_split[1];
			if($extension=='jpeg')$extension='jpg';
			$img_name = substr(sha1(preg_replace("/[^ \w]+/", '',time().$output_file_name_without_extension ) ), 0, 40);
			$this->image_name = $img_name.'.'.$extension;
		}
		else{
			return false;
		}
		file_put_contents( base_path() . '/public/images/def/'. $this->image_name, base64_decode($data) );

		return true;
	}
}
