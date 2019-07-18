@extends('layouts.app')
@section('content')
    <section id="main">
        <div class="container">
            <div class="block-header">
                <h2>Update Sufficiency</h2>
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
                <form name="create_product" method="post" action="{{url('admin/product/save')}}" enctype="multipart/form-data">
                    {!! csrf_field() !!}
                    <div class="card-body card-padding">

                        <div class="row" style="margin-top: 20px;">
                            <div class="col-sm-3">
                                <div class="fileinput fileinput-new" data-provides="fileinput" style="margin:0px auto 25px auto;">
                                    <div class="fileinput-preview thumbnail" data-trigger="fileinput"></div>
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
                                        <div class="form-group fg-float m-b-30 fg-toggled"
                                             ng-class="{ 'has-error' : (create_product.productName.$invalid && !create_product.productName.$pristine) || create_product.productName.$touched && create_product.productName.$invalid}">
                                            <div class="fg-line">
                                                <input type="text" name="productName" ng-model="productName"
                                                       class="form-control fg-input"
                                                       ng-minlength="3" ng-maxlength="25">
                                                <label class="fg-label">Product Name</label>
                                            </div>
                                            <div ng-messages="create_product.productName.$error" ng-show="create_product.productName.$dirty">
                                                <small class="help-block" ng-message="minlength">This too short</small>
                                                <small class="help-block" ng-message="maxlength">Sorry we can only take 30 characters</small>
                                                <small class="help-block" ng-message="required">This field is required</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group fg-float m-b-30 fg-toggled"
                                             ng-class="{ 'has-error' : (create_product.subTitle.$invalid && !create_product.subTitle.$pristine) || create_product.subTitle.$touched && create_product.subTitle.$invalid}">
                                            <div class="fg-line">
                                                <input type="text" name="subTitle" ng-model="subTitle"
                                                       class="form-control fg-input"
                                                       ng-minlength="3" ng-maxlength="25">
                                                <label class="fg-label">Sub Title</label>
                                            </div>
                                            <div ng-messages="create_product.subTitle.$error" ng-show="create_product.subTitle.$dirty">
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
                                        <div class="form-group m-b-30" ng-class="{ 'has-error' : (create_product.description.$invalid && !create_product.description.$pristine) || create_product.description.$touched && create_product.description.$invalid}">
                                            <div class="fg-line">
                                                <textarea class="form-control" rows="5" name="description" ng-model="description" placeholder="Product description text here" data-auto-size></textarea>
                                            </div>
                                            <div ng-messages="create_product.description.$error" ng-show="create_product.description.compText.$dirty">
                                                <small class="help-block" ng-message="maxlength">Try and keep it less than 1,000 characters</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ADD PRODUCT BENEFITS -->
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group m-b-30" ng-class="{ 'has-error' : (create_product.benefits.$invalid && !create_product.benefits.$pristine) || create_product.benefits.$touched && create_product.benefits.$invalid}">
                                            <div class="fg-line">
                                                <textarea class="form-control" rows="5" name="benefits" ng-model="benefits" placeholder="Product benefits exa: <li>benefit one</li>" data-auto-size></textarea>
                                            </div>
                                            <div ng-messages="create_product.benefits.$error" ng-show="create_product.benefits.compText.$dirty">
                                                <small class="help-block" ng-message="maxlength">Try and keep it less than 1,000 characters</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- DILUTION -->
                                <div class="row">
                                    <div class="col-sm-12">
                                        <!-- <p class="c-black f-500 m-t-20 m-b-20">title</p>-->
                                        <div class="form-group m-b-30" ng-class="{ 'has-error' : (create_product.dilution.$invalid && !create_product.dilution.$pristine) || create_product.dilution.$touched && create_product.dilution.$invalid}">
                                            <div class="fg-line">
                                                <textarea class="form-control" rows="5" name="dilution" ng-model="dilution" placeholder="Dilution Text here" data-auto-size></textarea>
                                            </div>
                                            <div ng-messages="create_product.dilution.$error" ng-show="create_product.dilution.$dirty">
                                                <small class="help-block" ng-message="maxlength">Try and keep it less than 1,000 characters</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- PRODUCT COMPATIBILITY -->
                                <div class="row" style="margin-bottom:10px;">
                                    <div class="col-md-6">
                                        <div class=" form-group">
                                            <!-- <label for="compatibility">Compatibility</label>-->
                                            <select chosen
                                                    ng-model="compatibilityType"
                                                    name="compatibilityType"
                                                    data-placeholder="Compatibility Statement..." class="w-100" ng-options="item.id as item.name for item in compatSelect">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group fg-float m-b-30 fg-toggled"
                                             ng-class="{ 'has-error' : (create_product.netContents.$invalid && !create_product.netContents.$pristine) || create_product.netContents.$touched && create_product.netContents.$invalid}">
                                            <div class="fg-line">
                                                <input type="text" name="netContents" ng-model="netContents"
                                                       class="form-control fg-input"
                                                       ng-minlength="3" ng-maxlength="45">
                                                <label class="fg-label">Net Contents</label>
                                            </div>
                                            <div ng-messages="create_product.subTitle.$error" ng-show="create_product.subTitle.$dirty">
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
                                            <select chosen
                                                    ng-model="element_0"
                                                    name="element_0"
                                                    data-placeholder="Select a Element..." class="w-100">
                                                @foreach($elements as $e)
                                                    <option value="{{$e->id}}">{{$e->element_name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_0"
                                                           name="percent_0"
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
                                    </fieldset>
                                </div>
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <select chosen
                                                    ng-model="element_1"
                                                    name="element_1"
                                                    data-placeholder="Select a Element..." class="w-100">
                                                @foreach($elements as $e)
                                                    <option value="{{$e->id}}">{{$e->element_name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_1"
                                                           name="percent_1"
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
                                    </fieldset>
                                </div>
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <select chosen
                                                    ng-model="element_2"
                                                    name="element_2"
                                                    data-placeholder="Select a Element..." class="w-100">
                                                @foreach($elements as $e)
                                                    <option value="{{$e->id}}">{{$e->element_name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_2"
                                                           name="percent_2"
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
                                    </fieldset>
                                </div>
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <select chosen
                                                    ng-model="element_3"
                                                    name="element_3"
                                                    data-placeholder="Select a Element..." class="w-100">
                                                @foreach($elements as $e)
                                                    <option value="{{$e->id}}">{{$e->element_name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_3"
                                                           name="percent_3"
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
                                    </fieldset>
                                </div>
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <select chosen
                                                    ng-model="element_4"
                                                    name="element_4"
                                                    data-placeholder="Select a Element..." class="w-100">
                                                @foreach($elements as $e)
                                                    <option value="{{$e->id}}">{{$e->element_name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_4"
                                                           name="percent_4"
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
                                    </fieldset>
                                </div>
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <select chosen
                                                    ng-model="element_5"
                                                    name="element_5"
                                                    data-placeholder="Select a Element..." class="w-100">
                                                @foreach($elements as $e)
                                                    <option value="{{$e->id}}">{{$e->element_name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_5"
                                                           name="percent_5"
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
                                    </fieldset>
                                </div>
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <select chosen
                                                    ng-model="element_6"
                                                    name="element_6"
                                                    data-placeholder="Select a Element..." class="w-100">
                                                @foreach($elements as $e)
                                                    <option value="{{$e->id}}">{{$e->element_name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_6"
                                                           name="percent_6"
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
                                    </fieldset>
                                </div>
                                <!-- END 6 -->
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <select chosen
                                                    ng-model="element_7"
                                                    name="element_7"
                                                    data-placeholder="Select a Element..." class="w-100">
                                                @foreach($elements as $e)
                                                    <option value="{{$e->id}}">{{$e->element_name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_7"
                                                           name="percent_7"
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
                                    </fieldset>
                                </div>
                                <!-- END  7 -->
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <select chosen
                                                    ng-model="element_8"
                                                    name="element_8"
                                                    data-placeholder="Select a Element..." class="w-100">
                                                @foreach($elements as $e)
                                                    <option value="{{$e->id}}">{{$e->element_name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_8"
                                                           name="percent_8"
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
                                    </fieldset>
                                </div>
                                <!-- END 8 -->
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <select chosen
                                                    ng-model="element_9"
                                                    name="element_9"
                                                    data-placeholder="Select a Element..." class="w-100">
                                                @foreach($elements as $e)
                                                    <option value="{{$e->id}}">{{$e->element_name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_9"
                                                           name="percent_9"
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
                                    </fieldset>
                                </div>
                                <!-- END 9 -->
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <select chosen
                                                    ng-model="element_10"
                                                    name="element_10"
                                                    data-placeholder="Select a Element..." class="w-100">
                                                @foreach($elements as $e)
                                                    <option value="{{$e->id}}">{{$e->element_name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_10"
                                                           name="percent_10"
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
                                    </fieldset>
                                </div>
                                <!-- END 10 -->
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <select chosen
                                                    ng-model="element_11"
                                                    name="element_11"
                                                    data-placeholder="Select a Element..." class="w-100">
                                                @foreach($elements as $e)
                                                    <option value="{{$e->id}}">{{$e->element_name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_11"
                                                           name="percent_11"
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
                                    </fieldset>
                                </div>
                                <!-- END 11 -->
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <select chosen
                                                    ng-model="element_12"
                                                    name="element_12"
                                                    data-placeholder="Select a Element..." class="w-100">
                                                @foreach($elements as $e)
                                                    <option value="{{$e->id}}">{{$e->element_name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_12"
                                                           name="percent_12"
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
                                    </fieldset>
                                </div>
                                <!-- END 12 -->
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <select chosen
                                                    ng-model="element_13"
                                                    name="element_13"
                                                    data-placeholder="Select a Element..." class="w-100">
                                                @foreach($elements as $e)
                                                    <option value="{{$e->id}}">{{$e->element_name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_13"
                                                           name="percent_13"
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
                                    </fieldset>
                                </div>
                                <!-- END 13 -->
                                <div class="row">
                                    <fieldset>
                                        <div class="col-sm-3 m-b-15">
                                            <select chosen
                                                    ng-model="element_14"
                                                    name="element_14"
                                                    data-placeholder="Select a Element..." class="w-100">
                                                @foreach($elements as $e)
                                                    <option value="{{$e->id}}">{{$e->element_name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-sm-5 m-b-15">
                                            <div class="form-group fg-float m-b-30 fg-toggled"
                                                 ng-class="{ 'has-error' : (create_product.percent.$invalid && !create_product.percent.$pristine) || create_product.percent.$touched && create_product.percent.$invalid}">
                                                <div class="fg-line">
                                                    <input type="text"
                                                           ng-model="percent_14"
                                                           name="percent_14"
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
                                    </fieldset>
                                </div>
                                <!-- END 14 -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <button type="submit" class="btn btn-primary btn-sm m-t-5">Add Product</button>
                            </div>
                        </div>
                    </div><!--end card body -->
                </form>
            </div>
        </div>
    </section>
@endsection