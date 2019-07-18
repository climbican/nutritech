<!DOCTYPE html>
<html data-ng-app="ledgedogAdmin" data-ng-controller="ledgedogAdminCtrl">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Nutritech Admin</title>

    <!-- Vendor CSS -->
    <link href="{{url('vendors/bower_components/animate.css/animate.min.css')}}" rel="stylesheet">
    <link href="{{url('vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css')}}" rel="stylesheet">
    <link href="{{url('vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.css')}}" rel="stylesheet">
    <link href="{{url('vendors/bower_components/angular-loading-bar/src/loading-bar.css')}}" rel="stylesheet">
    <link href="{{url('vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css')}}" rel="stylesheet">

    <!-- LIST VIEW CSS-->
    <link href="{{url('vendors/bower_components/nouislider/jquery.nouislider.css')}}" rel="stylesheet" />
    <link href="{{url('vendors/farbtastic/farbtastic.css')}}" rel="stylesheet" />
    <link href="{{url('vendors/bower_components/summernote/dist/summernote.css')}}" rel="stylesheet" />
    <link href="{{url('vendors/bower_components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css')}}" rel="stylesheet" />
    <link href="{{url('vendors/bower_components/chosen/chosen.min.css')}}" rel="stylesheet" />
    <!-- CSS -->
    <link href="{{url('css/app.min.1.css')}}" rel="stylesheet" id="app-level">
    <link href="{{url('css/app.min.2.css')}}" rel="stylesheet">

    <link rel="shortcut icon" href="{{url('favicon.ico')}}">
</head>
<body id="app-layout" clss="blue">
<header id="header" data-current-skin="blue"data-ng-controller="headerCtrl as hctrl">
    <ul class="header-inner clearfix">
        <li class="hidden-xs">
            <a href="{{url('')}}/" class="m-l-10" data-ng-click="hctrl.sidebarStat($event)"><img src="{{url('images/favicon-128.png')}}" alt="" height="35px"></a>
        </li>

        <li class="pull-right">
            <ul class="top-menu">
                @if (Auth::guest())
                    <!--fist section kept as reference for register page -->
                <li class="dropdown" uib-dropdown>
                    <a uib-dropdown-toggle href="">
                        <span class="tm-label"> Guest Options <span class="caret"></span></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg pull-right">
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li>
                                <a href="{{url('')}}/login"><span class="tm-label"><i class="tm-icon zmdi zmdi-power"></i> Log In</span></a></a>
                            </li>
                            <li><a href="{{ url('/register') }}">Register</a></li>
                        </ul>
                    </div>
                </li>
                @else
                <li id="sufficiency">
                    <a href="{{url('admin/sufficiency/list')}}"><span class="tm-label"><i class="zmdi zmdi-label"></i> Sufficiency</span></a>
                </li>
                <li id="deficiency">
                    <a href="{{url('admin/deficiency/list')}}"><span class="tm-label"><i class="zmdi zmdi-label"></i> Deficiency</span></a>
                </li>
                <li id="products">
                    <a href="{{url('admin/product/list')}}"><span class="tm-label"><i class="zmdi zmdi-label"></i> Products</span></a>
                </li>
                <li id="element">
                    <a href="{{url('admin/element/list')}}"><span class="tm-label"><i class="zmdi zmdi-dot-circle"></i> Elements</span></a>
                </li>
                <li id="crops">
                    <a href="{{url('admin/crop/list')}}"><span class="tm-label"><img src="{{url('images/icons/wheat-icon-white.png')}}" style="height:20px;"> Crops</span></a>
                </li>
                <li id="compatability">
                    <a href="{{url('admin/compatibility/list')}}"><span class="tm-label"><i class="zmdi zmdi-view-list-alt"></i> Compatibility</span></a>
                </li>
                <li id="profile">
                    <a href="{{url('admin/profile/list')}}"><span class="tm-label"><i class="zmdi zmdi-account"></i> Profiles</span></a>
                </li>
                <li class="dropdown" uib-dropdown>
                    <a uib-dropdown-toggle href="">
                        <span class="tm-label"><span class="zmdi zmdi-settings"></span> {{ Auth::user()->name }}</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg pull-right">
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li>
                                <a href="{{url('admin/profile/update/'.Auth::user()->id)}}"><span class="tm-label"><i class="tm-icon zmdi zmdi-account"></i> Update</span>
                                <a href="{{url('')}}/logout"><span class="tm-label"><i class="tm-icon zmdi zmdi-power"></i> Log Out</span></a></a>
                            </li>
                        </ul>
                    </div>
                </li>
                @endif

            </ul>
        </li>
    </ul>
