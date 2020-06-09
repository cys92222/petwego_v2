<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>PETWEGO | 숙소</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10eed821bdf522662f857166aa9069bc&libraries=services"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
// URL paramter 가져오기
$(function(){
	
	$("#chk_money").click(function(){
		var chk_check_in = $("#chk_check_in").val();
		var chk_check_out = $("#chk_check_out").val();
		var cci = Number(chk_check_in.replace(/-/gi,"")); 
		var cco = Number(chk_check_out.replace(/-/gi,""));
		var ccm = cco - cci; //숙박 일수 계산
		$("#chk_nights").val(ccm);
		var r_cost = $("#chk_rm_cost").val();
		var last_money = ccm * r_cost //최종 금액
		$("#chk_rsv_price").val(last_money);
	});

	$("input[name=same]").change(function() {
	    if(this.checked) {
			$("#guest_name").val('${my.name}');
			$("#guest_tel").val('${my.tel}');
	    }
	});
	
	var getUrlParameter = function getUrlParameter(sParam) {
	    var sPageURL = window.location.search.substring(1),
	        sURLVariables = sPageURL.split('&'),
	        sParameterName,
	        i;

	    for (i = 0; i < sURLVariables.length; i++) {
	        sParameterName = sURLVariables[i].split('=');

	        if (sParameterName[0] === sParam) {
	            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
	        }
	    }
	};	
	
    // ******** 리뷰 ********
    
    /** 리뷰 모달 별점 **/
    /* 1. Visualizing things on Hover - See next part for action on click */
    $('#stars li').on('mouseover', function () {
              var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on
              // Now highlight all the stars that's not after the current hovered star
              $(this).parent().children('li.star').each(function (e) {
                        if (e < onStar) {
                                  $(this).addClass('hover');
                        }
                        else {
                                  $(this).removeClass('hover');
                        }
              });
    }).on('mouseout', function () {
              $(this).parent().children('li.star').each(function (e) {
                        $(this).removeClass('hover');
              });
    });
    /* 2. Action to perform on click */
    $('#stars li').on('click', function () {
              var onStar = parseInt($(this).data('value'), 10); // The star currently selected
              var stars = $(this).parent().children('li.star');
              for (i = 0; i < stars.length; i++) {
                        $(stars[i]).removeClass('selected');
              }
              for (i = 0; i < onStar; i++) {
                        $(stars[i]).addClass('selected');
              }
              // JUST RESPONSE (Not needed)
              var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
              $('#ratingValue').val(ratingValue);

              var msg = "";
              var n = ratingValue;
              switch(n) {
              case 5:
	               msg = "좋아요 !";
	               break;
              case 4:
	               msg = "괜찮아요 !";
	               break;
              case 3:
            	  msg = "보통이에요";
                  break;
              case 2:
                  msg = "별로예요";
                  break;
              default:
                  msg = "나빠요";
             }   
             responseMessage(msg); 

    });
    function responseMessage(msg) {
    	  $('.success-box').fadeIn(200);  
    	  $('.success-box div.text-message').html('<h4 class="mt-1 font-weight-light">' + msg + '</h4>');
    }
    // 리뷰 등록 버튼을 눌렀을 때
    $('#reviewSubmit').click(function(e){
    	e.preventDefault();
        action = 'create';
        type = 'POST';

		alert("리뷰를 등록합니다.");

        var facility_no = getUrlParameter('facility_no');
        url = '/facility/detail/review';
 
		r_grade = $('input[name=r_grade]').val();
		review_content = $('textarea[name=review_content]').val();

		var data = {
			"facility_no" : facility_no,
			"r_grade" : r_grade,
			"review_content" : review_content,
			"user_id" : '${login_id}'
		}

		console.log(data);

		$.ajax({
			url : url,
			type : "POST",
			data : data,
			beforeSend: function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success:function(data){
				$('#reviewModal').modal('toggle');
				location.reload(true);
			}
		
		});
		
    });



    // ******** 예약 ********

    var arr = ${arr};

    
	$.each(arr,function(idx,n){

    
	$('#reserveBtn'+n.rm_no).click(function(e){
		e.preventDefault();
 		action = 'reserve';
		// 모달에 넣어줄 정보 담기
		var check_inF = $('#check_inF').val();
		var check_outF = $('#check_outF').val();
		
		var human_numF = $('#human_numF option:selected').val();
		var pet_numF = $('#pet_numF option:selected').val();

		// 체크인,체크아웃,인원,동물
		$('input[name=check_in]').val(check_inF);
		$('input[name=check_out]').val(check_outF);
		$('input[name=human_num]').val(human_numF);
		$('input[name=pet_num]').val(pet_numF);

		// 숙박일수
		var check_inArr = check_inF.split('-');
		var check_outArr = check_outF.split('-');
		var dateObj_in = new Date(check_inArr[0],Number(check_inArr[1])-1,check_inArr[2]);
		var dateObj_out = new Date(check_outArr[0],Number(check_outArr[1])-1,check_outArr[2]);
		var nights = (dateObj_out.getTime()-dateObj_in.getTime())/1000/60/60/24;
		if(nights<0){
			alert('체크아웃 날짜는 체크인 날짜보다 이른 날짜일 수 없습니다!');
		}
		$('input[name=nights]').val(nights);		
		$('input[name=rm_opt]').val(1);
		
		// 숙소정보 
		var facility_name = $('#facility_name').text();
		var facility_area = $('#facility_area').text();



		// 객실명
		var tempName = $(this).parent().parents('td').eq(0).siblings('.d-flex').find('.media-body').find('h5').text();
		var rm_name = $.trim(tempName);

		// 객실별 일박가격, 주련 0603
		var tempValue = $(this).parent().siblings('#rm_cost').text();
		var rm_cost = $.trim(tempValue);		

		// 객실 번호, 주련 0603 
	 	var rm_no = $(this).parent().parents('td').eq(0).siblings('.d-flex').find('#rm_no_asd').val();
		
		$('input[name=facility_info]').val(facility_name+'/'+facility_area);
		$('input[name=rm_name]').val(rm_name);
		$('input[name=rm_no]').val(rm_no);


		
	    var special_pattern = /[~]/gi;
	 	// 만약 특수문자 '~' 기호를 포함하고, 인원이 최소기준인원(2명)이라면
 	    if(special_pattern.test(rm_cost)==true && (parseInt(human_numF) <= 2) ){
			var rm_costS = parseInt( rm_cost.split('~')[0].replace(',','') ); 
			var rsv_price = parseInt( rm_cost.split('~')[0].replace(',','') )*nights;
			$('input[name=rm_cost]').val(rm_costS);
			$('input[name=rsv_price]').val(rsv_price);

	    }else if( special_pattern.test(rm_cost)==true && (parseInt(human_numF) > 2) ){
			var rm_costS = parseInt( rm_cost.split('~')[1].replace(',','').substring(0,rm_cost.split('~')[1].length-1) ); 
			var rsv_price = parseInt( rm_cost.split('~')[1].replace(',','').substring(0,rm_cost.split('~')[1].length-1) )*nights; 
			$('input[name=rm_cost]').val(rm_costS);
			$('input[name=rsv_price]').val(rsv_price);				
		}else{
			var rm_costS = parseInt(rm_cost.replace(',','').substring(0,rm_cost.length-1));
			var rsv_price = parseInt(rm_cost.replace(',','').substring(0,rm_cost.length-1))*nights;
			$('input[name=rm_cost]').val(rm_costS);
			$('input[name=rsv_price]').val(rsv_price);
		}



				
		
	}); // reserveBtn-end
});
	
	
	// '결제하기'redirect
	$('#reserveSubmit').click(function(e){

		rm_no= $('input[name=rm_no]').val();
		
		if(action == 'reserve'){
			var facility_no = getUrlParameter('facility_no');
			url = '/facility/reserve',
			type = 'POST'
		}
		var data = {
			'user_id':$('input[name=user_id]').val(),
			'rsv_price':parseInt($('input[name=rsv_price]').val()),			
			'check_in' : $('input[name=check_in]').val(),
			'check_out' : $('input[name=check_out]').val(),
			'human_num' : parseInt($('input[name=human_num]').val()),
			'pet_num' : parseInt($('input[name=pet_num]').val()),
			'rm_no' : rm_no,
			'facility_no' : facility_no,
			'guest_name' : $("input[name=guest_name]").val(),
			'guest_tel' : $("input[name=guest_tel]").val()	
		}

		
		$.ajax("/facility/reserve",{data:data,success:function(re){
			$('#reserveModal').modal('toggle');
			window.location.href="/facility/pay?str="+re;
			}});
		

	});


	// 검색창 스크롤 effect  
    var snOffset = $('.searchNav').offset();
    $(window).scroll(function(){
      if ( $( document ).scrollTop() > snOffset.top ) {
        $( '.searchNav' ).addClass( 'snFixed' );
      
       
      }
      else {
        $( '.searchNav' ).removeClass( 'snFixed' );

      }
    });
    
}); // end-of


