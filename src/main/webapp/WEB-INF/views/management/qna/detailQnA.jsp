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
<style type="text/css">
#anwer_Sec{
	display: none;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(function(){
		
		var inq_no = $("#inq_no").val();
		var formObj = $("form[id='anwerForm']");
		 
		// 답변버튼 누르면...
		$("#btnAnwer").click(function(){
			var check = confirm("답변을 작성하시겠습니까?")
			if(check == true){
				$("#anwer_Sec").css({"display":"block"});
			}
		});

		// 답변등록버튼 누르면
		$("#addAnwer").click(function(){
			$("#anwer_Sec").css({"display":"none"});
			formObj.submit();
			});

	})
</script>
</head>
<body>
	<br>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">QnA</h1>
		<p class="mb-4">QnA | 관리자접속중</p>
		
		<input type="hidden" id="inq_no" value="${detailQnA.inq_no }">
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">QnA</h6>
			</div>
			<div class="card-body">
					<table class="table table-bordered" border="1" width="80%" style="text-align: center;">
						<tbody>
							<tr>
								<td>제목</td>
								<td>${detailQnA.inq_title }</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td>${detailQnA.user_id }</td>
							</tr>
							<tr>
								<td>내용</td>
								<td>${detailQnA.inq_content }</td>
							</tr>

							<tr>
								<td>작성일</td>	
								<td>${detailQnA.inq_date }</td>
							</tr>
							<tr>
								<td>카테고리</td>
								<td><c:if test="${detailQnA.cs_no ==  1}">
										<c:out value="홈페이지 이용 관련"/>
									</c:if>
									
									<c:if test="${detailQnA.cs_no ==  2}">
										<c:out value="계정 관련"/>
									</c:if>
									
									<c:if test="${detailQnA.cs_no ==  3}">
										<c:out value="결제 관련 관련"/>
									</c:if>
								</td>
							</tr>
						</tbody>
					</table>
						<sec:authorize access="hasRole('ROLE_ADMIN')"> 
							<!-- 답변 버튼 -->
							<a href="#" class="btn btn-success btn-icon-split" id="btnAnwer" style="float: right">
		       					<span class="icon text-white-50">
		        				<i class="fas fa-edit"></i>
		         				</span>
		        				<span class="text">문의답변 | 관리자</span>
	       					</a>
	       					<!-- 삭제버튼 -->
	       					<a href="/management/qna/deleteQnA?inq_no=${detailQnA.inq_no}" class="btn btn-danger btn-icon-split" id="btnDelete" style="float: left;">
		       					<span class="icon text-white-50">
		        				<i class="fas fa-trash"></i>
		         				</span>
		        				<span class="text">문의글삭제 | 관리자</span>
	       					</a>
						</sec:authorize>
						
				</div>
			</div>
		</div>
		
<section id="anwer_Sec">
	<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">QnA 답변등록</h6>
			</div>
	<div class="card-body">
	<form action="/management/qna/anwerQnA" id="anwerForm">
		<input type="hidden" name="inq_no" value="${detailQnA.inq_no }"><br>
		카테고리<br>
		
		<select name="cs_no">
		<c:choose>
			<c:when test="${detailQnA.cs_no == 1 }">
				<option value="1" selected="selected">홈페이지 이용 관련</option>
			</c:when>
			
			<c:when test="${detailQnA.cs_no == 2 }">
				<option value="2" selected="selected">계정 관련</option>
			</c:when>
			
			<c:when test="${detailQnA.cs_no == 3 }">
				<option value="3" selected="selected">결제 관련 관련</option>
			</c:when>
		</c:choose>
		</select><br>
		
		제목<br>
		<input type="text" name="inq_title" value="${detailQnA.inq_title }의 답변입니다" readonly="readonly"><br>
		내용<br>
		<textarea rows="8" cols="100" name="inq_content" required="required"></textarea><br>
		<input type="hidden" name="a_ref" value="${detailQnA.ref }">
		<input type="hidden" name="a_ref_step" value="${detailQnA.ref_step }">
		<input type="hidden" name="a_ref_level" value="${detailQnA.ref_level }">
		<!-- 답변등록하기 버튼 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')"> 
				<a href="#" class="btn btn-success btn-icon-split" id="addAnwer">
		       		<span class="icon text-white-50">
		        		<i class="fas fa-edit"></i>
		        	</span>
		        	<span class="text">답변등록</span>
	       		</a>
		</sec:authorize>	
	</form>
	</div>
	
</section>

</body>
<%@include file="../footer.jsp"%>
</html>