@extends('layouts.app')
@section('content')
    <section id="main">
        <div id="content">
            <div class="container c-alt">
            @if (count($errors) > 0)
                <!--SHOW ERRORS IF THERE ARE ANY -->
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
                <div class="card">
                    <div class="listview lv-bordered lv-lg">
                        <div class="lv-header-alt clearfix">
                            <h2 class="lvh-label hidden-xs">Sufficiency List</h2>
                            <ul class="lv-actions actions">
                                <li class="dropdown" uib-dropdown>
                                    <a href="" uib-dropdown-toggle aria-expanded="true">
                                        <i class="zmdi zmdi-more-vert"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li>
                                            <a href="{{url('')}}/admin/sufficiency/create">Add New</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="lv-body">
                            <!--repeater section-->
                            @foreach ($sufficiency as $suff)

                                <div class="lv-item media">
                                    <div class="lv-title"><strong>Crop Name:</strong>  {{$suff->cropName}} </div>
                                    <div class="lv-title"><strong>Growth Stage:</strong> {{$suff->growthStageName}}</div>
                                    <ul class="lv-attrs">
                                        <li style="width: 190px;">Lookup ID:  {{$suff->id}}</li>
                                        <li>Date Created: {{date('Y/m/d',substr($suff->create_dte,0,10) )}}</li>
                                    </ul>
                                    <div class="lv-actions actions dropdown" uib-dropdown>
                                        <a href="" uib-dropdown-toggle aria-expanded="true">
                                            <i class="zmdi zmdi-more-vert"></i>
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-right">
                                            <li>
                                                <a href="{{url('')}}/admin/sufficiency/update/{{$suff->id}}">Edit</a>
                                            </li>
                                            <li>
                                                <a href="{{url('')}}/admin/sufficiency/delete/{{$suff->id}}">Delete</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                            @endforeach
                        </div>
                        @if($numRows > 0)
                            <div class="text-center">{{$sufficiency->links()}}  &nbsp; <span style="margin-left:4%; padding-top:20px;">Total {{$numRows}}</span></div>
                        @endif

                        @if($numRows < 1)
                            <div class="row">
                                <div class="col-lg-12 text-center">
                                    <h3>You have no Sufficiencies listed yet</h3>
                                </div>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>
@endsection