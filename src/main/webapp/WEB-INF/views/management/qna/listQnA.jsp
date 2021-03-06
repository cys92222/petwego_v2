<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

</script>
</head>
<body>
<br>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">QnA</h1>
		<p class="mb-4">QnA | 관리자접속중</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">QnA</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered table-hover" id="ok" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>날짜</th>
								<th>카테고리</th>
								<th></th> <!--정렬 강제로 끄게하려고 일부로 만들었음  -->
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>날짜</th>
								<th>카테고리</th>
<!-- 								<th></th> 정렬 강제로 끄게하려고 일부로 만들었음  -->
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="QnA" items="${listQnA }">
							<tr onclick="location.href='/management/qna/detailQnA?inq_no=${QnA.inq_no}'">
								<td><c:out value="${QnA.inq_no }"/></td>
								
								
<%-- 								<td><c:out value="${QnA.inq_title }"/></td> --%>


								<td>
									<c:choose> 
									
										<c:when test = "${QnA.ref_level > 0}">
										<c:forEach begin="0" end="${QnA.ref_level}">
											<c:out value="&nbsp;&nbsp;&nbsp;&nbsp;" escapeXml="false"/> 
										</c:forEach>	
<!-- 											<img src="../../adminImg/re2.png"> -->
											<img src="../../adminImg/re4.png">
											<c:out value="${QnA.inq_title }"/>
										</c:when> 
										
										<c:otherwise>
											<c:out value="${QnA.inq_title }"/>
										</c:otherwise> 
									
									</c:choose>
								</td>
								
								
								<td>${QnA.inq_date }</td>
								<td><c:if test="${QnA.cs_no ==  1}">
										<c:out value="홈페이지 이용 관련"/>
									</c:if>
									
									<c:if test="${QnA.cs_no ==  2}">
										<c:out value="계정 관련"/>
									</c:if>
									
									<c:if test="${QnA.cs_no ==  3}">
										<c:out value="결제 관련 관련"/>
									</c:if>
								</td>
<!-- 								<td></td> -->
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