<?php

namespace App\Http\Controllers;

use App\Sufficiency;
use App\Crop;
use App\SampleUnit;
use App\GrowthStage;
use Illuminate\Http\Request;
use App\Http\Requests;
use Auth;
use DB;
use Illuminate\Support\Facades\Log;

class SufficiencyController extends Controller{
	public function __construct(){
		$this->middleware('auth');
	}

	public function index(){
		// $suffiency = Sufficiency::orderBy('create_dte', 'desc')->paginate(10);

		$sufficiency = DB::table('sufficiency')
			->join('crop', 'crop.id', '=', 'sufficiency.crop_id')
			->join('sample_unit', 'sample_unit.id', '=', 'sufficiency.sample_unit_id')
			->join('growth_stage', 'growth_stage.id', '=', 'sufficiency.growth_stage_id')
			->paginate(10,['sufficiency.id AS id', 'sufficiency.create_dte AS create_dte', 'sufficiency.added_by AS added_by', 'crop.name AS cropName', 'crop.image_url as imageUrl',
				'growth_stage.name_desc AS growthStageName', 'sample_unit.name_desc AS sampleUnitName'], 'page', null, 'sufficiency');

		$numRows = Sufficiency::count();

		return view('pages.sufficiency-list', compact('sufficiency', 'numRows'));
	}

	/**
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function create(){
		$crops = Crop::all();
		$growthstage = GrowthStage::all();
		$sample_unit = SampleUnit::all();
		return view('pages.sufficiency-create', compact('crops', 'growthstage', 'sample_unit'));
	}

	/**
	 * @desc ADD A NEW SUFFICIENCY TO THE APP AND DB....
	 * @param Request $request
	 *
	 * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
	 */
	public function save(Request $request){
		/// THESE ARE THE CURRENT ELEMENT FIELDS IN THE SUFFICIENCY FORM
		$optional_fields = ['nPercent' => 'n_percent', 'no3PPM'=>'no3_ppm', 'pPercent'=>'p_percent', 'po4PPM'=>'po4_ppm',
		                    'kPercent'=>'k_percent', 'caPercent'=>'ca_percent', 'mgPercent'=>'mg_percent', 'sPercent'=>'s_percent', 'bPPM'=>'b_ppm', 'cuPPM'=>'cu_ppm',
							'fePPM'=>'fe_ppm', 'mnPPM'=>'mn_ppm', 'znPPM'=>'zn_ppm', 'naPercent'=>'na_percent', 'ciPercent'=>'ci_percent'];

		if($request->growthStageId === '? undefined:undefined ?'){
			$request->growthStageId = 0;
			$request['growthStageId'] = 0;
			$_POST['growthStageId'] = 0;
		}
		if($request->sampleUnitId === '? undefined:undefined ?'){
			$request->sampleUnitId = 0;
			$request['sampleUnitId'] = 0;
			$_POST['sampleUnitId'] = 0;
		}

		// TODO: NEED TO DO A EITHER OR KIND OF VALIDATION.  IT SHOULD HAVE  A NEW VAL OR THE NEW ONE
		// ALSO IT'S RETURNING AN ERROR OF MAX 3 CHAR WHEN IT'S EMPTY

		$this->validate($request, [
			'cropId' => 'min:1|max:3|required',
			'growthStageId' => 'min:1|max:3',
			'sampleUnitId' => 'min:1|max:3']);

		$suff = $request->all();
		Log::info('this is the variable >>> bracket -> >>> ' . $suff['growthStageId']);

		foreach ($optional_fields as $key=>$val ){
			if (isset($suff[$key]) && $suff[$key] != '') {
				$suff[$val] = $suff[$key];
			}
		}
		// maybe seperate the arrays to make debuggin easier.... $suff from request->all and array to save...
		$suff['crop_id'] = $suff['cropId'];
		$suff['growth_stage_id'] = $suff['growthStageId'];
		$suff['sample_unit_id'] = $suff['sampleUnitId'];
		$suff['added_by'] = Auth::user()->id;
		$suff['create_dte'] = time();
		$suff['last_update'] = time();


		// I'm using this method because there are many repeats and want to minimize data scattering
		if(isset($suff['newGrowthStageLabel']) && $suff['growthStageId'] === 0){
			$gsNew = new GrowthStage();
			$gsNew->name_desc = $suff['newGrowthStageLabel'];
			$res = $gsNew->save();
			$suff['growth_stage_id'] = DB::getPdo()->lastInsertId();
		}

		if(isset($suff['newSampleUnitLabel']) && $suff['sampleUnitId'] === 0){
			Log::info('new sample unit present');
			$suNew = new SampleUnit();
			$suNew->name_desc = $suff['newSampleUnitLabel'];
			$res_su = $suNew->save();
			$suff['sample_unit_id'] = DB::getPdo()->lastInsertId();
		}

		Sufficiency::create($suff);
		\Session::flash('flash_message', 'Successfully added a New Sufficiency!');
		//will need  a proper response here
		//return response()->json($compatibility);
		return redirect('admin/sufficiency/create');
	}

	public function updateForm($id){
		$crops = Crop::all();
		$growthstage = GrowthStage::all();
		$sample_unit = SampleUnit::all();
		return view('pages.sufficiency-update', compact('crops', 'growthstage', 'sample_unit'));
	}

	public function update(Request $request, $id){
		$element = Element::find($id);

		$this->validate($request,[
			'symbol'=>'min:3|max:50',
			'elementName'=>'min:1|max:45|required',
			'chemicalName'=>'min:1|max:45',
			'elementDesc'=>'min:10|max:75']);

		$validated = $request->all();

		if(isset($validated['elementName']) && $validated['elementName'] != ''){ $element->element_name = $validated['elementName']; }
		if(isset($validated['chemicalName']) && $validated['chemicalName'] != ''){ $element->chemical_name = $validated['chemicalName']; }
		if(isset($validated['elementDesc']) && $validated['elementDesc'] != ''){ $element->element_desc = $validated['elementDesc']; }
		if(isset($validated['benefitsText']) && $validated['benefitsText'] != ''){$element['benefits'] = $validated['benefitsText'];}
		if(isset($validated['deficiencyText']) && $validated['deficiencyText'] != ''){$element['deficiency'] = $validated['deficiencyText'];}

		$element->last_update_by = Auth::user()->id;
		$element->last_update = time();
		$element->save();
		\Session::flash('flash_message', 'Successfully updated this Element!');

		return redirect('admin/element/list');
	}

	public function delete($id){
		$suff = Sufficiency::find($id);
		$suff->delete();

		\Session::flash('flash_message', 'Successfully removed Sufficiency Row!');
		return redirect('admin/sufficiency/list');
	}
}