</script>
<!--Font awesome CDN-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<style type="text/css">
/* Rating Star Widgets Style */
.rating-stars ul {
	list-style-type: none;
	padding: 0;
	-moz-user-select: none;
	-webkit-user-select: none;
}

.rating-stars ul>li.star {
	display: inline-block;
}

/* Idle State of the stars */
.rating-stars ul>li.star>i.fa {
	font-size: 2.3em;
	/* Change the size of the stars */
	color: #ccc;
	/* Color on idle state */
}

/* Hover state of the stars */
.rating-stars ul>li.star.hover>i.fa {
	color: #FFCC36;
}

/* Selected state of the stars */
.rating-stars ul>li.star.selected>i.fa {
	color: #FF912C;
}

.success-box {
	margin: 50px 0;
	padding: 10px 10px;
	border: 1px solid #eee;
	background: #f9f9f9;
}

.success-box img {
	margin-right: 10px;
	display: inline-block;
	vertical-align: top;
}

.success-box>div {
	vertical-align: top;
	display: inline-block;
	color: #888;
}
 .snFixed {
   position: fixed;
   top: 0px;
   z-index:100;
   right: 30px;
   left: 275px;
   
 }
 
 
/* animation */

.scrolldown-container {   
        width: 80px;
        height: 50px;
        position: relative;
          
 }

