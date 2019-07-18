@extends('layouts.app')
@section('content')
    <section id="main">
        <div class="container">
            <div class="block-header">
                <h2>Update Deficiency Correlation </h2>
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
            <div class="card" ng-init="fetchDeficiency('{{$def->id}}')">
                <form name="create_deficiency" method="post" action="{{url('admin/deficiency/update/'.$def->id)}}" enctype="multipart/form-data">
                    {!! csrf_field() !!}
                    <div class="card-body card-padding">
                        <!-- ASSOCIATED ELEMENT -->
                        <div class="row">
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-sm-5 m-b-15">
                                        <label style="margin-bottom:5px;">Associated Crop</label>
                                        <select chosen
                                                ng-model="cropID"
                                                name="cropID"
                                                data-placeholder="Select a Crop..." class="w-100" ng-options="item.id as item.name for item in cropSelect">
                                        </select>
                                    </div>
                                    <div class="col-sm-2">&nbsp;</div>
                                    <div class="col-sm-5 m-b-15">
                                        <label style="margin-bottom:5px;">Element Deficiency</label>
                                        <select chosen
                                                ng-model="elementID"
                                                name="elementID"
                                                data-placeholder="Select a Element..." class="w-100" ng-options="item.id as item.name for item in elementSelect">
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 20px;">
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group fg-toggled m-b-30"
                                             ng-class="{'has-error' : (create_deficiency.nameShort.$invalid && !create_deficiency.nameShort.$pristine) || create_deficiency.nameShort.$touched && create_deficiency.nameShort.$invalid}">
                                            <div class="fg-line">
                                                <label class="fg-label">Deficiency Name Short</label>
                                                <input type="text" name="nameShort" ng-model="nameShort"
                                                       class="form-control fg-input"
                                                       ng-minlength="3" ng-maxlength="45">
                                            </div>
                                            <div ng-messages="create_deficiency.nameShort.$error" ng-show="create_deficiency.nameShort.$dirty">
                                                <small class="help-block" ng-message="minlength">This too short</small>
                                                <small class="help-block" ng-message="maxlength">Sorry we can only take 45 characters</small>
                                                <small class="help-block" ng-message="required">This field is required</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ADD PRODUCT DESCRIPTION -->
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group m-b-30" ng-class="{ 'has-error' : (create_deficiency.defDescription.$invalid && !create_deficiency.defDescription.$pristine) || create_deficiency.defDescription.$touched && create_deficiency.defDescription.$invalid}">
                                            <div class="fg-line">
                                                <textarea class="form-control" rows="5" name="defDescription" ng-model="defDescription" placeholder="Deficiency description text here" data-auto-size></textarea>
                                            </div>
                                            <div ng-messages="create_deficiency.defDescription.$error" ng-show="create_deficiency.defDescription.$dirty">
                                                <small class="help-block" ng-message="maxlength">Try and keep it less than 1,000 characters</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <div class="fileinput fileinput-new" data-provides="fileinput" style="margin:0px auto 25px auto;">
                                    <div class="fileinput-preview thumbnail" data-trigger="fileinput" id="preview1"><img src="{{url($def->image_1)}}"/></div>
                                    <div>
                                        <span class="btn btn-info btn-file">
                                            <span class="fileinput-new">Image 1</span>
                                            <span class="fileinput-exists">Change</span>
                                            <input type="file" name="image1" ng-model="image1" id="image1">
                                        </span>
                                        <a href="#" class="btn btn-danger" ng-click="removeImage('1', '{{$def->id}}')" >Remove</a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="fileinput fileinput-new" data-provides="fileinput" style="margin:0px auto 25px auto;">
                                    <div class="fileinput-preview thumbnail" data-trigger="fileinput" id="preview2"><img src="{{url($def->image_2)}}"/></div>
                                    <div>
                                        <span class="btn btn-info btn-file">
                                            <span class="fileinput-new">Image 2</span>
                                            <span class="fileinput-exists">Change</span>
                                            <input type="file" name="image2" ng-model="image2" id="image2">
                                        </span>
                                        <a href="#" class="btn btn-danger" data-dismiss="fileinput"  ng-click="removeImage('2', '{{$def->id}}')" >Remove</a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="fileinput fileinput-new" data-provides="fileinput" style="margin:0px auto 25px auto;">
                                    <div class="fileinput-preview thumbnail" data-trigger="fileinput" id="preview3"><img src="{{url($def->image_3)}}"/></div>
                                    <div>
                                        <span class="btn btn-info btn-file">
                                            <span class="fileinput-new">Image 3</span>
                                            <span class="fileinput-exists">Change</span>
                                            <input type="file" name="image3" ng-model="image3" id="image3">
                                        </span>
                                        <a href="#" class="btn btn-danger " data-dismiss="fileinput" ng-click="removeImage('3', '{{$def->id}}')" >Remove</a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="fileinput fileinput-new" data-provides="fileinput" style="margin:0px auto 25px auto;">
                                    <div class="fileinput-preview thumbnail" data-trigger="fileinput" id="preview4"><img src="{{url($def->image_4)}}"/></div>
                                    <div>
                                        <span class="btn btn-info btn-file">
                                            <span class="fileinput-new">Image 4</span>
                                            <span class="fileinput-exists">Change</span>
                                            <input type="file" name="image4" ng-model="image4" id="image4">
                                        </span>
                                        <a href="#" class="btn btn-danger" data-dismiss="fileinput" ng-click="removeImage('4', '{{$def->id}}')" >Remove</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <button type="submit" class="btn btn-primary btn-sm m-t-5">Update Deficiency</button>
                            </div>
                        </div>
                    </div><!--end card body -->
                </form>
            </div>
        </div>
    </section>
@endsection