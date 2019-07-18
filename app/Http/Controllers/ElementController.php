<?php

namespace App\Http\Controllers;

use App\Element;
use Illuminate\Http\Request;
use App\Http\Requests;
use Auth;
use DB;

class ElementController extends Controller{
    public function __construct(){
        $this->middleware('auth');
    }

    public function index(){
        $elements = Element::orderBy('create_dte', 'desc')->paginate(10);
        $numRows = Element::count();

        return view('pages.elements-list', compact('elements', 'numRows'));
    }

    /**
     * @Desc: FETCH A LIST OF THE ELEMENTS LISTED IN THE DB
     *
     * @return string
     */
    public function fetchList(){
        $result = [];
        $items = Element::all();

        foreach($items as $item) {
            array_push($result, array('id'=>$item->id, 'name'=>$item->element_name, 'chemName'=>$item->chemical_name, 'deficiencyText'=>$item->deficiency, 'benefitsText'=>$item->benefits, 'showFlag'=>$item->show_flag)) ; //'symbol'=>$item->symbol,  future use
        }

        return json_encode($result);
    }
    //CREATE NEW COMPATIBILITY
    public function create(){
        return view('pages.elements-create');
    }
    //ADD NEW COMPATIBILITY TO DATABASE
    public function save(Request $request){
        $this->validate($request,[
            'symbol'=>'min:3|max:50',
            'elementName'=>'min:1|max:45|required',
            'chemicalName'=>'min:1|max:45',
            'elementDesc'=>'min:10|max:125',
            'deficiencyText'=>'max:250',
            'benefitsText'=>'max:250']);

        $element = $request->all();

        $element['element_name'] = '';
        $element['element_desc'] = '';

        if(isset($element['elementName']) && $element['elementName'] != ''){ $element['element_name'] = $element['elementName']; }
        if(isset($element['chemicalName']) && $element['chemicalName'] != ''){ $element['chemical_name'] = $element['chemicalName']; }
        if(isset($element['elementDesc']) && $element['elementDesc'] != ''){ $element['element_desc'] = $element['elementDesc']; }
        if(isset($element['benefitsText']) && $element['benefitsText'] != ''){$element['benefits'] = $element['benefitsText'];}
        if(isset($element['deficiencyText']) && $element['deficiencyText'] != ''){$element['deficiency'] = $element['deficiencyText'];}

        $element['added_by'] = Auth::user()->id;
        $element['create_dte'] = time();
        $element['last_update'] = time();

        Element::create($element);
        \Session::flash('flash_message', 'Successfully created an Element!');
        //will need  a proper response here
        //return response()->json($element);
        return redirect('admin/element/create');
    }

    public function updateForm($id){
        $element = Element::find($id);

        return view('pages.elements-update', compact('element'));
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
        $element = Element::find($id);
        $element->delete();

        \Session::flash('flash_message', 'Successfully removed Element!');
        return redirect('admin/element/list');
    }
}
