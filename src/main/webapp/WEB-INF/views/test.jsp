<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
      <!-- Date picker plugins css -->
    
<!--     <link href="../resources/bootstrap-datepicker.min.css" rel="stylesheet"> -->

<%@ include file="header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <!-- Card -->
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Material Date picker</h4>
                                <h6 class="card-subtitle">Use <code>.bootstrapMaterialDatePicker</code> to create it.</h6>
                                <div class="row form-material">
                                    <div class="col-md-6">
                                        <label class="m-t-20">Default Material Date Picker</label>
                                        <input type="text" class="form-control" placeholder="2017-06-04" id="mdate">
                                        <label class="m-t-40">Default Material Date Timepicker</label>
                                        <input type="text" id="date-format" class="form-control" placeholder="Saturday 24 June 2017 - 21:44">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="m-t-20">Time Picker</label>
                                        <input class="form-control" id="timepicker" placeholder="Check time">
                                        <label class="m-t-40">Min Date set</label>
                                        <input type="text" class="form-control" placeholder="set min date" id="min-date">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Card -->
                        <!-- Card -->
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Clock Picker</h4>
                                <h6 class="card-subtitle">Use <code>.clockpicker</code> to create it.</h6>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="m-t-20">Default Clock Picker</label>
                                        <div class="input-group clockpicker">
                                            <input type="text" class="form-control" value="09:30"> <span class="input-group-append"><span class="input-group-text"><i class="fa fa-clock-o"></i></span></span>
                                        </div>
                                        <label class="m-t-40">Auto close Clock Picker</label>
                                        <div class="input-group clockpicker" data-placement="bottom" data-align="top" data-autoclose="true">
                                            <input type="text" class="form-control" value="13:14"> <span class="input-group-append"><span class="input-group-text"><i class="fa fa-clock-o"></i></span></span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="m-t-20">Now time</label>
                                        <div class="input-group">
                                            <input class="form-control" id="single-input" value="" placeholder="Now"> <span class="input-group-btn"><button type="button" id="check-minutes" class="btn waves-effect waves-light btn-success">Check the minutes</button></span>
                                        </div>
                                        <label class="m-t-40">Left Placement</label>
                                        <div class="input-group clockpicker" data-placement="left" data-align="top" data-autoclose="true">
                                            <input type="text" class="form-control" value="13:14"> <span class="input-group-append"><span class="input-group-text"><i class="fa fa-clock-o"></i></span></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Card -->
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4 m-b-30">
                                        <div class="example">
                                            <h5 class="box-title">Simple mode</h5>
                                            <p class="text-muted m-b-20">just add class <code>.colorpicker</code> to create it.</p>
                                            <input type="text" class="colorpicker form-control" value="#7ab2fa">
                                        </div>
                                    </div>
                                    <div class="col-md-4 m-b-30">
                                        <div class="example">
                                            <h5 class="box-title">Complex mode</h5>
                                            <p class="text-muted m-b-20">just add class <code>.complex-colorpicker</code> to create it.</p>
                                            <input type="text" class="complex-colorpicker form-control" value="#fa7a7a">
                                        </div>
                                    </div>
                                    <div class="col-md-4 m-b-30">
                                        <div class="example">
                                            <h5 class="box-title">Gradiant mode</h5>
                                            <p class="text-muted m-b-20">just add class <code>.gradient-colorpicker-colorpicker</code> to create it.</p>
                                            <input type="text" class="gradient-colorpicker form-control" value="#bee0ab">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Card -->
                        <!-- Card -->
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Date Range picker</h4>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="example">
                                            <h5 class="box-title m-t-30">Date Range Pick</h5>
                                            <input class="form-control input-daterange-datepicker" type="text" name="daterange" value="01/01/2015 - 01/31/2015">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="example">
                                            <h5 class="box-title m-t-30">Date Range With Time</h5>
                                            <input type="text" class="form-control input-daterange-timepicker" name="daterange" value="01/01/2015 1:30 PM - 01/01/2015 2:00 PM">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="example">
                                            <h5 class="box-title m-t-30">Limit Selectable Dates</h5>
                                            <input class="form-control input-limit-datepicker" type="text" name="daterange" value="06/01/2015 - 06/07/2015">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Card -->
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="example">
                                            <h5 class="box-title m-t-30">Default Datedpicker</h5>
                                            <p class="text-muted m-b-20">just add class <code>.mydatepicker</code> to create it.</p>
                                            <div class="input-group">
                                                <input type="text" class="form-control mydatepicker" placeholder="mm/dd/yyyy"> <span class="input-group-append"><span class="input-group-text"><i class="mdi mdi-calendar-check"></i></span></span>
                                            </div>
                                        </div>
                                        <div class="example">
                                            <h5 class="box-title m-t-30">Autoclose Datedpicker</h5>
                                            <p class="text-muted m-b-20">just add class <code>.complex-colorpicker</code> to create it.</p>
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="datepicker-autoclose" placeholder="mm/dd/yyyy"> <span class="input-group-append"><span class="input-group-text"><i class="mdi mdi-calendar-check"></i></span></span>
                                            </div>
                                        </div>
                                        <div class="example">
                                            <h5 class="box-title m-t-30">Date Range picker</h5>
                                            <p class="text-muted m-b-20">just add id <code>#date-range</code> to create it.</p>
                                            <div class="input-daterange input-group" id="date-range">
                                                <input type="text" class="form-control" name="start"> <span class="input-group-addon bg-info b-0 text-white">to</span>
                                                <input type="text" class="form-control" name="end">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="text-center">
                                            <h5 class="box-title m-t-30">Datepicker Inline</h5>
                                            <p class="text-muted m-b-20">You also can set the datepicker to be inline and flat.</p>
                                            <div>
                                                <div id="datepicker-inline"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
