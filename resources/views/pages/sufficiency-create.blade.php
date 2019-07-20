@extends('layouts.app')
@section('content')
    <section id="main">
        <div class="container">
            <div class="block-header">
                <h2>Add new Sufficiency</h2>
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
                <form name="create_sufficiency" method="post" action="{{url('admin/sufficiency/save')}}">
                    {!! csrf_field() !!}
                    <div class="card-body card-padding">
                        <div class="row" style="margin-top:25px;">
                            <div class="col-md-12">
                                <h4>Crop & test params</h4>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 20px;">
                            <div class="col-md-4">
                                <fieldset>
                                    <div>
                                        <select chosen
                                                ng-model="cropId"
                                                name="cropId"
                                                value="0"
                                                data-placeholder="Select a Crop..." class="w-100">
                                            @foreach($crops as $e)
                                                <option value="{{$e->id}}">{{$e->name}} @if($e->sub_type !== ''){{ '/ ' . $e->sub_type}}@endif</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </fieldset>
                            </div>
                            <div class="col-md-4">
                                <fieldset>
                                    <div>
                                        <select chosen
                                                ng-model="growthStageId"
                                                name="growthStageId"
                                                value="0"
                                                data-placeholder="Select a Growth stage..." class="w-100">
                                            @foreach($growthstage as $gs)
                                                <option value="{{$gs->id}}">{{$gs->name_desc}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </fieldset>
                            </div>
                            <div class="col-md-4">
                                <fieldset>
                                    <div>
                                        <select chosen
                                                ng-model="sampleUnitId"
                                                name="sampleUnitId"
                                                data-placeholder="Select a Sample Unit..." class="w-100">
                                            @foreach($sample_unit as $s)
                                                <option value="{{$s->id}}">{{$s->name_desc}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                        <div class="row" style="margin-top:25px;">
                            <div class="col-md-4">&nbsp;</div>
                            <div class="col-md-4">
                                <div class="form-group fg-float m-b-30 fg-toggled"
                                     ng-class="{ 'has-error' : (create_sufficiency.newGrowthStageLabel.$invalid && !create_sufficiency.newGrowthStageLabel.$pristine) || create_sufficiency.newGrowthStageLabel.$touched && create_sufficiency.newGrowthStageLabel.$invalid}">
                                    <div class="fg-line">
                                        <input type="text" name="newGrowthStageLabel" ng-model="newGrowthStageLabel"
                                               class="form-control fg-input" value="{{old('newGrowthStageLabel')}}"
                                               ng-minlength="2" ng-maxlength="100">
                                        <label class="fg-label">NEW Growth Stage Label</label>
                                    </div>
                                    <div ng-messages="create_sufficiency.newGrowthStageLabel.$error" ng-show="create_sufficiency.newGrowthStageLabel.$dirty">
                                        <small class="help-block" ng-message="minlength">This too short</small>
                                        <small class="help-block" ng-message="maxlength">Sorry we can only take 15 characters</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group fg-float m-b-30 fg-toggled"
                                     ng-class="{ 'has-error' : (create_sufficiency.newSampleUnitLabel.$invalid && !create_sufficiency.newSampleUnitLabel.$pristine) || create_sufficiency.newSampleUnitLabel.$touched && create_sufficiency.newSampleUnitLabel.$invalid}">
                                    <div class="fg-line">
                                        <input type="text" name="newSampleUnitLabel" ng-model="newSampleUnitLabel"
                                               class="form-control fg-input" value="{{old('newSampleUnitLabel')}}"
                                               ng-minlength="2" ng-maxlength="255">
                                        <label class="fg-label">NEW Sample Unit Label</label>
                                    </div>
                                    <div ng-messages="create_sufficiency.newSampleUnitLabel.$error" ng-show="create_sufficiency.newSampleUnitLabel.$dirty">
                                        <small class="help-block" ng-message="minlength">This too short</small>
                                        <small class="help-block" ng-message="maxlength">Sorry we can only take 15 characters</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-top:25px;">
                            <div class="col-md-12">
                                <h4>Elements</h4>
                            </div>
                        </div>
                        <!-- ROW #1 N, NO3, P, PO4 -->
                        <div class="row" style="margin-top:25px;">
                            <div class="col-md-3">
                                <div class="form-group fg-float m-b-30 fg-toggled"
                                     ng-class="{ 'has-error' : (create_sufficiency.nPercent.$invalid && !create_sufficiency.nPercent.$pristine) || create_sufficiency.nPercent.$touched && create_sufficiency.nPercent.$invalid}">
                                    <div class="fg-line">
                                        <input type="text" name="nPercent" ng-model="nPercent"
                                               class="form-control fg-input" value="{{old('nPercent')}}"
                                               ng-minlength="2" ng-maxlength="15">
                                        <label class="fg-label">N %</label>
                                    </div>
                                    <div ng-messages="create_sufficiency.nPercent.$error" ng-show="create_sufficiency.nPercent.$dirty">
                                        <small class="help-block" ng-message="minlength">This too short</small>
                                        <small class="help-block" ng-message="maxlength">Sorry we can only take 15 characters</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group fg-float m-b-30 fg-toggled"
                                     ng-class="{ 'has-error' : (create_sufficiency.no3PPM.$invalid && !create_sufficiency.no3PPM.$pristine) || create_sufficiency.no3PPM.$touched && create_sufficiency.no3PPM.$invalid}">
                                    <div class="fg-line">
                                        <input type="text" name="no3PPM" ng-model="no3PPM"
                                               class="form-control fg-input" value="{{old('no3PPM')}}"
                                               ng-minlength="2" ng-maxlength="15">
                                        <label class="fg-label">NO3 PPM</label>
                                    </div>
                                    <div ng-messages="create_sufficiency.no3PPM.$error" ng-show="create_sufficiency.no3PPM.$dirty">
                                        <small class="help-block" ng-message="minlength">This too short</small>
                                        <small class="help-block" ng-message="maxlength">Sorry we can only take 15 characters</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group fg-float m-b-30 fg-toggled"
                                     ng-class="{ 'has-error' : (create_sufficiency.pPercent.$invalid && !create_sufficiency.pPercent.$pristine) || create_sufficiency.pPercent.$touched && create_sufficiency.pPercent.$invalid}">
                                    <div class="fg-line">
                                        <input type="text" name="pPercent" ng-model="pPercent"
                                               class="form-control fg-input" value="{{old('pPercent')}}"
                                               ng-minlength="2" ng-maxlength="15">
                                        <label class="fg-label">P %</label>
                                    </div>
                                    <div ng-messages="create_sufficiency.pPercent.$error" ng-show="create_sufficiency.pPercent.$dirty">
                                        <small class="help-block" ng-message="minlength">This too short</small>
                                        <small class="help-block" ng-message="maxlength">Sorry we can only take 15 characters</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group fg-float m-b-30 fg-toggled"
                                     ng-class="{ 'has-error' : (create_sufficiency.po4PPM.$invalid && !create_sufficiency.po4PPM.$pristine) || create_sufficiency.po4PPM.$touched && create_sufficiency.po4PPM.$invalid}">
                                    <div class="fg-line">
                                        <input type="text" name="po4PPM" ng-model="po4PPM"
                                               class="form-control fg-input" value="{{old('po4PPM')}}"
                                               ng-minlength="2" ng-maxlength="15">
                                        <label class="fg-label">PO4 PPM</label>
                                    </div>
                                    <div ng-messages="create_sufficiency.po4PPM.$error" ng-show="create_sufficiency.po4PPM.$dirty">
                                        <small class="help-block" ng-message="minlength">This too short</small>
                                        <small class="help-block" ng-message="maxlength">Sorry we can only take 15 characters</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ROW #2 K, Ca, MG, S -->
                        <div class="row" style="margin-top:25px;">
                            <div class="col-md-3">
                                <div class="form-group fg-float m-b-30 fg-toggled"
                                     ng-class="{ 'has-error' : (create_sufficiency.kPercent.$invalid && !create_sufficiency.kPercent.$pristine) || create_sufficiency.kPercent.$touched && create_sufficiency.kPercent.$invalid}">
                                    <div class="fg-line">
                                        <input type="text" name="kPercent" ng-model="kPercent"
                                               class="form-control fg-input" value="{{old('kPercent')}}"
                                               ng-minlength="2" ng-maxlength="15">
                                        <label class="fg-label">K %</label>
                                    </div>
                                    <div ng-messages="create_sufficiency.kPercent.$error" ng-show="create_sufficiency.kPercent.$dirty">
                                        <small class="help-block" ng-message="minlength">This too short</small>
                                        <small class="help-block" ng-message="maxlength">Sorry we can only take 15 characters</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group fg-float m-b-30 fg-toggled"
                                     ng-class="{ 'has-error' : (create_sufficiency.caPercent.$invalid && !create_sufficiency.caPercent.$pristine) || create_sufficiency.caPercent.$touched && create_sufficiency.caPercent.$invalid}">
                                    <div class="fg-line">
                                        <input type="text" name="caPercent" ng-model="caPercent"
                                               class="form-control fg-input" value="{{old('caPercent')}}"
                                               ng-minlength="2" ng-maxlength="15">
                                        <label class="fg-label">Ca %</label>
                                    </div>
                                    <div ng-messages="create_sufficiency.caPercent.$error" ng-show="create_sufficiency.caPercent.$dirty">
                                        <small class="help-block" ng-message="minlength">This too short</small>
                                        <small class="help-block" ng-message="maxlength">Sorry we can only take 15 characters</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group fg-float m-b-30 fg-toggled"
                                     ng-class="{ 'has-error' : (create_sufficiency.mgPercent.$invalid && !create_sufficiency.mgPercent.$pristine) || create_sufficiency.mgPercent.$touched && create_sufficiency.mgPercent.$invalid}">
                                    <div class="fg-line">
                                        <input type="text" name="mgPercent" ng-model="mgPercent"
                                               class="form-control fg-input" value="{{old('mgPercent')}}"
                                               ng-minlength="2" ng-maxlength="15">
                                        <label class="fg-label">Mg %</label>
                                    </div>
                                    <div ng-messages="create_sufficiency.mgPercent.$error" ng-show="create_sufficiency.no3PPM.$dirty">
                                        <small class="help-block" ng-message="minlength">This too short</small>
                                        <small class="help-block" ng-message="maxlength">Sorry we can only take 15 characters</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group fg-float m-b-30 fg-toggled"
                                     ng-class="{ 'has-error' : (create_sufficiency.sPercent.$invalid && !create_sufficiency.sPercent.$pristine) || create_sufficiency.sPercent.$touched && create_sufficiency.sPercent.$invalid}">
                                    <div class="fg-line">
                                        <input type="text" name="sPercent" ng-model="sPercent"
                                               class="form-control fg-input" value="{{old('sPercent')}}"
                                               ng-minlength="2" ng-maxlength="15">
                                        <label class="fg-label">S %</label>
                                    </div>
                                    <div ng-messages="create_sufficiency.sPercent.$error" ng-show="create_sufficiency.sPercent.$dirty">
                                        <small class="help-block" ng-message="minlength">This too short</small>
                                        <small class="help-block" ng-message="maxlength">Sorry we can only take 15 characters</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ROW #3 B, CU, FE, Mn -->
                        <div class="row" style="margin-top:25px;">
                            <div class="col-md-3">
                                <div class="form-group fg-float m-b-30 fg-toggled"
                                     ng-class="{ 'has-error' : (create_sufficiency.bPPM.$invalid && !create_sufficiency.bPPM.$pristine) || create_sufficiency.bPPM.$touched && create_sufficiency.bPPM.$invalid}">
                                    <div class="fg-line">
                                        <input type="text" name="bPPM" ng-model="bPPM"
                                               class="form-control fg-input" value="{{old('bPPM')}}"
                                               ng-minlength="2" ng-maxlength="15">
                                        <label class="fg-label">B PPM</label>
                                    </div>
                                    <div ng-messages="create_sufficiency.bPPM.$error" ng-show="create_sufficiency.bPPM.$dirty">
                                        <small class="help-block" ng-message="minlength">This too short</small>
                                        <small class="help-block" ng-message="maxlength">Sorry we can only take 15 characters</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group fg-float m-b-30 fg-toggled"
                                     ng-class="{ 'has-error' : (create_sufficiency.cuPPM.$invalid && !create_sufficiency.cuPPM.$pristine) || create_sufficiency.cuPPM.$touched && create_sufficiency.cuPPM.$invalid}">
                                    <div class="fg-line">
                                        <input type="text" name="cuPPM" ng-model="cuPPM"
                                               class="form-control fg-input" value="{{old('cuPPM')}}"
                                               ng-minlength="2" ng-maxlength="15">
                                        <label class="fg-label">Cu PPM</label>
                                    </div>
                                    <div ng-messages="create_sufficiency.cuPPM.$error" ng-show="create_sufficiency.cuPPM.$dirty">
                                        <small class="help-block" ng-message="minlength">This too short</small>
                                        <small class="help-block" ng-message="maxlength">Sorry we can only take 15 characters</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group fg-float m-b-30 fg-toggled"
                                     ng-class="{ 'has-error' : (create_sufficiency.fePPM.$invalid && !create_sufficiency.fePPM.$pristine) || create_sufficiency.fePPM.$touched && create_sufficiency.fePPM.$invalid}">
                                    <div class="fg-line">
                                        <input type="text" name="fePPM" ng-model="fePPM"
                                               class="form-control fg-input" value="{{old('fePPM')}}"
                                               ng-minlength="2" ng-maxlength="15">
                                        <label class="fg-label">Fe PPM</label>
                                    </div>
                                    <div ng-messages="create_sufficiency.fePPM.$error" ng-show="create_sufficiency.fePPM.$dirty">
                                        <small class="help-block" ng-message="minlength">This too short</small>
                                        <small class="help-block" ng-message="maxlength">Sorry we can only take 15 characters</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group fg-float m-b-30 fg-toggled"
                                     ng-class="{ 'has-error' : (create_sufficiency.mnPPM.$invalid && !create_sufficiency.mnPPM.$pristine) || create_sufficiency.mnPPM.$touched && create_sufficiency.mnPPM.$invalid}">
                                    <div class="fg-line">
                                        <input type="text" name="mnPPM" ng-model="mnPPM"
                                               class="form-control fg-input" value="{{old('mnPPM')}}"
                                               ng-minlength="2" ng-maxlength="15">
                                        <label class="fg-label">Mn PPM</label>
                                    </div>
                                    <div ng-messages="create_sufficiency.mnPPM.$error" ng-show="create_sufficiency.mnPPM.$dirty">
                                        <small class="help-block" ng-message="minlength">This too short</small>
                                        <small class="help-block" ng-message="maxlength">Sorry we can only take 15 characters</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ROW #4 Zn, Na, CI -->
                        <div class="row" style="margin-top:25px;">
                            <div class="col-md-3">
                                <div class="form-group fg-float m-b-30 fg-toggled"
                                     ng-class="{ 'has-error' : (create_sufficiency.znPPM.$invalid && !create_sufficiency.znPPM.$pristine) || create_sufficiency.znPPM.$touched && create_sufficiency.znPPM.$invalid}">
                                    <div class="fg-line">
                                        <input type="text" name="znPPM" ng-model="znPPM"
                                               class="form-control fg-input" value="{{old('znPPM')}}"
                                               ng-minlength="2" ng-maxlength="15">
                                        <label class="fg-label">Zn PPM</label>
                                    </div>
                                    <div ng-messages="create_sufficiency.znPPM.$error" ng-show="create_sufficiency.znPPM.$dirty">
                                        <small class="help-block" ng-message="minlength">This too short</small>
                                        <small class="help-block" ng-message="maxlength">Sorry we can only take 15 characters</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group fg-float m-b-30 fg-toggled"
                                     ng-class="{ 'has-error' : (create_sufficiency.naPercent.$invalid && !create_sufficiency.naPercent.$pristine) || create_sufficiency.naPercent.$touched && create_sufficiency.naPercent.$invalid}">
                                    <div class="fg-line">
                                        <input type="text" name="naPercent" ng-model="naPercent"
                                               class="form-control fg-input" value="{{old('naPercent')}}"
                                               ng-minlength="2" ng-maxlength="15">
                                        <label class="fg-label">Na %</label>
                                    </div>
                                    <div ng-messages="create_sufficiency.naPercent.$error" ng-show="create_sufficiency.naPercent.$dirty">
                                        <small class="help-block" ng-message="minlength">This too short</small>
                                        <small class="help-block" ng-message="maxlength">Sorry we can only take 15 characters</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group fg-float m-b-30 fg-toggled"
                                     ng-class="{ 'has-error' : (create_sufficiency.ciPercent.$invalid && !create_sufficiency.ciPercent.$pristine) || create_sufficiency.ciPercent.$touched && create_sufficiency.ciPercent.$invalid}">
                                    <div class="fg-line">
                                        <input type="text" name="ciPercent" ng-model="ciPercent"
                                               class="form-control fg-input" value="{{old('ciPercent')}}"
                                               ng-minlength="2" ng-maxlength="15">
                                        <label class="fg-label">CI %</label>
                                    </div>
                                    <div ng-messages="create_sufficiency.ciPercent.$error" ng-show="create_sufficiency.ciPercent.$dirty">
                                        <small class="help-block" ng-message="minlength">This too short</small>
                                        <small class="help-block" ng-message="maxlength">Sorry we can only take 15 characters</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-top:25px;">
                            <div class="col-sm-4">
                                <button type="submit" class="btn btn-primary btn-sm m-t-5">Add Sufficiency</button>
                            </div>
                        </div>
                    </div><!--end card body -->
                </form>
            </div>
        </div>
    </section>
@endsection