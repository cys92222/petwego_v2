<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<!DOCTYPE html>
<!-- 민아) 5/25, 관리자페이지 꾸미기 및 정리 중  -->
<%@include file="../header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("#btnInsert").click(function(){
			self.location = "/management/notice/insertNotice"
		})
	}) 
</script>

</head>
<body>
<br>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">공지사항</h1>
		<p class="mb-4">공지사항 | 관리자접속중</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
				<!-- 글쓰기 버튼  -->
				<sec:authorize access="hasRole('ROLE_ADMIN')"> 
				<a href="#" class="btn btn-secondary btn-icon-split" id="btnInsert">
		       		<span class="icon text-white-50">
		        		<i class="fas fa-arrow-right"></i>
		        	</span>
		        	<span class="text">공지등록|관리자</span>
	       		</a>
				</sec:authorize>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center;">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>조회수</th>
								<th>날짜</th>
								<th>담당자번호</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>조회수</th>
								<th>날짜</th>
								<th>담당자번호</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="notice" items="${listNotice }">
							<tr>
								<td><c:out value="${notice.notice_no }"/></td>
								<td><a href="/management/notice/detailNotice?notice_no=${notice.notice_no}">
									<c:out value="${notice.notice_title }"/>
								</a></td>
								<td><c:out value="${notice.notice_hit }"/></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.notice_date }"/></td>
								<td><c:out value="${notice.cs_no }"/></td>
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