<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>결제 상세정보</h2>
<hr>
	카드승인 번호는 카카오페이등의 간편결제를 이용할경우 보여지지 않습니다.
<h2>${detail_pay.user_id }님의 결제내역입니다</h2>  
	<table border="1">
	<tr>
		<th>고유결제번호</th><th>상점거래id</th><th>결제금액</th><th>결제수단</th><th>카드승인번호</th><th>결제승인시각</th><th>결제상태</th><th>예약번호</th><th>아이디</th>
	</tr>
		<tr>
			<td>${detail_pay.imp_uid }</td>
			<td>${detail_pay.merchant_uid }</td>
			<td>${detail_pay.paid_amount }</td>
			<td>${detail_pay.pay_method }</td>
			<td>${detail_pay.apply_num }</td>
			<td>${detail_pay.paid_time }</td>
			<td>${detail_pay.status }</td>
			<td>${detail_pay.rsv_no }</td>
			<td>${detail_pay.user_id }</td>
		</tr>
	</table>
</body>
</html>