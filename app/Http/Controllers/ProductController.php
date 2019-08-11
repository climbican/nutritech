<?php

namespace App\Http\Controllers;

use App\ProductElement;
use Illuminate\Http\Request;
use App\Product;
use App\Crop;
use App\Element;
use App\Compatibility;
use DB;
use Auth;
use Illuminate\Support\Facades\Session;
use File;

class ProductController extends Controller{

    public function __construct(){
    	// TODO: MOVE THIS TO THE ROUTES PAGE SO THAT THE CONTROLLER CAN BE USED BY THE API ROUTES
        $this->middleware('auth');
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(){
        $products = Product::orderBy('create_dte', 'desc')->paginate(10);
        $numRows = Product::count();

        foreach ($products as $product) {
            if(!file_exists(public_path('images/product/'.$product->image_url)) || $product->image_url === ''){
                $product->image_url = 'no-image.png';
            }
            $result[] = ['id' => $product->id, 'productName' => $product->name, 'subType' => $product->sub_type, 'imageUrl' => $product->image_url,
                'createDte' => $product->create_dte, 'lastUpdate' => $product->last_update];
        }

        return view('pages.product-list', compact('products', 'numRows'));
    }
	public function fetch_all_prod_page() {

		$items  = Product::all();
		$fields = array();
		$patterns = array();
		$patterns[0] = '/\r/';
		$patterns[1] = '/\n/';

		foreach($items as $item) {
			$prod = []; //p.product_id,
			$pe = DB::select('SELECT e.element_name, p.element_id, p.percent, p.is_guaranteed_amt
            FROM product_element p 
            INNER JOIN element e 
            ON p.element_id = e.id
            WHERE p.product_id = ?', [$item->id]);

			$prod['id'] = $item->id;
			$prod['productName'] = $item->product_name;
			$prod['imageUrl'] = $item->image_url;
			$prod['subTitle'] = $item->product_subname;
			$prod['description'] = preg_replace($patterns, '', $item->description);
			$prod['dilution'] = preg_replace($patterns, '', $item->dilution);
			$prod['benefits'] = preg_replace($patterns, '', $item->benefits);
			$prod['compatibility'] = $item->compatibility;
			$prod['netContents'] = $item->net_contents;
			$prod['elements'] = $pe;

			array_push($fields, $prod);
		} //end foreach

		$fields = stripslashes(json_encode($fields, JSON_NUMERIC_CHECK));
		$fields = preg_replace('/"([a-zA-Z]+[a-zA-Z0-9_]*)":/','$1:',$fields);

		return view('pages.product_json', compact('fields'));
	}
	/**
	 * @desc I USED THIS TO EXPORT DATA TO THE APP.  Now it will be used for the API as well.
	 * @return false|string
	 */
    public function fetchList(){
        $items  = Product::all();
        $fields = array();
	    $patterns = array();
	    $patterns[0] = '/\r/';
	    $patterns[1] = '/\n/';

        foreach($items as $item) {
            $prod = []; //p.product_id,
            $pe = DB::select('SELECT e.element_name, p.element_id, p.percent, p.is_guaranteed_amt
            FROM product_element p 
            INNER JOIN element e 
            ON p.element_id = e.id
            WHERE p.product_id = ?', [$item->id]);

            $prod['id'] = $item->id;
            $prod['productName'] = $item->product_name;
            $prod['imageUrl'] = $item->image_url;
            $prod['subTitle'] = $item->product_subname;
            $prod['description'] = preg_replace($patterns, '', $item->description);
            $prod['dilution'] = preg_replace($patterns, '', $item->dilution);
            $prod['benefits'] = preg_replace($patterns, '', $item->benefits);
            $prod['compatibility'] = $item->compatibility;
            $prod['netContents'] = $item->net_contents;
            $prod['elements'] = $pe;

            $fields[$item->id] = $prod;
        } //end foreach

	    echo  stripslashes(json_encode($fields)); exit();


        return json_encode(['status'=>200, 'message'=>'Your list of Products', 'list'=>$fields]);
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function create(){
        $crops = Crop::all();
        $compat = Compatibility::all();
        $elements = Element::all();

        return view('pages.product-create', compact('crops', 'compat', 'elements'));
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function save(Request $request){
        $nowTime = time();
        $this->validate($request, ['productName' => 'max:35|unique:product,product_name|required',
            'subTitle' => 'max:25',
            'description' => 'required']);

        $validated = $request->all();


        $product = new Product();

        $product->product_group = '';
        $product->product_name = '';
        $product->product_subname = '';
        $product->description = '';
        $product->dilution = '';
        $product->benefits = '';
        $product->image_url = '';
        $product->compatibility = '';
        $product->net_contents = '';

        if($request->hasFile('productImage')){
            $imageTmpName = explode('.', $request->file('productImage')->getClientOriginalName());
            $imageName = sha1(preg_replace("/[^ \w]+/", '',time().$imageTmpName[0] ) );
            //Image::make($image->getRealPath())->resize(200, 200)->save($path);

            $product->image_url = substr($imageName, 0,40).'.'.$imageTmpName[1];
            $request->file('productImage')->move(base_path() . '/public/images/product/', $product->image_url);
        }
        //$product['product_group'] = $validated['productGroup'];
        $product->product_name = $validated['productName'];
        if(isset($validated['subTitle']) && $validated['subTitle'] != '' ){ $product->product_subname = $validated['subTitle']; }
        if(isset($validated['description']) && $validated['description'] != ''){ $product->description = $validated['description']; }
        if(isset($validated['dilution']) && $validated['dilution'] != ''){ $product->dilution = $validated['dilution']; }
        if(isset($validated['benefits']) && $validated['benefits'] != ''){ $product->benefits = $validated['benefits']; }
        if(isset($validated['compatibilityType']) && $validated['compatibilityType'] != ''){ $product->compatibility = $product->compatibility = str_replace('number:',"",$validated['compatibilityType']);}
        if(isset($validated['netContents']) && $validated['netContents'] !== ''){$product->net_contents = $validated['netContents'];}
        //TRACKING
        $product->added_by = Auth::user()->id;
        $product->last_update_by = Auth::user()->id;
        $product->create_dte = $nowTime;
        $product->last_update = $nowTime;
        $product->removed_dte = $nowTime;

        $product->save();

        $product_id = $product->id;
        $i = 0;

        while(isset($validated['percent_'.$i]) && $validated['percent_'.$i] !==''){
            $pe = new ProductElement();
            $pe->product_id = $product_id;
            $pe->element_id = $validated['element_'.$i];
            $pe->percent = $validated['percent_'.$i];
            $pe->create_dte = $nowTime;
            $pe->last_update = $nowTime;
            $pe->save();
            $i++;
        }

        Session::flash('flash_message', 'Successfully created a new Product!');

        return redirect('admin/product/create');
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function update(Request $request, $id){ //echo 'what the shit'; exit();
        $nowTime = time();
        $product = Product::find($id);

        $this->validate($request, ['productName' => 'max:35|required',
            'subTitle' => 'max:25',
            'description' => 'required']);

        $validated = $request->all();

        if($request->hasFile('productImage') && $validated['productImage'] !== ''){
            //remove the old file first
            File::delete(base_path().'/public/images/product/'.$product->image_url);

            $imageTmpName = explode('.', $request->file('productImage')->getClientOriginalName());
            $imageName = sha1(preg_replace("/[^ \w]+/", '',time().$imageTmpName[0] ) );
            //Image::make($image->getRealPath())->resize(200, 200)->save($path);

            $product->image_url = substr($imageName, 0,40).'.'.$imageTmpName[1];
            $request->file('productImage')->move(base_path() . '/public/images/product/', $product->image_url);
        }
        //$product['product_group'] = $validated['productGroup'];
        $product->product_name = $validated['productName'];
        $product->product_subname = '';
        $product->description = '';
        $product->dilution = '';
        $product->benefits = '';
        $product->compatibility = '';
        $product->net_contents = '';
        if(isset($validated['subTitle']) && $validated['subTitle'] != '' ){ $product->product_subname = $validated['subTitle']; }
        if(isset($validated['description']) && $validated['description'] != ''){ $product->description = $validated['description']; }
        if(isset($validated['dilution']) && $validated['dilution'] != ''){ $product->dilution = $validated['dilution']; }
        if(isset($validated['benefits']) && $validated['benefits'] != ''){ $product->benefits = $validated['benefits']; }
        if(isset($validated['compatibilityType']) && $validated['compatibilityType'] != ''){ $product->compatibility = str_replace('number:',"",$validated['compatibilityType']);}
        if(isset($validated['netContents']) && $validated['netContents'] !== ''){$product->net_contents = $validated['netContents'];}
        //TRACKING

        $product->last_update = $nowTime;
        $product_id = $product->id;

        $product->save();

        $i = 0;

        DB::table('product_element')->where('product_id', '=', $product->id)->delete();

        while(isset($validated['percent_'.$i]) && $validated['percent_'.$i] !==''){
            $validated['percent_'.$i] = (float)$validated['percent_'.$i];
            if($validated['percent_'.$i] > 0.001 ) {
                $validated['element_'.$i] = str_replace('number:',"",$validated['element_'.$i]);
                $pe = new ProductElement();
                $pe->product_id = $product_id;
                $pe->element_id = $validated['element_'.$i];
                $pe->percent = $validated['percent_'.$i];
                $pe->create_dte = $nowTime;
                $pe->last_update = $nowTime;
                $pe->save();
            }
            $i++;
        }
        Session::flash('flash_message', 'Product Successfully updated!');

        return redirect('admin/product/list');
    }

    /**
     *
     * !!!!NOTE: !!! NEED TO RENAME THIS HAS BECOME MISSLEADING
     * @param $id int
     * @return JSON string to client
     */
    public function fetchProductElements($id){
        $pe = DB::table('product_element')->where('product_id', '=', $id)->get();
        $i = 0;
        $fields = array();
        $fieldValues = array();

        //array('element_name'=>array('name'=>'element_'.$i), 'percent_'.$i=>$p->percent)

        foreach ( $pe as $p){
            /**array_push($fields, array($i+1=>[array('name'=>'element_'.$i, 'title'=>'Element', 'type'=>array('view'=>'select', 'options'=>'') ),
                                array('name'=>'percent_'.$i, 'title'=>'Percent','type'=>array('view'=>'input')) ])  );**/
            array_push($fields, array('element_'.$i=>$p->element_id,  'percent_'.$i=> $p->percent));

            $i++;
        }

        $t = Product::find($id);

        $prod['productName'] = $t->product_name;
        $prod['subTitle'] = $t->product_subname;
        $prod['description'] = $t->description;
        $prod['dilution'] = $t->dilution;
        $prod['benefits'] = $t->benefits;
        $prod['compatibility'] = $t->compatibility;
        $prod['netContents'] = $t->net_contents;

        $returnArray = ['elements'=>$fields, 'productDetail'=>$prod];

        return json_encode($returnArray);
    }

    /**
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function updateForm($id){
        $product = Product::find($id);
        $elements = Element::all();
        $compat = Compatibility::all();

        if(!file_exists(public_path('images/product/'.$product->image_url)) || $product->image_url === ''){
            $product->image_url = 'no-image.png';
        }
        return view('pages.product-update', compact('product', 'elements', 'compat'));
    }

    /**
     * @param $id
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function delete($id){
        $product = Product::find($id);

        if($product->image_url != ''){
            if(file_exists(public_path('images/product/'.$product->image_url)) ){
                File::delete(base_path().'/public/images/product/'.$product->image_url);
            }
        }
        $product->delete();
        return redirect('admin/product/list');
    }
}
