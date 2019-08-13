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
use App\Element;
use App\Deficiency;
use DB;
use Auth;
use Illuminate\Support\Facades\Session;
use File;
use App\Http\Controllers\boolean;

class DeficiencyController extends Controller{
	// name of the uploaded deficiency image
	private $image_name;

	public function __construct(){
		$this->middleware('auth');
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
}
