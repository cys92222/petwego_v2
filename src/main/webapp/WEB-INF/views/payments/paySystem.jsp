<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pet we go | 결제</title>
<!-- 민아) 5/22, 결제 서비스 구현 완료 -->
<!-- 민아) 5/23, 결제 성공/실패 메시지 처리해야함  -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js" ></script>
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
			name : '주문명:뫄뫄 애견 펜션',
			amount : 100,
			buyer_email : 'acs@petwego.kr',
			buyer_name : user_id,
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울시 서대문구'
				    
			}, function(rsp) {

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
	                rsv_no : 1,
	                user_id : rsp.buyer_name  
				}
			
				info.push(payInfo);
				
			    if ( rsp.success ) {// 결제가 성공되었다면
    	            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기

			        var insertPay = $("#payForm").serialize();

					console.log(JSON.stringify(info));

					// db에 결제정보 저장을 위해 ajax 통신(마이페이지-결제내역에서 확인되도록)
					$.ajax({
						type : "POST",
						url : "/payments/insertPay",
						dataType : "JSON",
						beforeSend: function(xhr){
							xhr.setRequestHeader(header, token);
						},
	    	            contentType:"application/json; charset=utf-8",
	    	            data : JSON.stringify(info),	//json데이터의 "key":"value" 형태의 패턴을 인식을 위해 변환 
						success : function(done){
							console.log(done);		
						}				        
					}) //ajax 통신끝 
					
					var msg = '결제가 완료되었습니다.'+"\n";
                    	msg += '주문자명 : ' + rsp.buyer_name +"\n";
                    	msg += '주문자 연락처 : ' + rsp.buyer_tel+"\n";
                    	msg += '결제수단 : ' + rsp.pay_method+"\n";
                    	msg += '결제 금액 : ' + rsp.paid_amount+"\n";
                    	msg += '카드 승인번호 : ' + rsp.apply_num+"\n";

				// 결제성공시 이동할 페이지
    	       // location.href='http://localhost:8088/MainPage';
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
	<button id='okay'>결제하기</button>
	
	<!-- 결제정보 전달을 위한 폼  -->
	<form action="/payments/insertPay" id="payForm" method="post">
	<input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="imp_uid" name="imp_uid"  />
		<input type="hidden" id="merchant_uid" name="merchant_uid"  />
		<input type="hidden" id="paid_amount" name="paid_amount"  />
		<input type="hidden" id="pay_method" name="pay_method"  />
		<input type="hidden" id="apply_num" name="apply_num"  />	
		<input type="hidden" id="status" name="status"  />
		<input type="hidden" id="rsv_no" name="rsv_no"  />
		<input type="hidden" id="user_id" name="user_id"  />
	</form>

</body>
</html>