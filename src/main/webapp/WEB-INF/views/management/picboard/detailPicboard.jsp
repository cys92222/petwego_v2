<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<!-- 픽보드 상세보기 -->
	<%-- ${pb }<br> --%>

	<!-- 픽보드파일 상세보기 -->
	<%-- ${pbf }<br> --%>

	<!-- 댓글목록 -->
	<%-- ${pbc } --%>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">SNS게시판</h1>
		<p class="mb-4">SNS게시판 | 관리자접속중</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<div class="card-body" style="text-align: center;">
					<p class="text-lg">
					작성자 ${pb.user_id }   작성일 <fmt:formatDate pattern="yyyy-MM-dd" value="${pb.photo_date }" />
					</p>
					<p><img src="../../img/snsImg/${pbf.photo_file_name }" width="300px" height="300px"></p>
					
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<!-- 글 삭제 버튼 -->
						<a href="/management/picboard/deletePicboard?photo_no=${pb.photo_no }"
						   	class="btn btn-danger btn-icon-split" id="btnDelete"
							style="float: left;"> <span class="icon text-white-50">
								<i class="fas fa-trash"></i>
						</span> <span class="text">SNS삭제 | 관리자</span>
						</a>
					</sec:authorize>
					</div>
					<br>
					<!-- 댓글 목록-->
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">댓글목록</h6>
					</div>
					<table id="comm_list" class="table table-bordered" border="1" width="80%" style="text-align: center;">
						<th>내용</th><th>작성일</th><th>아이디</th><th>비고</th>
						<tbody>
						<c:forEach items="${pbc }" var="pbc">
							<tr>
								<td>${pbc.photo_comm_cont }</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${pbc.photo_comm_date }" /></td>
								<td>${pbc.user_id }</td>
								<td><a
									href="/management/picboard/picboardcomment_delete?photo_comm_no=${pbc.photo_comm_no }&photo_no=${pbc.photo_no}"
									class="btn btn-danger btn-circle"> <i class="fas fa-trash"></i>
								</a></td>
							</tr>	
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>	
</body>
<%@include file="../footer.jsp"%>
</html>