.scrolldown-container .scrolldown-btn {
        width: 50px;
        height: 100px;
        position: absolute;
        left: 35%;
		bottom: 10%;
	      right: auto;
	      transform: rotate(-90deg);
	      -webkit-transform: translateX(-50%) translateY(-50%);
	      -moz-transform: translateX(-50%) translateY(-50%);
	      -ms-transform: translateX(-50%) translateY(-50%);
	      -o-transform: translateX(-50%) translateY(-50%);
	      transform: translateX(-50%) translateY(-50%);
}
          
         
.scrolldown-container .scrolldown-btn svg {
          position: absolute;
          
          left: 0;
          width: 100%;
          height: auto;
          top:40%;
}

.scrolldown-container .scrolldown-btn svg path.first-path {
          animation: scrollanim 1s ease-in-out infinite;
          animation-delay: 0.8s;
}

.scrolldown-container .scrolldown-btn svg path.second-path {
          animation: scrollanim2 1s ease-in-out infinite;
}

@-webkit-keyframes scrollanim {
          0% {
                    -webkit-transform: translate(0, -40px);
                    opacity: 0;
          }

          60% {
                    -webkit-transform: translate(0, 0);
                    opacity: 0.8;
          }
}

@-moz-keyframes scrollanim {
          0% {
                    -moz-transform: translate(0, -40px);
                    opacity: 0;
          }

          60% {
                    -moz-transform: translate(0, 0);
                    opacity: 0.8;
          }
}

@keyframes scrollanim {
          0% {
                    -webkit-transform: translate(0, -40px);
                    -moz-transform: translate(0, -40px);
                    -ms-transform: translate(0, -40px);
                    -o-transform: translate(0, -40px);
                    transform: translate(0, -40px);
                    opacity: 0;
          }

          60% {
                    -webkit-transform: translate(0, 0);
                    -moz-transform: translate(0, 0);
                    -ms-transform: translate(0, 0);
                    -o-transform: translate(0, 0);
                    transform: translate(0, 0);
                    opacity: 0.8;
          }
}

@-webkit-keyframes scrollanim2 {
          0% {
                    -webkit-transform: translate(0, -40px);
                    opacity: 0;
          }

          60% {
                    -webkit-transform: translate(0, 0px);
                    opacity: 0.6;
          }
}

