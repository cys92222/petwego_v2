<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pet we go | 결제</title>
<!-- 민아) 5/22, 결제 서비스 구현 완료 -->
<!-- 민아) 5/23, 결제 성공/실패 메시지 처리  -->
<!-- 민아) 5/31, 결제 페이지 부트스트랩 적용해야함  -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
$(function(){
	// 아임포트 깃 허브
	// https://github.com/iamport/iamport-manual/blob/master/%EC%9D%B8%EC%A6%9D%EA%B2%B0%EC%A0%9C/README.md
	
	var IMP = window.IMP; 		// 생략가능
	IMP.init('imp32514763');   // 내정보에 있는 "가맹점 식별코드"를 사용	
	
	var info = [];	//결제 정보를 담기 위한 전역변수 

	$("#okay").click(function(){

		var imp_uid = $("#imp_uid").val();
		var merchant_uid = $("#merchant_uid").val();
		var paid_amount = $("#paid_amount").val();
		var pay_method = $("#pay_method").val();
		var apply_num = $("#apply_num").val();
		var status = $("#status").val();
		var rsv_no = $("#rsv_no").val();
		var user_id = $("#user_id").val();

		// 실제 여행가는 사람이 아닌 사이트에 가입된 회원 정보가 넘어감 
		var buyer_tel = $("#tel").val();
		var buyer_addr = $("#address").val();
		var buyer_email = $("#email").val();

		// 예약할 방이름, 숙소이름 , 가격
		var rm_name = $("#rm_name").val();
		var facility_name = $("#facility_name").val();
		var rsv_price = $("#rsv_price").val();

 /*
	pay_method/String/결제수단			merchant_uid/String/고유주문번호
	name/String/주문명(16자이내)		amount/int/결제할금액 
	buyer_name/string/주문자명			buyer_tel/string/주문자 연락처
	buyer_email/string/주문자 Email		buyer_addr/string/주문자 주소
 */
			
		IMP.request_pay({
			pg : 'html5_inicis.PetWeGo',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : facility_name +'('+ rm_name +')',
			amount : rsv_price,
			buyer_email : buyer_email,
			buyer_name : user_id,
			buyer_tel : buyer_tel,
			buyer_addr : buyer_addr,		    
			}, function(rsp) {

				console.log(rsp);
				/*	rsp 속성 중 
				pay_method/string/결제수단	card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
				paid_amount/number/결제금액	실제 결제승인된 금액이나 가상계좌 입금예정 금액
				status/string/결제상태	ready(미결제), paid(결제완료), cancelled(결제취소, 부분취소포함), failed(결제실패)
				name/string/주문명	
				buyer_name/string/주문자 이름	
				paid_at/number/결제승인시각	UNIX timestamp
				apply_num/string/카드사 승인번호	신용카드결제에 한하여 제공
				*/

			// payment 테이블에 들어갈 내용들 
			var payInfo = {
					imp_uid : rsp.imp_uid,
					merchant_uid : rsp.merchant_uid,
	                paid_amount : rsp.paid_amount,
	                pay_method : rsp.pay_method,
	                apply_num : rsp.apply_num,
	                status : rsp.status,
	                user_id : rsp.buyer_name,  
	                rsv_no : rsv_no
				}

				console.log("결제후: "+ payInfo)
				info.push(payInfo);
				
			    if ( rsp.success ) {// 결제가 성공되었다면
    	            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기

			        var insertPay = $("#payForm").serialize();

					console.log(JSON.stringify(info));
					alert(rsv_no);
					// db에 결제정보 저장을 위해 ajax 통신(마이페이지-결제내역에서 확인되도록)
					$.ajax({
						type : "POST",
						dataType : "JSON",
						url : "/payments/insertPay",
						beforeSend: function(xhr){
							xhr.setRequestHeader(header, token);
						},
	    	            contentType:"application/json; charset=utf-8",
	    	            data : JSON.stringify(info),	//json데이터의 "key":"value" 형태의 패턴을 인식을 위해 변환 
						success : function(done){
							console.log(done);		
						},error:function(request,status,error){
						    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}				        
					}) //ajax 통신끝 
					
					var msg = '결제가 완료되었습니다.'+"\n";
                    	msg += '주문자명 : ' + rsp.buyer_name +"\n";
                    	msg += '주문자 연락처 : ' + rsp.buyer_tel+"\n";
                    	msg += '결제수단 : ' + rsp.pay_method+"\n";
                    	msg += '결제 금액 : ' + rsp.paid_amount+"\n";
                    	msg += '카드 승인번호 : ' + rsp.apply_num+"\n";
						msg += '자세한 예약(결제) 정보는 마이페이지에서 확인가능합니다.';
						
				// 결제성공시 이동할 페이지
    	       location.href='http://localhost:8088/MainPage';
			    } else {
			        var msg = '결제에 실패하였습니다.'+"\n";
			        msg += '에러내용 : '+"\n";	
			        msg +=  '[[' + rsp.error_msg + ']]';
			        // rsp.error_msg 결제처리에 실패한 경우 상세메세지
			        // 잔액부족이라던지 비밀번호 입력횟수 초과 등등 
			    }

 			    alert(msg);
			});	//function(rsp) 끝
	})	//결제하기 버튼 동작 끝


})
  

</script>
</head>
<body>
	<h1>결제 하시겠습니까?</h1>
	<button type="button" id='okay'>결제하기</button>
	
	<!-- 결제정보 전달을 위한 폼  -->
	<form action="/payments/insertPay" id="payForm" method="post">
	<input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		imp_uid<input type="hidden"imp_uid" name="imp_uid"  />
		merchant_uid<input type="hidden" id="merchant_uid" name="merchant_uid"  />		
		pay_method<input type="hidden" id="pay_method" name="pay_method"  />
		apply_num<input type="hidden" id="apply_num" name="apply_num"  />	
		status<input type="hidden" id="status" name="status"  />
		paid_amount<input type="hidden" id="paid_amount" name="paid_amount"  />
		
		<!-- 가져와야 하는 값 예약번호, 아이디  -->
		예약번호<input type="hidden" id="rsv_no" name="rsv_no" value="${to.rsv_no }"/><br>
		회원 아이디<input type="hidden" id="user_id" name="user_id"  value="${my.user_id }"/><br>
	</form>
	
	
		회원 이메일 <input type="hidden" id="email" value="${my.email }"/><br>
		회원 주소 <input type="hidden" id="address" value="${my.address }"/><br>
		회원 전화번호<input type="hidden" id="tel" value="${my.tel }"/><br>
				
		투숙객이름<input type="text" value="${to.guest_name }"><br>
		투숙객전화번호<input type="text" value="${to.guest_tel }"> <br>
		
		방이름<input type="text" id="rm_name" value="${room.rm_name }"><br>
		호텔이름<input type="text" id="facility_name" value="${Facility.facility_name }"><br>
		
		가격<input type="text" id="rsv_price" value="${to.rsv_price }"><br>
		
</body>
<%@ include file="../footer.jsp" %>
</html>