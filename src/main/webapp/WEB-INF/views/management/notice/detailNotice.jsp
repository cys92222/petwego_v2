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
<!-- 민아) 5/25, 관리자페이지 꾸미기 및 정리 중  -->
<title>Insert title here</title>

<script type="text/javascript">
	$(function(){
		 
		var notice_no = $("#notice_no").val();

		// 삭제버튼 누르면...
		$("#btnDelete").click(function(){
			var check = confirm("공지글을 삭제하시겠습니까?")
			if(check == true){
				self.location = "/management/notice/deleteNotice?notice_no="+notice_no;
				alert("게시글을 삭제했습니다!");
			}
		});

		//수정버튼
		$("#btnUpdate").click(function(){
			var check = confirm("공지글을 수정하시겠습니까?");
			if(check == true){
				self.location = "/management/notice/updateNotice?notice_no="+notice_no;
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
		<h1 class="h3 mb-2 text-gray-800">공지사항</h1>
		<p class="mb-4">공지사항 | 관리자접속중</p>
		
		<input type="hidden" id="notice_no" value="${detailNotice.notice_no }">
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
			</div>
			<div class="card-body">
					<table class="table table-bordered" border="1" width="80%" style="text-align: center;">
						<tbody>
							<tr>
								<td>제목</td>
								<td>${detailNotice.notice_title }</td>
							</tr>
							<tr>
								<td>내용</td>
								<td>${detailNotice.notice_content }</td>
							</tr>
							<tr>
								<td>조회수</td>
								<td>${detailNotice.notice_hit }</td>
							</tr>
							<tr>
								<td>작성일</td>	
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${detailNotice.notice_date }"/></td>
							</tr>
							<tr>
								<td>담당자번호</td>
								<td>${detailNotice.cs_no }</td>
							</tr>
						</tbody>
					</table>
						<sec:authorize access="hasRole('ROLE_ADMIN')"> 
							<!-- 공지삭제 버튼 -->
							<a href="#" class="btn btn-danger btn-icon-split" id="btnDelete">
		       					<span class="icon text-white-50">
		        				<i class="fas fa-trash"></i>
		         				</span>
		        				<span class="text">공지삭제|관리자</span>
	       					</a>
	       					<!-- 공지수정 버튼 -->
	       					<a href="#" class="btn btn-info btn-icon-split" id="btnUpdate">
		       					<span class="icon text-white-50">
		        				<i class="fas fa-pencil-alt"></i>
		         				</span>
		        				<span class="text">공지수정|관리자</span>
	       					</a>
						</sec:authorize>
						
				</div>
			</div>
		</div>
</body>
<%@include file="../footer.jsp"%>
</html>