@-moz-keyframes scrollanim2 {
          0% {
                    -moz-transform: translate(0, -40px);
                    opacity: 0;
          }

          60% {
                    -moz-transform: translate(0, 0px);
                    opacity: 0.6;
          }
}

@keyframes scrollanim2 {
          0% {
                    -webkit-transform: translate(0, -40px);
                    -moz-transform: translate(0, -40px);
                    -ms-transform: translate(0, -40px);
                    -o-transform: translate(0, -40px);
                    transform: translate(0, -40px);
                    opacity: 0;
          }

          60% {
                    -webkit-transform: translate(0, 0px);
                    -moz-transform: translate(0, 0px);
                    -ms-transform: translate(0, 0px);
                    -o-transform: translate(0, 0px);
                    transform: translate(0, 0px);
                    opacity: 0.6;
          }
}
 
 

</style>
</head>

<body>
<div class="row page-titles mx-0">
	<div class="col p-md-0">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/facility/detail">숙소 | 상세</a></li>
			<li class="breadcrumb-item"><a href="/facility/search">숙소</a></li>
			<li class="breadcrumb-item active"><a href="/MainPage">메인</a></li>
		</ol>
	</div>
</div>

	<div class="container-fluid mt-3">
		<!-- upper form start -->
		<div class="row searchNav">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
        				<c:set var="f" value="${getFacility}"></c:set>
          				<h5 class="card-title mb-3">${fn:substring(f.facility_addr,0,2)} ${f.facility_name}, 지금 바로 예약하세요 ! </h5>
						<div class="basic-form">
							<form id="searchForm">
								<div class="form-row">
									<c:set var="f" value="${getFacility}"></c:set>
									<div class="col-lg-3 col-md-12 col-sm-12 mb-3">
										<input id="facility_addrF" type="text" class="form-control input-default" placeholder="어디로 가시나요?" value="${fn:substring(f.facility_addr,0,2)} ${f.facility_name}" readonly="readonly" style="background:#fff;">
									</div>
									<div class="col-lg-2 col-md-12 col-sm-12 mb-3">
										<input id="check_inF" type="date" class="form-control input-default">
									</div>
									<div class="col-lg-2 col-md-12 col-sm-12 mb-3">
										<input id="check_outF" type="date" class="form-control input-default">
									</div>

									<div class="col-lg-2 col-md-12 col-sm-12 mb-3">
										
										<select id="human_numF" class="form-control input-default">
				
											<option value="1">1명</option>
											<option value="2">2명</option>
											<option value="3">3명</option>
											<option value="4">4명</option>
											<option value="5">5명</option>
											<option value="6">6명</option>
											<option value="7">7명</option>
											<option value="8">8명</option>
											<option value="9">9명+</option>

										</select>
									</div>
									<div class="col-lg-2 col-md-12 col-sm-12 mb-3">
										
										<select id="pet_numF" class="form-control input-default">
											
											<option value="1">1마리</option>
											<option value="2">2마리</option>
											<option value="3">3마리</option>
											<option value="4">4마리</option>
											<option value="5">5마리</option>
											<option value="6">6마리</option>
										</select>
									</div>
<!-- animation start -->
          <div class="scrolldown-container col-lg-1">
                    <div class="scrolldown-btn" style="
    trasform: rotate(0deg) !important;
    -webkit-transform-origin-x: rotate(0deg);
    transform: rotate(0deg);
