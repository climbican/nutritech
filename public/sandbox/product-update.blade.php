@extends('layouts.app')
@section('content')
    <section id="main">
        <div class="container" ng-init="fetchAddElement('{{$product->id}}')">
            <div class="block-header">
                <h2>Add new Product</h2>
            </div>
            <div class="card">
                <form name="update_product" method="post" action="{{url('admin/product/update'.'/'.$product->id)}}" enctype="multipart/form-data">
                    {!! csrf_field() !!}
                    <div class="card-body card-padding">

                        <div class="row" style="margin-top: 20px;">
                            <div class="col-sm-3">
                                <div class="fileinput fileinput-new" data-provides="fileinput" style="margin:0px auto 25px auto;">
                                    <div class="fileinput-preview thumbnail" data-trigger="fileinput"><img src="{{url('images/product/'.$product->image_url)}}"/></div>
                                    <div>
                                <span class="btn btn-info btn-file">
                                    <span class="fileinput-new">Product label / Logo</span>
                                    <span class="fileinput-exists">Change</span>
                                    <input type="file" name="productImage" ng-model="productImage" id="productImage">
                                </span>
                                        <a href="#" class="btn btn-danger fileinput-exists" data-dismiss="fileinput">Remove</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group m-b-30 fg-toggled"
                                             ng-class="{ 'has-error' : (update_product.productName.$invalid && !update_product.productName.$pristine) || update_product.productName.$touched && update_product.productName.$invalid}">
                                            <div class="fg-line">
                                                <label class="fg-label">Product Name</label>
                                                <input type="text" name="productName" ng-model="productName" id="productName"
                                                       class="form-control fg-input"
                                                       ng-minlength="3" ng-maxlength="25">
                                            </div>
                                            <div ng-messages="update_product.productName.$error" ng-show="update_product.productName.$dirty">
                                                <small class="help-block" ng-message="minlength">This too short</small>
                                                <small class="help-block" ng-message="maxlength">Sorry we can only take 30 characters</small>
                                                <small class="help-block" ng-message="required">This field is required</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group m-b-30 fg-toggled"
                                             ng-class="{ 'has-error' : (update_product.subTitle.$invalid && !update_product.subTitle.$pristine) || update_product.subTitle.$touched && update_product.subTitle.$invalid}">
                                            <div class="fg-line">
                                                <label class="fg-label">Sub Title</label>
                                                <input type="text" name="subTitle" ng-model="subTitle"
                                                       class="form-control fg-input"
                                                       ng-minlength="3" ng-maxlength="25">
                                            </div>
                                            <div ng-messages="update_product.subTitle.$error" ng-show="update_product.subTitle.$dirty">
                                                <small class="help-block" ng-message="minlength">This too short</small>
                                                <small class="help-block" ng-message="maxlength">Sorry we can only take 30 characters</small>
                                                <small class="help-block" ng-message="required">This field is required</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ADD PRODUCT DESCRIPTION -->
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group m-b-30" ng-class="{ 'has-error' : (update_product.description.$invalid && !update_product.description.$pristine) || update_product.description.$touched && update_product.description.$invalid}">
                                            <div class="fg-line">
                                                <textarea class="form-control" rows="5" name="description" ng-model="description" placeholder="Product description text here" data-auto-size ng-init="description='{{$product->description}}'"></textarea>
                                            </div>
                                            <div ng-messages="update_product.description.$error" ng-show="update_product.description.$dirty">
                                                <small class="help-block" ng-message="maxlength">Try and keep it less than 1,000 characters</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ADD PRODUCT BENEFITS -->
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group m-b-30" ng-class="{ 'has-error' : (update_product.benefits.$invalid && !update_product.benefits.$pristine) || update_product.benefits.$touched && update_product.benefits.$invalid}">
                                            <div class="fg-line">
                                                <textarea class="form-control" rows="5" name="benefits" ng-model="benefits" placeholder="Product benefits exa: <li>benefit one</li>" data-auto-size></textarea>
                                            </div>
                                            <div ng-messages="update_product.benefits.$error" ng-show="update_product.benefits.$dirty">
                                                <small class="help-block" ng-message="maxlength">Try and keep it less than 1,000 characters</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- DILUTION -->
                                <div class="row">
                                    <div class="col-sm-12">
                                        <!-- <p class="c-black f-500 m-t-20 m-b-20">title</p>-->
                                        <div class="form-group m-b-30" ng-class="{ 'has-error' : (update_product.dilution.$invalid && !update_product.dilution.$pristine) || update_product.dilution.$touched && update_product.dilution.$invalid}">
                                            <div class="fg-line">
                                                <textarea class="form-control" rows="5" name="dilution" ng-model="dilution" placeholder="Dilution Text here" data-auto-size></textarea>
                                            </div>
                                            <div ng-messages="update_product.dilution.$error" ng-show="update_product.dilution.$dirty">
                                                <small class="help-block" ng-message="maxlength">Try and keep it less than 1,000 characters</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" data-ng-repeat="ae in addElementSet">
                                    <fieldset>
                                        <div>value::-: <% newElementVals[$index][ae[0].name] %></div>
                                        <div class="col-sm-3 m-b-15">
                                            <select
                                                    ng-model="newElementVals[ae[0].name]"
                                                    name="<% ae[0].name %>"
                                                    data-placeholder="Select a Element..." class="w-100">
                                                <option ng-repeat="i in elementSelect" value="<%i.id%>"><%i.name%></option>
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="newElementVals[ae[1].name]"
                                                           name="<%ae[1].name%>"
                                                           class="form-control fg-input"
                                                           ng-minlength="1" ng-maxlength="25">
                                                    <label class="fg-label">Percent</label>
                                                </div>
                                                <div ng-messages="create_product.percent.$error" ng-show="create_product.percent.$dirty">
                                                    <small class="help-block" ng-message="minlength">This too short</small>
                                                    <small class="help-block" ng-message="maxlength">Sorry we can only take 30 characters</small>
                                                    <small class="help-block" ng-message="required">This field is required</small>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <a class="btn btn-primary btn-sm m-t-5" ng-show="$last"  ng-click="removeElement()">Remove</a>
                                        </div>
                                    </fieldset>
                                </div>

                       <a class="btn btn-primary btn-sm m-t-5" id="element_btn" ng-click="addNewElement()">Add New Element</a>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-4">
                        <button type="submit" class="btn btn-primary btn-sm m-t-5">Update Product</button>
                    </div>
                </div>
            </div><!--end card body -->
                </form>
            </div>
        </div>
    </section>
@endsection