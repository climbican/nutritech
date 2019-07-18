<?php

namespace App\Http\Controllers;

use App\ProductElement;
use Illuminate\Http\Request;
use App\Product;
use App\Crop;
use App\Element;
use DB;
use App\Compatibility;
use Auth;
use Illuminate\Support\Facades\Session;
use File;

class ProductController extends Controller{

    public function __construct(){
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

    /**
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function get($id){
        $product = Product::find($id);
        //return response()->json($product);
        return view('pages.product-list', compact('product'));
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function create(){
        $crops = Crop::all();
        $compatibility = Compatibility::all();
        $elements = Element::all();

        return view('pages.product-create', compact('crops', 'compatibility', 'elements'));
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

        if($request->hasFile('productImage')){
            $imageName = str_replace(' ', '',$validated['productName']) . time().'.' .
                $request->file('productImage')->getClientOriginalExtension();

            //Image::make($image->getRealPath())->resize(200, 200)->save($path);
            $product->image_url = $imageName;
            $request->file('productImage')->move(
                base_path() . '/public/images/product/', $imageName
            );
        }
        //$product['product_group'] = $validated['productGroup'];
        $product->product_name = $validated['productName'];
        if(isset($validated['subTitle']) && $validated['subTitle'] != '' ){ $product->product_subname = $validated['subTitle']; }
        if(isset($validated['description']) && $validated['description'] != ''){ $product->description = $validated['description']; }
        if(isset($validated['dilution']) && $validated['dilution'] != ''){ $product->dilution = $validated['dilution']; }
        if(isset($validated['benefits']) && $validated['benefits'] != ''){ $product->benefits = $validated['benefits']; }
        //TRACKING
        $product->added_by = Auth::user()->id;
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
    public function update(Request $request, $id){ echo 'what the duck'; exit();
        $product = Product::find($id);

        $this->validate($request,[
            'lookupCode'=>'max:35',
            'quantityActual'=>'required|Integer']);

        $validated = $request->all();

        if($request->hasFile('productImage')){
            $imageName = str_replace_array(' ', '',$product['productName']) . time().'.' .
                $request->file('productImage')->getClientOriginalExtension();

            //Image::make($image->getRealPath())->resize(200, 200)->save($path);
            $product['image_url'] = $imageName;
            $request->file('productImage')->move(
                base_path() . '/public/images/product/', $imageName
            );
        }

        //difference here is that I am not doing validatiaon,, eeerr
        $product->bar_code = $request->input('bar_code');
        $product->actual = $request->input('quantityActual');
        $product->lookup_code = $request->input('lookupCode');
        $product->bin_location = $request->input('binLocation');
        $product->product_by = Auth::user()->id;
        $product->last_update = time().'000';

        $product->save();
        Session::flash('flash_message', 'Successfully updated Product!');

        return redirect('admin/product/list');
    }

    /**
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
            array_push($fields, array($i+1=>[array('name'=>'element_'.$i, 'title'=>'Element', 'type'=>array('view'=>'select', 'options'=>'') ),
                                array('name'=>'percent_'.$i, 'title'=>'Percent','type'=>array('view'=>'input')) ])  );

            $fieldValues['element_'.$i] = $p->element_id;
            $fieldValues['percent_'.$i] = $p->percent;
            $i++;
        }

        $t = Product::find($id);

        $prod['productName'] = $t->product_name;
        $prod['subTitle'] = $t->product_subname;
        $prod['description'] = $t->description;
        $prod['dilution'] = $t->dilution;
        $prod['benefits'] = $t->benefits;

        $returnArray = ['elements'=>$fields, 'elementValues'=>$fieldValues, 'productDetail'=>$prod];

        return json_encode($returnArray);
    }

    /**
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function updateForm($id){
        $product = Product::find($id);

        if(!file_exists(public_path('images/product/'.$product->image_url)) || $product->image_url === ''){
            $product->image_url = 'no-image.png';
        }
        return view('pages.product-update', compact('product'));
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
