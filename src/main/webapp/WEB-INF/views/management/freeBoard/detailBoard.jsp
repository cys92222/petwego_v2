<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){

		var board_no = $("#board_no").val();

		// 삭제버튼 누르면...
		$("#btnDelete").click(function(){
			var check = confirm("게시판글을 삭제하시겠습니까?")
			if(check == true){
				self.location = "/management/freeBoard/deleteBoard?board_no="+board_no;
				alert("게시글을 삭제했습니다!");
			}
		});
	
	})
</script>
</head>
<body>
	<br>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">게시판 관리</h1>
		<p class="mb-4">게시판관리 | 자유게시판</p>
		
		<input type="hidden" id="board_no" value="${detailBoard.board_no }">
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">자유게시판</h6>
			</div>
			<div class="card-body">
					<table class="table table-bordered" border="1" width="80%" style="text-align: center;">
						<tbody>
							<tr>
								<td>제목</td>
								<td>${detailBoard.board_title }</td>
							</tr>
							<tr>
								<td>내용</td>
								<td>${detailBoard.board_content }</td>
							</tr>
							<tr>
								<td>조회수</td>
								<td>${detailBoard.board_hit }</td>
							</tr>
							<tr>
								<td>작성일</td>	
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${detailBoard.board_date }"/></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td>${detailBoard.user_id }</td>
							</tr>
						</tbody>
					</table>
					
						<sec:authorize access="hasRole('ROLE_ADMIN')"> 
							<!-- 자유게시판 글 삭제 버튼 -->
							<a href="#" class="btn btn-danger btn-icon-split" id="btnDelete">
		       					<span class="icon text-white-50">
		        				<i class="fas fa-trash"></i>
		         				</span>
		        				<span class="text">게시글삭제 | 관리자</span>
	       					</a>
						</sec:authorize>
						<br>	
						<!-- 댓글 목록-->
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">댓글목록</h6>
						</div>
						<table id="comm_list" class="table table-bordered" border="1" width="80%" style="text-align: center;">
							<th>내용</th><th>작성일</th><th>아이디</th><th>비고</th>
							<c:forEach items="${detailComment }" var="comment">
								<tr>
									<td>${comment.comm_cont }</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${comment.comm_date }"/></td>							
									<td>${comment.user_id }</td>
									<td><a href="/management/freeBoard/commDeleteSubmit?comm_num=${comment.comm_num }&board_no=${detailBoard.board_no }">삭제</a></td>
								</tr>
							</c:forEach>
						</table>							
				</div>
			</div>
		</div>
</body>
<%@include file="../footer.jsp"%>
</html>