@extends('layouts.app')
@section('content')
    <section id="main">
        <div class="container" ng-init="productFetch('{{$product->id}}')">
            <div class="block-header">
                <h2>Add new Product</h2>
            </div>
            <!-- error messages -->
            @if (count($errors) > 0)
                <div class="alert alert-danger alert-dismissible">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
            <div class="card">
                <form name="update_product" method="post" action="{{url('admin/product/update'.'/'.$product->id)}}" enctype="multipart/form-data">
                    {!! csrf_field() !!}
                    <div class="card-body card-padding">

                        <div class="row" style="margin-top: 20px;">
                            <div class="col-sm-3">
                                <div class="fileinput fileinput-new" data-provides="fileinput" style="margin:0px auto 25px auto;">
                                    <div class="fileinput-preview thumbnail" data-trigger="fileinput"><img src="{{url('images/product/'.$product->image_url)}}" style="margin-top:1px;"/></div>
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
                                            <label class="fg-label" style="font-weight:bold;">Description</label>
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
                                            <label class="fg-label" style="font-weight:bold;">Benefits</label>
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
                                            <label class="fg-label" style="font-weight:bold;">Dilution</label>
                                            <div class="fg-line">
                                                <textarea class="form-control" rows="5" name="dilution" ng-model="dilution" placeholder="Dilution Text here" data-auto-size></textarea>
                                            </div>
                                            <div ng-messages="update_product.dilution.$error" ng-show="update_product.dilution.$dirty">
                                                <small class="help-block" ng-message="maxlength">Try and keep it less than 1,000 characters</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- PRODUCT COMPATIBILITY -->
                                <div class="row" style="margin-bottom:10px;">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Compatibility Statement</label>
                                            <select chosen
                                                    ng-model="compatibilityType"
                                                    name="compatibilityType"
                                                    id="compatibilityType"
                                                    data-placeholder="Select One..." class="w-100" ng-options="item.id as item.name for item in compatSelect">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group m-b-30 fg-toggled"
                                             ng-class="{ 'has-error' : (create_product.netContents.$invalid && !create_product.netContents.$pristine) || create_product.netContents.$touched && create_product.netContents.$invalid}">
                                            <div class="fg-line">
                                                <label class="fg-label">Net Contents</label>
                                                <input type="text" name="netContents" ng-model="netContents"
                                                       class="form-control fg-input"
                                                       ng-minlength="3" ng-maxlength="45">
                                            </div>
                                            <div ng-messages="create_product.subTitle.$error" ng-show="create_product.netContents.$dirty">
                                                <small class="help-block" ng-message="minlength">This too short</small>
                                                <small class="help-block" ng-message="maxlength">Sorry we can only take 45 characters</small>
                                                <small class="help-block" ng-message="required">This field is required</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- SELECT INCLUDED INGREDIENTS / PERCENTAGES -->
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <label style="margin-bottom:5px;">&nbsp;</label>
                                            <select chosen
                                                    ng-model="element_0"
                                                    name="element_0"
                                                    data-placeholder="Select a Element..." class="w-100" ng-options="item.id as item.name for item in elementSelect">

                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <label style="font-size:.9em; color:#808080;">Percent</label>
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_0"
                                                           name="percent_0"
                                                           class="form-control fg-input"
                                                           ng-minlength="1" ng-maxlength="25">
                                                </div>
                                                <div ng-messages="create_product.percent.$error" ng-show="create_product.percent.$dirty">
                                                    <small class="help-block" ng-message="minlength">This too short</small>
                                                    <small class="help-block" ng-message="maxlength">Sorry we can only take 30 characters</small>
                                                    <small class="help-block" ng-message="required">This field is required</small>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <label style="margin-bottom:5px;">&nbsp;</label>
                                            <select chosen
                                                    ng-model="element_1"
                                                    name="element_1"
                                                    data-placeholder="Select a Element..." class="w-100" ng-options="item.id as item.name for item in elementSelect">
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <label style="font-size:.9em; color:#808080;">Percent</label>
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_1"
                                                           name="percent_1"
                                                           class="form-control fg-input"
                                                           ng-minlength="1" ng-maxlength="25">
                                                </div>
                                                <div ng-messages="create_product.percent.$error" ng-show="create_product.percent.$dirty">
                                                    <small class="help-block" ng-message="minlength">This too short</small>
                                                    <small class="help-block" ng-message="maxlength">Sorry we can only take 30 characters</small>
                                                    <small class="help-block" ng-message="required">This field is required</small>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <label style="margin-bottom:5px;">&nbsp;</label>
                                            <select chosen
                                                    ng-model="element_2"
                                                    name="element_2"
                                                    data-placeholder="Select a Element..." class="w-100" ng-options="item.id as item.name for item in elementSelect">
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <label style="font-size:.9em; color:#808080;">Percent</label>
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_2"
                                                           name="percent_2"
                                                           class="form-control fg-input"
                                                           ng-minlength="1" ng-maxlength="25">
                                                </div>
                                                <div ng-messages="create_product.percent.$error" ng-show="create_product.percent.$dirty">
                                                    <small class="help-block" ng-message="minlength">This too short</small>
                                                    <small class="help-block" ng-message="maxlength">Sorry we can only take 30 characters</small>
                                                    <small class="help-block" ng-message="required">This field is required</small>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <label style="margin-bottom:5px;">&nbsp;</label>
                                            <select chosen
                                                    ng-model="element_3"
                                                    name="element_3"
                                                    data-placeholder="Select a Element..." class="w-100" ng-options="item.id as item.name for item in elementSelect">
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <div class="fg-line">
                                                    <label style="font-size:.9em; color:#808080;">Percent</label>
                                                    <input type="text"
                                                           ng-model="percent_3"
                                                           name="percent_3"
                                                           class="form-control fg-input"
                                                           ng-minlength="1" ng-maxlength="25">
                                                </div>
                                                <div ng-messages="create_product.percent.$error" ng-show="create_product.percent.$dirty">
                                                    <small class="help-block" ng-message="minlength">This too short</small>
                                                    <small class="help-block" ng-message="maxlength">Sorry we can only take 30 characters</small>
                                                    <small class="help-block" ng-message="required">This field is required</small>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <label style="margin-bottom:5px;">&nbsp;</label>
                                            <select chosen
                                                    ng-model="element_4"
                                                    name="element_4"
                                                    data-placeholder="Select a Element..." class="w-100" ng-options="item.id as item.name for item in elementSelect">
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <label style="font-size:.9em; color:#808080;">Percent</label>
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_4"
                                                           name="percent_4"
                                                           class="form-control fg-input"
                                                           ng-minlength="1" ng-maxlength="25">
                                                </div>
                                                <div ng-messages="create_product.percent.$error" ng-show="create_product.percent.$dirty">
                                                    <small class="help-block" ng-message="minlength">This too short</small>
                                                    <small class="help-block" ng-message="maxlength">Sorry we can only take 30 characters</small>
                                                    <small class="help-block" ng-message="required">This field is required</small>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <label style="margin-bottom:5px;">&nbsp;</label>
                                            <select chosen
                                                    ng-model="element_5"
                                                    name="element_5"
                                                    data-placeholder="Select a Element..." class="w-100" ng-options="item.id as item.name for item in elementSelect">
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <label style="font-size:.9em; color:#808080;">Percent</label>
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_5"
                                                           name="percent_5"
                                                           class="form-control fg-input"
                                                           ng-minlength="1" ng-maxlength="25">
                                                </div>
                                                <div ng-messages="create_product.percent.$error" ng-show="create_product.percent.$dirty">
                                                    <small class="help-block" ng-message="minlength">This too short</small>
                                                    <small class="help-block" ng-message="maxlength">Sorry we can only take 30 characters</small>
                                                    <small class="help-block" ng-message="required">This field is required</small>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <label style="margin-bottom:5px;">&nbsp;</label>
                                            <select chosen
                                                    ng-model="element_6"
                                                    name="element_6"
                                                    data-placeholder="Select a Element..." class="w-100" ng-options="item.id as item.name for item in elementSelect">
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <label style="font-size:.9em; color:#808080;">Percent</label>
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_6"
                                                           name="percent_6"
                                                           class="form-control fg-input"
                                                           ng-minlength="1" ng-maxlength="25">
                                                </div>
                                                <div ng-messages="create_product.percent.$error" ng-show="create_product.percent.$dirty">
                                                    <small class="help-block" ng-message="minlength">This too short</small>
                                                    <small class="help-block" ng-message="maxlength">Sorry we can only take 30 characters</small>
                                                    <small class="help-block" ng-message="required">This field is required</small>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!-- END 6 -->
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <label style="margin-bottom:5px;">&nbsp;</label>
                                            <select chosen
                                                    ng-model="element_7"
                                                    name="element_7"
                                                    data-placeholder="Select a Element..." class="w-100" ng-options="item.id as item.name for item in elementSelect">
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <label style="font-size:.9em; color:#808080;">Percent</label>
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_7"
                                                           name="percent_7"
                                                           class="form-control fg-input"
                                                           ng-minlength="1" ng-maxlength="25">
                                                </div>
                                                <div ng-messages="create_product.percent.$error" ng-show="create_product.percent.$dirty">
                                                    <small class="help-block" ng-message="minlength">This too short</small>
                                                    <small class="help-block" ng-message="maxlength">Sorry we can only take 30 characters</small>
                                                    <small class="help-block" ng-message="required">This field is required</small>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!-- END  7 -->
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <label style="margin-bottom:5px;">&nbsp;</label>
                                            <select chosen
                                                    ng-model="element_8"
                                                    name="element_8"
                                                    data-placeholder="Select a Element..." class="w-100" ng-options="item.id as item.name for item in elementSelect">
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <label style="font-size:.9em; color:#808080;">Percent</label>
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_8"
                                                           name="percent_8"
                                                           class="form-control fg-input"
                                                           ng-minlength="1" ng-maxlength="25">
                                                </div>
                                                <div ng-messages="create_product.percent.$error" ng-show="create_product.percent.$dirty">
                                                    <small class="help-block" ng-message="minlength">This too short</small>
                                                    <small class="help-block" ng-message="maxlength">Sorry we can only take 30 characters</small>
                                                    <small class="help-block" ng-message="required">This field is required</small>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!-- END 8 -->
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <label style="margin-bottom:5px;">&nbsp;</label>
                                            <select chosen
                                                    ng-model="element_9"
                                                    name="element_9"
                                                    data-placeholder="Select a Element..." class="w-100" ng-options="item.id as item.name for item in elementSelect">
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <label style="font-size:.9em; color:#808080;">Percent</label>
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_9"
                                                           name="percent_9"
                                                           class="form-control fg-input"
                                                           ng-minlength="1" ng-maxlength="25">
                                                </div>
                                                <div ng-messages="create_product.percent.$error" ng-show="create_product.percent.$dirty">
                                                    <small class="help-block" ng-message="minlength">This too short</small>
                                                    <small class="help-block" ng-message="maxlength">Sorry we can only take 30 characters</small>
                                                    <small class="help-block" ng-message="required">This field is required</small>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!-- END 9 -->
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <label style="margin-bottom:5px;">&nbsp;</label>
                                            <select chosen
                                                    ng-model="element_10"
                                                    name="element_10"
                                                    data-placeholder="Select a Element..." class="w-100" ng-options="item.id as item.name for item in elementSelect">
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <label style="font-size:.9em; color:#808080;">Percent</label>
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_10"
                                                           name="percent_10"
                                                           class="form-control fg-input"
                                                           ng-minlength="1" ng-maxlength="25">
                                                </div>
                                                <div ng-messages="create_product.percent.$error" ng-show="create_product.percent.$dirty">
                                                    <small class="help-block" ng-message="minlength">This too short</small>
                                                    <small class="help-block" ng-message="maxlength">Sorry we can only take 30 characters</small>
                                                    <small class="help-block" ng-message="required">This field is required</small>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!-- END 10 -->
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <label style="margin-bottom:5px;">&nbsp;</label>
                                            <select chosen
                                                    ng-model="element_11"
                                                    name="element_11"
                                                    data-placeholder="Select a Element..." class="w-100" ng-options="item.id as item.name for item in elementSelect">
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <label style="font-size:.9em; color:#808080;">Percent</label>
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_11"
                                                           name="percent_11"
                                                           class="form-control fg-input"
                                                           ng-minlength="1" ng-maxlength="25">
                                                </div>
                                                <div ng-messages="create_product.percent.$error" ng-show="create_product.percent.$dirty">
                                                    <small class="help-block" ng-message="minlength">This too short</small>
                                                    <small class="help-block" ng-message="maxlength">Sorry we can only take 30 characters</small>
                                                    <small class="help-block" ng-message="required">This field is required</small>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!-- END 11 -->
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <label style="margin-bottom:5px;">&nbsp;</label>
                                            <select chosen
                                                    ng-model="element_12"
                                                    name="element_12"
                                                    data-placeholder="Select a Element..." class="w-100" ng-options="item.id as item.name for item in elementSelect">
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <label style="font-size:.9em; color:#808080;">Percent</label>
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_12"
                                                           name="percent_12"
                                                           class="form-control fg-input"
                                                           ng-minlength="1" ng-maxlength="25">
                                                </div>
                                                <div ng-messages="create_product.percent.$error" ng-show="create_product.percent.$dirty">
                                                    <small class="help-block" ng-message="minlength">This too short</small>
                                                    <small class="help-block" ng-message="maxlength">Sorry we can only take 30 characters</small>
                                                    <small class="help-block" ng-message="required">This field is required</small>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!-- END 12 -->
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <label style="margin-bottom:5px;">&nbsp;</label>
                                            <select chosen
                                                    ng-model="element_13"
                                                    name="element_13"
                                                    data-placeholder="Select a Element..." class="w-100" ng-options="item.id as item.name for item in elementSelect">
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <label style="font-size:.9em; color:#808080;">Percent</label>
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_13"
                                                           name="percent_13"
                                                           class="form-control fg-input"
                                                           ng-minlength="1" ng-maxlength="25">
                                                </div>
                                                <div ng-messages="create_product.percent.$error" ng-show="create_product.percent.$dirty">
                                                    <small class="help-block" ng-message="minlength">This too short</small>
                                                    <small class="help-block" ng-message="maxlength">Sorry we can only take 30 characters</small>
                                                    <small class="help-block" ng-message="required">This field is required</small>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!-- END 13 -->
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <label style="margin-bottom:5px;">&nbsp;</label>
                                            <select chosen
                                                    ng-model="element_14"
                                                    name="element_14"
                                                    data-placeholder="Select a Element..." class="w-100" ng-options="item.id as item.name for item in elementSelect">
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <label style="font-size:.9em; color:#808080;">Percent</label>
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_14"
                                                           name="percent_14"
                                                           class="form-control fg-input"
                                                           ng-minlength="1" ng-maxlength="25">
                                                </div>
                                                <div ng-messages="create_product.percent.$error" ng-show="create_product.percent.$dirty">
                                                    <small class="help-block" ng-message="minlength">This too short</small>
                                                    <small class="help-block" ng-message="maxlength">Sorry we can only take 30 characters</small>
                                                    <small class="help-block" ng-message="required">This field is required</small>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!-- END 14 -->
                               <!-- <a class="btn btn-primary btn-sm m-t-5" id="element_btn" ng-click="addNewElement()">Add New Element</a>-->
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