<%@ include file="footer.jsp" %>                            
 
     <!-- Date Picker Plugin JavaScript -->
<!--     <script src="../resources/bootstrap-datepicker.min.js"></script> -->
<div class="dtp hidden" id="dtp_4vOLF"><div class="dtp-content" style="margin-left: -150px; top: 212.813px;"><div class="dtp-date-view"><header class="dtp-header"><div class="dtp-actual-day">Monday</div><div class="dtp-close"><a href="javascript:void(0);"><i class="ti-close"></i></a></div></header><div class="dtp-date"><div><div class="left center p10"><a href="javascript:void(0);" class="dtp-select-month-before"><i class="ti-angle-left"></i></a></div><div class="dtp-actual-month p80">JUN</div><div class="right center p10"><a href="javascript:void(0);" class="dtp-select-month-after"><i class="ti-angle-right"></i></a></div><div class="clearfix"></div></div><div class="dtp-actual-num">01</div><div><div class="left center p10"><a href="javascript:void(0);" class="dtp-select-year-before"><i class="ti-angle-left"></i></a></div><div class="dtp-actual-year p80">2020</div><div class="right center p10"><a href="javascript:void(0);" class="dtp-select-year-after"><i class="ti-angle-right"></i></a></div><div class="clearfix"></div></div></div><div class="dtp-time hidden"><div class="dtp-actual-maxtime">23:55</div></div><div class="dtp-picker"><div class="dtp-picker-calendar"><div class="dtp-picker-month">June 2020</div><table class="table dtp-picker-days"><thead><tr><th>S</th><th>M</th><th>T</th><th>W</th><th>T</th><th>F</th><th>S</th></tr></thead><tbody><tr></tr><tr><td data-date="1"></td><td data-date="1"><a href="javascript:void(0);" class="dtp-select-day selected">01</a></td><td data-date="2"><a href="javascript:void(0);" class="dtp-select-day">02</a></td><td data-date="3"><a href="javascript:void(0);" class="dtp-select-day">03</a></td><td data-date="4"><a href="javascript:void(0);" class="dtp-select-day">04</a></td><td data-date="5"><a href="javascript:void(0);" class="dtp-select-day">05</a></td><td data-date="6"><a href="javascript:void(0);" class="dtp-select-day">06</a></td></tr><tr><td data-date="7"><a href="javascript:void(0);" class="dtp-select-day">07</a></td><td data-date="8"><a href="javascript:void(0);" class="dtp-select-day">08</a></td><td data-date="9"><a href="javascript:void(0);" class="dtp-select-day">09</a></td><td data-date="10"><a href="javascript:void(0);" class="dtp-select-day">10</a></td><td data-date="11"><a href="javascript:void(0);" class="dtp-select-day">11</a></td><td data-date="12"><a href="javascript:void(0);" class="dtp-select-day">12</a></td><td data-date="13"><a href="javascript:void(0);" class="dtp-select-day">13</a></td></tr><tr><td data-date="14"><a href="javascript:void(0);" class="dtp-select-day">14</a></td><td data-date="15"><a href="javascript:void(0);" class="dtp-select-day">15</a></td><td data-date="16"><a href="javascript:void(0);" class="dtp-select-day">16</a></td><td data-date="17"><a href="javascript:void(0);" class="dtp-select-day">17</a></td><td data-date="18"><a href="javascript:void(0);" class="dtp-select-day">18</a></td><td data-date="19"><a href="javascript:void(0);" class="dtp-select-day">19</a></td><td data-date="20"><a href="javascript:void(0);" class="dtp-select-day">20</a></td></tr><tr><td data-date="21"><a href="javascript:void(0);" class="dtp-select-day">21</a></td><td data-date="22"><a href="javascript:void(0);" class="dtp-select-day">22</a></td><td data-date="23"><a href="javascript:void(0);" class="dtp-select-day">23</a></td><td data-date="24"><a href="javascript:void(0);" class="dtp-select-day">24</a></td><td data-date="25"><a href="javascript:void(0);" class="dtp-select-day">25</a></td><td data-date="26"><a href="javascript:void(0);" class="dtp-select-day">26</a></td><td data-date="27"><a href="javascript:void(0);" class="dtp-select-day">27</a></td></tr><tr><td data-date="28"><a href="javascript:void(0);" class="dtp-select-day">28</a></td><td data-date="29"><a href="javascript:void(0);" class="dtp-select-day">29</a></td><td data-date="30"><a href="javascript:void(0);" class="dtp-select-day">30</a></td></tr></tbody></table></div><div class="dtp-picker-datetime hidden"><div class="dtp-actual-meridien"><div class="left p20"><a class="dtp-meridien-am" href="javascript:void(0);">AM</a></div><div class="dtp-actual-time p60"></div><div class="right p20"><a class="dtp-meridien-pm" href="javascript:void(0);">PM</a></div><div class="clearfix"></div></div><div id="dtp-svg-clock"></div></div><div class="dtp-picker-year hidden"><div><a href="javascript:void(0);" class="btn btn-default dtp-select-year-range before" style="margin: 0;"><i class="ti-angle-up"></i></a></div><div class="year-picker-item" data-year="2017">2017</div><div class="year-picker-item" data-year="2018">2018</div><div class="year-picker-item" data-year="2019">2019</div><div class="year-picker-item" data-year="2020">2020</div><div class="year-picker-item" data-year="2021">2021</div><div class="year-picker-item" data-year="2022">2022</div><div class="year-picker-item" data-year="2023">2023</div><div><a href="javascript:void(0);" class="btn btn-default dtp-select-year-range after" style="margin: 0;"><i class="ti-angle-down"></i></a></div></div></div></div><div class="dtp-buttons"><button class="dtp-btn-now btn btn-flat hidden">Now</button><button class="dtp-btn-clear btn btn-flat hidden">Clear</button><button class="dtp-btn-cancel btn btn-inverse m-r-10">Cancel</button><button class="dtp-btn-ok btn btn-success">OK</button><div class="clearfix"></div></div></div></div>

</body>
</html>