</header>

    @extends('partials.flash')
    @yield('content')

    <!-- Older IE warning message -->
    <!--[if lt IE 9]>
    <div class="ie-warning">
        <h1 class="c-white">Warning!!</h1>
        <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
        <div class="iew-container">
            <ul class="iew-download">
                <li>
                    <a href="http://www.google.com/chrome/">
                        <img src="{{url('')}}img/browsers/chrome.png" alt="">
                        <div>Chrome</div>
                    </a>
                </li>
                <li>
                    <a href="https://www.mozilla.org/en-US/firefox/new/">
                        <img src="img/browsers/firefox.png" alt="">
                        <div>Firefox</div>
                    </a>
                </li>
                <li>
                    <a href="http://www.opera.com">
                        <img src="img/browsers/opera.png" alt="">
                        <div>Opera</div>
                    </a>
                </li>
                <li>
                    <a href="https://www.apple.com/safari/">
                        <img src="img/browsers/safari.png" alt="">
                        <div>Safari</div>
                    </a>
                </li>
                <li>
                    <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                        <img src="img/browsers/ie.png" alt="">
                        <div>IE (New)</div>
                    </a>
                </li>
            </ul>
        </div>
        <p>Sorry for the inconvenience!</p>
    </div>
    <![endif]-->


    <!-- Core -->
   <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>-->
    <!-- local dev -->
    <script src="{{url('js/jquery-3.0.0.min.js')}}"></script>
    <script src="{{url('vendors/bower_components/chosen/chosen.jquery.min.js')}}"></script>

    <!-- Angular -->
    <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.8/angular.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.8/angular-animate.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.8/angular-resource.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.8/angular-messages.js"></script>-->

    <!-- Local Dev Angular Scripts -->
    <script src="{{url('vendors/bower_components/angular/angular.min.js')}}"></script>
    <script src="{{url('vendors/bower_components/angular-animate/angular-animate.min.js')}}"></script>
    <script src="{{url('vendors/bower_components/angular-resource/angular-resource.min.js')}}"></script>
    <script src="{{url('vendors/bower_components/angular-messages/angular-messages.min.js')}}"></script>

    <!-- Angular Modules -->
    <script src="{{url('vendors/bower_components/angular-ui-router/release/angular-ui-router.min.js')}}"></script>
    <script src="{{url('vendors/bower_components/angular-loading-bar/src/loading-bar.js')}}"></script>
    <script src="{{url('vendors/bower_components/oclazyload/dist/ocLazyLoad.min.js')}}"></script>
    <script src="{{url('vendors/bower_components/angular-bootstrap/ui-bootstrap-tpls.min.js')}}"></script>

    <!-- Common Vendors -->
    <script src="{{url('vendors/bower_components/Waves/dist/waves.min.js')}}"></script>
    <script src="{{url('vendors/bootstrap-growl/bootstrap-growl.min.js')}}"></script>
    <script src="{{url('vendors/fileinput/fileinput.min.js')}}"></script>
    <script src="{{url('vendors/bower_components/angular-chosen-localytics/angular-chosen.js')}}"></script>
    <script src="{{url('vendors/bower_components/autosize/dist/autosize.min.js')}}"></script>

    <!-- Placeholder for IE9 -->
    <!--[if IE 9 ]>
    <script src="{{url('vendors/bower_components/jquery-placeholderjquery.placeholder.min.js')}}"></script>
    <![endif]-->

    <!-- App level -->
    <script src="{{url('js/app.js')}}"></script>
    <script src="{{url('js/controllers/constants.js')}}"></script>
    <script src="{{url('js/controllers/main.js')}}"></script>
    <script src="{{url('js/services.js')}}"></script>
    <script src="{{url('js/templates.js')}}"></script>
    <script src="{{url('js/controllers/ui-bootstrap.js')}}"></script>
    <script src="{{url('js/controllers/table.js')}}"></script>
    <script src="{{url('js/ngmatch.js')}}"></script>


    <!-- Template Modules -->
    <script src="{{url('js/modules/template.js')}}"></script>
    <script src="{{url('js/modules/ui.js')}}"></script>
    <script src="{{url('js/modules/charts/flot.js')}}"></script>
    <script src="{{url('js/modules/charts/other-charts.js')}}"></script>
    <script src="{{url('js/modules/form.js')}}"></script>
    <script src="{{url('js/modules/media.js')}}"></script>
    <script src="{{url('js/modules/components.js')}}"></script>
    <script src="{{url('js/modules/calendar.js')}}"></script>
    <script src="{{url('js/modules/demo.js')}}"></script>
    <script src="{{url('js/modules/ng-messages.js')}}"></script>

</body>
</html>