">
                              <svg version="1.1" id="Слой_1" xmlns="http://www.w3.org/2000/svg"
                                        xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="50px"
                                        height="80px" viewBox="0 0 90 120" enable-background="new 0 0 90 120"
                                        xml:space="preserve">
                                        <path class="first-path" fill="#7571f9"
                                                  d="M24.752,79.182c-0.397,0-0.752-0.154-1.06-0.463L2.207,57.234c-0.306-0.305-0.458-0.656-0.458-1.057                  s0.152-0.752,0.458-1.059l2.305-2.305c0.309-0.309,0.663-0.461,1.06-0.461c0.398,0,0.752,0.152,1.061,0.461l18.119,18.119                  l18.122-18.119c0.306-0.309,0.657-0.461,1.057-0.461c0.402,0,0.753,0.152,1.059,0.461l2.306,2.305                  c0.308,0.307,0.461,0.658,0.461,1.059s-0.153,0.752-0.461,1.057L25.813,78.719C25.504,79.027,25.15,79.182,24.752,79.182z">
                                        </path>
                                        <path class="second-path" fill="#7571f9"
                                                  d="M24.752,58.25c-0.397,0-0.752-0.154-1.06-0.463L2.207,36.303c-0.306-0.304-0.458-0.655-0.458-1.057                  c0-0.4,0.152-0.752,0.458-1.058l2.305-2.305c0.309-0.308,0.663-0.461,1.06-0.461c0.398,0,0.752,0.153,1.061,0.461l18.119,18.12                  l18.122-18.12c0.306-0.308,0.657-0.461,1.057-0.461c0.402,0,0.753,0.153,1.059,0.461l2.306,2.305                  c0.308,0.306,0.461,0.657,0.461,1.058c0,0.401-0.153,0.753-0.461,1.057L25.813,57.787C25.504,58.096,25.15,58.25,24.752,58.25z">
                                        </path>
                              </svg>
                    </div>
          </div>

													<!-- animation end -->								
								
								
								
								
								
								
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!--  col end -->
		</div>


		<!-- upper form end  -->

		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<c:set var="f" value="${getFacility}"></c:set>
						<div class="d-flex mb-5 justify-content-between">
							<div class="mb-5 mr-5">
								<h4 id="facility_area" class="mb-1">${fn:substring(f.facility_addr,0,2)}</h4>
								<h3 id="facility_name" class="m-0 text-muted font-weight-light">${f.facility_name}</h3>

								<p id="facility_addr" class="mt-3">
									<i class="fa fa-map-marker-alt text-primary"></i>
									${f.facility_addr}
								</p>



							</div>
							<div class="row mb-5">

								<div class="col">
									<div class="card card-profile text-center px-3">
										<span class="mb-1 text-primary"><i
											class="far fa-clock-o"></i></span>
										<h3 class="mb-0">15:00</h3>
										<p class="text-muted">체크인</p>
									</div>
								</div>
								<div class="col">
									<div class="card card-profile text-center px-3">
										<span class="mb-1 text-warning"><i
											class="far fa-clock-o"></i></span>
										<h3 class="mb-0">12:00</h3>
										<p class="text-muted">체크아웃</p>
									</div>
								</div>

							</div>
							<div id="map" class="ml-5" style="width: 500px; height: 200px;"></div>
						</div>


						<div>
							<div class="table-responsive">
								<table class="table table-xs mb-0">
									<thead>
										<tr>
											<th>객실정보</th>

											<th>조건</th>

											<th>예약가능여부</th>
											<th class="text-right">1박총요금(부가세/봉사료 포함)</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="r" items="${listRoom}">
											<tr>
												<td class="d-flex align-items-center">
													<input type="hidden" id="rm_no_asd" value="${r.rm_no}"> 
													<img src="${r.rm_pic}" class="mr-3" height="94" width="168">
													<div class="media-body">
														<h5 id="rm_name">${r.rm_name}</h5>
														<p class="mb-0">${r.rm_info}</p>
													</div>
												</td>

												<td><span>${r.rm_max}</span></td>

												<td><i class="fa fa-circle text-success  mr-2"></i>예약가능
												</td>
												
												<td class="text-right">
													<h4 id="rm_cost" class="font-weight-light my-4">
														<i class="fa fa-won"></i> ${r.rm_cost}
													</h4> <!-- reserveModal start -->
													<div class="bootstrap-modal">
														<a id="reserveBtn${r.rm_no }" href="#"
															class="label gradient-1 text-white" data-toggle="modal"
															data-target=".bd-example-modal-lg"><i
															class="fa fa-check"></i> 지금 바로 예약 </a>

														<div id="reserveModal"
															class="modal fade bd-example-modal-lg" tabindex="-1"
															role="dialog" style="display: none;" aria-hidden="true">
															<div class="modal-dialog modal-lg">
																<div class="modal-content text-left">

																	<div class="modal-body my-3">
																		<div class="col-lg-12">
																			<div class="card">
																				<div class="card-body">
																					<h3 class="mb-4">예약 정보</h3>
																					<div class="basic-form">
																						<form name="reserveForm">
																							<div class="form-row">
																								<div class="form-group col-md-6">
																									<label>체크인</label> 
																									<input id="chk_check_in" name="check_in" type="date" class="form-control">
																								</div>
																								<div class="form-group col-md-6">
																									<label>체크아웃</label> 
																									<input id="chk_check_out" name="check_out" type="date" class="form-control">
																								</div>
																								
																							</div>
																							<div class="form-group">
																								<label>숙박기간</label> 
																								<input id="chk_nights" name="nights" type="number" class="form-control">
																							</div>
																							<!-- <div><button type="button" id="chk_money">예약 금액 확인하기</button></div> -->
																							<div class="form-row">
																							<button id="chk_money" type="button" class="btn-danger p-2 h-50 btn ml-1 mb-5">숙박기간변경</button>
																							</div>
																							<div class="form-row">
																								<div class="form-group col-md-6">
																									<label>호텔/지역</label> 
																									<input name="facility_info" type="text" class="form-control">
																								</div>
																								<div class="form-group col-md-6">
																									<label>객실명</label>
																									<input name="rm_no" type="hidden"> <input name="rm_name" type="text" class="form-control">
																								</div>
																							</div>
																							<div class="form-row">
																								<div class="form-group col-md-6">
																									<label>객실수</label> 
																									<input name="rm_opt" type="number" class="form-control" readonly="readonly">

																								</div>
																								<div class="form-group col-md-6">
																									<label>1박당 가격</label> 
																									<input id="chk_rm_cost" name="rm_cost" type="number" class="form-control" readonly="readonly">
																								</div>
																							</div>
																							<div class="form-row">
																								<div class="form-group col-md-6">
																									<label>인원수</label> 
																									<input name="human_num" type="number" class="form-control">

																								</div>
																								<div class="form-group col-md-6">
																									<label>동반 반려동물수</label> 
																									<input name="pet_num" type="number" class="form-control">
																								</div>
																							</div>

																							<div class="form-row">

																								<div class="form-group col-md-6">
																									<label>아이디</label> 
																									<input name="user_id" type="text" value="${my.user_id}" class="form-control">
																								</div>
																								<div class="form-group col-md-6">
																									<label>예약자 이름</label> 
																									<input name="name" type="text" value="${my.name }" class="form-control">
																								</div>


																							</div>

																							<div class="form-row">
																								<div class="form-group col-md-6">
																									<label>이메일</label> 
																									<input name="email" type="text" value="${my.email }" class="form-control">
																								</div>
																								<div class="form-group col-md-6">
																									<label>연락처</label> 
																									<input name="tel" type="text" value="${my.tel }" class="form-control">
																								</div>


																							</div>
																							<!-- 동일인 체크 영역 start -->
																							<div class="d-flex align-items-center mt-2">
																							    <div class="mr-3 text-primary">예약자가 투숙객 정보와 동일합니까?</div>
																							    <div class="form-check form-check-inline">
													                                                <label class="form-check-label">
													                                                    <input name="same" type="checkbox" class="form-check-input" value="">예약자 정보와 동일</label>
													                                            </div>
																							    
																							</div>
																							<!-- 동일인 체크 영역 end -->
																							<h3 class="mt-5 mb-4 border-top pt-4">투숙객 정보</h3>
																							<div class="form-row">
																								<div class="form-group col-md-6">
																									<label>이름</label>
																									 <input id="guest_name" name="guest_name" type="text" class="form-control">
																								</div>
																								<div class="form-group col-md-6">
																									<label>연락처</label> 
																									<input id="guest_tel" name="guest_tel" type="text" class="form-control">
																								</div>
																


																							</div>
																							<h3 class="my-4">예약내역 확인</h3>
																							<div class="form-row">
																								<div class="form-group col-md-6">
																									<label>총예약금액</label> 
																									<input id="chk_rsv_price" name="rsv_price" type="number" class="form-control" readonly="readonly">
																								</div>

																							</div>

																						</form>
																					</div>
																				</div>
																			</div>
																		</div>


																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-secondary"
																			data-dismiss="modal">취소</button>
																		<button id="reserveSubmit" type="button"
																			class="btn btn-primary">제출</button>
																	</div>
																</div>
															</div>
														</div>


													</div> <!-- reserveModal end -->

												</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
							<!-- another card start -->
							<div class="card mt-5">
								<c:set var="count" value="${countReview}"></c:set>
								<h5 class="font-weight-normal card-title pt-5 pl-4 text-muted">
									전체 리뷰 (
									<c:out value="${count}" />
									)
								</h5>
								<c:forEach items="${listReview}" var="l">
									<div class="row mr-2">
										<div class="card-body col-xl-12 d-flex">
											<div class="d-flex flex-column mt-2 col-xl-2">
												<div class="d-flex align-items-center mb-2">
													<c:set var="grade" scope="session" value="${l.r_grade}"></c:set>
													<c:choose>
														<c:when test="${grade == 5}">
															<i class="ml-1 far fa-smile fa-5x"
																style="color: #ffcc36;"></i>
														</c:when>
														<c:when test="${grade == 4}">
															<i class="ml-1 far fa-smile fa-5x"
																style="color: #ffcc36;"></i>
														</c:when>
														<c:when test="${grade == 3}">
															<i class="ml-1 far fa-meh fa-5x" style="color: #ffcc36;"></i>
														</c:when>
														<c:when test="${grade == 2}">
															<i class="ml-1 far fa-frown fa-5x"
																style="color: #ffcc36;"></i>
														</c:when>
														<c:otherwise>
															<i class="ml-1 far fa-frown fa-5x"
																style="color: #ffcc36;"></i>
														</c:otherwise>
													</c:choose>

													<p class="font-weight-light ml-4 mt-2">${l.user_id}</p>
												</div>
											</div>
											<div class="d-flex flex-column col-xl-10 ml-2">
												<div
													class="mb-1 d-flex align-items-baseline pt-3 px-1 justify-content-between">
													<div class="d-flex align-items-baseline">
														<div class="d-flex align-items-baseline">
															<h3 class="text-primary">${l.r_grade}</h3>
															<p class="ml-2 font-weight-light small text-primary">/
																5</p>
															<c:set var="grade" scope="session" value="${l.r_grade}"></c:set>
															<c:choose>
																<c:when test="${grade == 5}">
																	<span class=" ml-3">좋음</span>
																</c:when>
																<c:when test="${grade == 4}">
																	<span class=" ml-3">괜찮음</span>
																</c:when>
																<c:when test="${grade == 3}">
																	<span class=" ml-3">보통</span>
																</c:when>
																<c:when test="${grade == 2}">
																	<span class=" ml-3">별로</span>
																</c:when>
																<c:otherwise>
																	<span class=" ml-3">나쁨</span>
																</c:otherwise>
															</c:choose>
														</div>
													</div>
													<div class="d-flex flex-column">
														
														<span class="small text-right"> 
														<fmt:formatDate
																var="dateTempParse" pattern="yyyy-MM-dd"
																value="${l.r_update_date}" /> 
															<c:out
																value="${dateTempParse}" />
														</span>
													</div>
												</div>

												<p class="font-weight-light ml-1">${l.review_content}</p>
											</div>
										</div>
									</div>
								</c:forEach>

								<!-- review modal start -->
								<div class="bootstrap-modal text-center pb-5">
									<!-- Modal Trigger -->
									<a class="my-4 pb-3" href="#" data-toggle="modal"
										data-target="#reviewModal" data-placement="top" title=""
										data-original-title="리뷰쓰기">
										<i class="fa fa-paper-plane m-r-5"></i> 리뷰쓰기 </a>
									<!-- Modal -->
									<div class="modal fade" id="reviewModal" style="display: none;" aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content text-left">
												
												<div class="modal-body">
													<div class="basic-form p-3">
													
														<form name="reviewForm">
															<div class="form-group mb-5">
																<h3 class="mb-4 font-weight-light">숙소에 대한 전반적인 평가</h3>
																<div class='rating-stars'>
																	<ul id='stars'>
																		<li class='star' title='Poor' data-value='1'>
																		<i class='fa fa-star fa-fw'></i></li>
																		<li class='star' title='Fair' data-value='2'>
																		<i class='fa fa-star fa-fw'></i></li>
																		<li class='star' title='Good' data-value='3'>
																		<i class='fa fa-star fa-fw'></i></li>
																		<li class='star' title='Excellent' data-value='4'>
																			<i class='fa fa-star fa-fw'></i>
																		</li>
																		<li class='star' title='WOW!!!' data-value='5'>
																		<i class='fa fa-star fa-fw'></i></li>
																	</ul>
																</div>
																<div class="success-box">
																	<div class="clearfix"></div>
																	<img alt="tick image" width="32" src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeD0iMHB4IiB5PSIwcHgiIHZpZXdCb3g9IjAgMCA0MjYuNjY3IDQyNi42NjciIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDQyNi42NjcgNDI2LjY2NzsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHdpZHRoPSI1MTJweCIgaGVpZ2h0PSI1MTJweCI+CjxwYXRoIHN0eWxlPSJmaWxsOiM2QUMyNTk7IiBkPSJNMjEzLjMzMywwQzk1LjUxOCwwLDAsOTUuNTE0LDAsMjEzLjMzM3M5NS41MTgsMjEzLjMzMywyMTMuMzMzLDIxMy4zMzMgIGMxMTcuODI4LDAsMjEzLjMzMy05NS41MTQsMjEzLjMzMy0yMTMuMzMzUzMzMS4xNTcsMCwyMTMuMzMzLDB6IE0xNzQuMTk5LDMyMi45MThsLTkzLjkzNS05My45MzFsMzEuMzA5LTMxLjMwOWw2Mi42MjYsNjIuNjIyICBsMTQwLjg5NC0xNDAuODk4bDMxLjMwOSwzMS4zMDlMMTc0LjE5OSwzMjIuOTE4eiIvPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8L3N2Zz4K">
																	<div class="text-message"></div>
																	<div class="clearfix"></div>
																</div>

																<input name="user_id" type="hidden" value="${my.user_id}"> 
																<input id="ratingValue" name="r_grade" type="hidden" class="form-control input-default">
															</div>
															<div class="form-group">
																<h5 class="font-weight-light mb-3">숙소 서비스에 만족하셨나요?</h5>
																<textarea class="form-control input-default h-150px" rows="6" id="comment" name="review_content"></textarea>
															</div>
														</form>
													</div>


												</div>

												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">닫기</button>
													<button id="reviewSubmit" type="button"
														class="btn btn-primary">등록</button>
												</div>

											</div>
										</div>
									</div>
								</div>
								<!-- review modal end -->
							</div>
							<!-- another card end -->
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	

