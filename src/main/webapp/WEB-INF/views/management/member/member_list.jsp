<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 민아) 5/25, 관리자페이지 꾸미기 및 정리 중  -->
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
				<h6 class="m-0 font-weight-bold text-primary">회원목록</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0" style="text-align: center;">
						<thead>
							<tr>
								<th>아이디</th>
								<th>전화번호</th>
								<th>이름</th>
								<th>닉네임</th>
								<th>가입일자</th>
								<th>정보수정일</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>아이디</th>
								<th>전화번호</th>
								<th>이름</th>
								<th>닉네임</th>
								<th>가입일자</th>
								<th>정보수정일</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="member" items="${listMember }">
							<tr>
								<td><a href="/management/member/member_get?user_id=${member.user_id}">
									<c:out value="${member.user_id }"/>
								</a></td>
								<td><c:out value="${member.tel }"/></td>
								<td><c:out value="${member.name }"/></td>
								<td><c:out value="${member.nick_name }"/></td>
								<td><c:out value="${member.info_create_date }"/></td>
								<td><c:out value="${member.info_update_date }"/></td>
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