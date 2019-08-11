<?php
/**
 * Name: DeficiencyController
 *
 * Description:
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
 * Notes:  TODO : NEED TO MAKE THE WHOLE IMAGE DYNAMIC, THIS IS TOO MUCH WORK.
 */

namespace App\Http\Controllers;
// MODELS
use Illuminate\Http\Request;
use App\Crop;
use App\Element;
use App\Deficiency;
use App\ImageStore;
use DB;
use Auth;
use Illuminate\Support\Facades\Session;
use File;
use App\Http\Controllers\boolean;

class DeficiencyController extends Controller{
	// name of the uploaded deficiency image
	private $image_name;

	public function __construct(){
		// $this->middleware('auth');
	}

	/**
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function index(){
		$def = Deficiency::orderBy('create_dte', 'desc')->paginate(10);
		$numRows = Deficiency::count();

		foreach($def as $defe){
			//this "if" just sets image one as the default in the list
			if(!file_exists(public_path('images/def/'.$defe->image_1)) || $defe->image_1 === ''){
				$def->image_1 = 'no-image.png';
			}
			/**else{
			if(is_null($defe->image_1) ){ $def->image_1 = 'images/no-image.png'; }
			else{
			$def->image_1 = 'images/def/'.$defe->image_1;
			}
			}**/
			$def->crop_name = DB::table('crop')->where('id', $defe->crop_id)->value('name');
		}

		return view('pages.deficiency-list', compact('def', 'numRows'));
	}

	/**
	 * @return a list of deficiencies, mostly for the mobile app, can serve as a remote fetch later
	 *
	 */

	public function fetchList(){
		$def = Deficiency::all();
		$result = [];

		foreach($def as $d){
			array_push($result, array('id'=>$d->id, 'nameShort'=>$d->name_short, 'defDescription'=>$d->deficiency_description, 'elementID'=>$d->element_id,
			                          'cropID'=>$d->crop_id, 'image1'=>$d->image_1, 'image2'=>$d->image_2, 'image3'=>$d->image_3, 'image4'=>$d->image_4));
		}
		return json_encode($result);
	}

	/**
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function create(){
		$crops = DB::table('crop')->orderby('name', 'asc')->orderby('sub_type')->get();
		$elements = Element::all();
		return view('pages.deficiency-create', compact('crops', 'elements'));
	}

	/**
	 * @param Request $request
	 * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
	 */
	public function save(Request $request){
		$nowTime = time();
		$this->validate($request, ['nameShort' => 'max:35|unique:deficiency,name_short|required',
		                           'cropID' => 'required|integer',
		                           'elementID' => 'required|integer']);

		$validated = $request->all();

		$d = new Deficiency();
		$d->deficiency_description = '';

		for($i=1; $i<5; $i++){
			if($request->hasFile('image'.$i)){
				$imageTmpName = explode('.', $request->file('image'.$i)->getClientOriginalName());
				$imageName = sha1(preg_replace("/[^ \w]+/", '',time().$imageTmpName[0] ) );
				$field_name = 'image_'.$i;
				//Image::make($image->getRealPath())->resize(200, 200)->save($path);

				$d->$field_name = substr($imageName, 0,40).'.'.$imageTmpName[1];
				$request->file('image'.$i)->move(base_path() . '/public/images/def/', $d->$field_name);
			}
		}
		if(isset($validated['defDescription']) && $validated['defDescription'] != '' ){ $d->deficiency_description = $validated['defDescription']; }
		$d->name_short = $validated['nameShort'];
		$d->element_id = $validated['elementID'];
		$d->crop_id = $validated['cropID'];
		//TRACKING
		$d->added_by = Auth::user()->id;
		$d->create_dte = $nowTime;
		$d->last_update = $nowTime;
		$d->removed_dte = $nowTime;

		$d->save();

		Session::flash('flash_message', 'Successfully created a new Deficiency Correlation');

		return redirect('admin/deficiency/create');
	}

	/**
	 * @param $id
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function updateForm($id){
		$def = Deficiency::find($id);
		$crops = DB::table('crop')->orderby('name', 'asc')->orderby('sub_type')->get();
		$elements = Element::all();

		$def->nameShort = $def->name_short;
		$def->defDescription = $def->deficiency_description;
		$def->elementID = $def->element_id;
		$def->cropID = $def->crop_id;
		unset($def->crop_id);

		for($i=1; $i<5; $i++){
			$imageName = 'image_'.$i;
			$imagePath = 'images/def/'.$def->$imageName;

			if(!file_exists(public_path($imagePath)) || $def->$imageName === '' || is_null($def->$imageName)){
				$def->$imageName = 'images/no-image.png';
			}
			else{
				$def->$imageName = $imagePath;
			}
		}

		return view('pages.deficiency-update', compact('def', 'crops', 'elements'));
	}


	public function removeImage($number, $id){
		$d = Deficiency::find($id);
		$imageField = 'image_'.$number;
		if($d->$imageField !== ''){
			File::delete(base_path().'/public/images/def/'.$d->$imageField);
			$d->$imageField = null;
			$d->save();
		}

		$data = [array('imagePosition'=>$number)];
		return json_encode($data);
	}
	/**
	 * @param Request $request
	 * @param $id
	 * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
	 */
	public function update(Request $request, $id){
		/**
		 * NEED TO CREATE  A FUNCTION TO REMOVE INDIVIDUAL IMAGES OR
		 * -- REWRITE TO MAKE IT DYNAMIC LIKE I DO IN THE BOAT AD
		 *
		 *
		 * FOR THE MOMENT DO A REMOVE IMAGE
		 *
		 * THEN UPGRADE IT LATER....... UGGG.
		 */
		$nowTime = time();

		$validated = $request->all();

		$this->validate($request, ['nameShort' => 'max:35|required',
		                           'cropID' => 'required',
		                           'elementID' => 'required']);

		$validated['cropID'] = str_replace('number:',"",$validated['cropID']);
		$validated['elementID'] = str_replace('number:', "", $validated['elementID']);

		$d = Deficiency::find($id);

		for($i=1; $i<5; $i++){
			if($request->hasFile('image'.$i) && $validated['image'.$i] !== ''){
				//remove the old file first
				File::delete(base_path().'/public/images/def/'.$d['image_'.$i]);

				$imageTmpName = explode('.', $request->file('image'.$i)->getClientOriginalName());
				$imageName = sha1(preg_replace("/[^ \w]+/", '',time().$imageTmpName[0] ) );
				$field_name = 'image_'.$i;
				//Image::make($image->getRealPath())->resize(200, 200)->save($path);

				$d->$field_name = substr($imageName, 0,40).'.'.$imageTmpName[1];
				$request->file('image'.$i)->move(base_path() . '/public/images/def/', $d->$field_name);
			}
		}

		$d->name_short = $validated['nameShort'];
		$d->deficiency_description = $validated['defDescription'];
		$d->element_id = $validated['elementID'];
		$d->crop_id = $validated['cropID'];
		//TRACKING
		$d->last_update = $nowTime;
		$d->removed_dte = $nowTime;

		$d->save();

		Session::flash('flash_message', 'Successfully Update a new Deficiency Correlation');

		return redirect('admin/deficiency/list');
	}

	public function fetchDeficiency($id){
		$d = Deficiency::find($id);

		$d->nameShort = $d['name_short'];
		$d->defDescription = $d->deficiency_description;
		$d->elementID = $d->element_id;
		$d->cropID = $d->crop_id;
		$d->image1  = $d->image_1;
		$d->image2 = $d->image_2;
		$d->image3 = $d->image_3;
		$d->image4 = $d->image_4;

		unset($d->image_1);
		unset($d->image_2);
		unset($d->image_3);
		unset($d->image_4);
		unset($d->crop_id);
		unset($d->element_id);
		//$def = ['deficiency'=>$d];

		return json_encode($d);
	}

	/**
	 * @param $id
	 * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
	 */
	public function delete($id){
		$d = Deficiency::find($id);

		for($i=1; $i<5; $i++){
			$imageName = 'image_'.$i;
			if(file_exists(public_path('images/def/'.$d->$imageName)) ){
				File::delete(base_path().'/public/images/def/'.$d->$imageName);
			}
		}
		$d->delete();
		return redirect('admin/deficiency/list');
	}

	/**
	 * @desc add new image which needs approval
	 * @param Request $request JSON {imageData:base64, deficiencyId:number, ?name:string, ?descriptor:string, ?deficiencyTraits}
	 * @return string - containing status of request
	 */
	public function add_new_image(Request $request) : string {
		//bounce back info for now
		$id = $request->input('deficiencyId');  // this works
		$image = $request->input('imageData');
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