</body>
</html>
<script>

					var facility_addr = document.getElementById('facility_addr').innerText;
					var facility_name = document.getElementById('facility_name').innerText;
                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                              mapOption = {
                                        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                        level: 3 // 지도의 확대 레벨
                              };

                    // 지도를 생성합니다    
                    var map = new kakao.maps.Map(mapContainer, mapOption);

                    // 주소-좌표 변환 객체를 생성합니다
                    var geocoder = new kakao.maps.services.Geocoder();

                    // 주소로 좌표를 검색합니다
                    geocoder.addressSearch(facility_addr, function (result, status) {

                              // 정상적으로 검색이 완료됐으면 
                              if (status === kakao.maps.services.Status.OK) {

                                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                                        // 결과값으로 받은 위치를 마커로 표시합니다
                                        var marker = new kakao.maps.Marker({
                                                  map: map,
                                                  position: coords
                                        });

                                        // 인포윈도우로 장소에 대한 설명을 표시합니다
                                        var infowindow = new kakao.maps.InfoWindow({
                                                  content: '<div style="width:150px;text-align:center;padding:6px 0;">'+facility_name+'</div>'
                                        });
                                        infowindow.open(map, marker);

                                        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                        map.setCenter(coords);
                              }
                    });
                    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
                    var zoomControl = new kakao.maps.ZoomControl();
                    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);





                    // 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
                    kakao.maps.event.addListener(map, 'center_changed', function () {

                              // 지도의  레벨을 얻어옵니다
                              var level = map.getLevel();

                              // 지도의 중심좌표를 얻어옵니다 
                              var latlng = map.getCenter();

                              var message = '<p>지도 레벨은 ' + level + ' 이고</p>';
                              message += '<p>중심 좌표는 위도 ' + latlng.getLat() + ', 경도 ' + latlng.getLng() + '입니다</p>';

                              var resultDiv = document.getElementById('result');
//                               resultDiv.innerHTML = message;

                    });

          </script>
<%@include file="../footer.jsp"%>
