<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!-- 민아) 5/27, 관리자페이지 회원결제목록 -->
<%@include file="../header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">회원관리</h1>
		<p class="mb-4">회원관리 | 관리자접속중</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">회원 결제정보</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0" style="text-align: center;">
						<thead>
							<tr>
								<th>아이디</th>
								<th>예약번호</th>
								<th>고유결제번호</th>
								<th>상점거래ID</th>
								<th>결제금액</th>
								<th>결제상태</th>
								<th>결제승인시각</th>	
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>아이디</th>
								<th>예약번호</th>
								<th>고유결제번호</th>
								<th>상점거래ID</th>
								<th>결제금액</th>
								<th>결제상태</th>
								<th>결제승인시각</th>		
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="pay" items="${listPay }">
							<tr>
								<td><c:out value="${pay.user_id }"/></td>
								<td><c:out value="${pay.rsv_no }"/></td>
								<td><c:out value="${pay.imp_uid }"/></td>
								<td><c:out value="${pay.merchant_uid }"/></td>
								<td><c:out value="${pay.paid_amount }"/></td>
								<td><c:out value="${pay.status }"/></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pay.paid_time }"/></td>						
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
<%@include file="../footer.jsp"%>
</html>