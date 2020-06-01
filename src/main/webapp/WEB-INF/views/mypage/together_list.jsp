<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">

		<!-- End Col -->
		
		<div class="col-md-6 col-lg-3">
		<c:forEach var="to" items="${mytogether }">
		<a href="/together/detailTogether?t_num=${to.t_num}">
			<div class="card">
				<img src="../t_thumbnailUpload/${to.thumbnail}">
				<div class="card-body">
				<h4 class="card-title">함께가요 작성글</h4>
					<h5 class="card-title">제목 : ${to.t_title }</h5>
					<p class="card-text">신청인원 : ${to.t_attendee_cnt }</p>
					<p class="card-text">조회수 : ${to.t_hit }</p>
					<p class="card-text">
						<small class="text-muted">작성일 : ${to.t_date }</small>
					</p>
				</div>
			</div>
		</a>	
		</c:forEach>
		</div>
		
	</div>

<%@ include file="../footer.jsp" %>
</body>
</html>