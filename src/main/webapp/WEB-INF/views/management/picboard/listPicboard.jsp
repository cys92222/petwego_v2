<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

</script>
<body>
	<br>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">SNS게시판</h1>
		<p class="mb-4">SNS게시판 | 관리자접속중</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<div class="card-body">
					
					<c:forEach items="${fileList }" var="pic" varStatus="status">
						<!-- Basic Card Example -->
						<div class="card shadow mb-4" style="width: 300px; text-align: center; float: left;" >
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">${boardList[status.index].user_id }</h6>
							</div>
							<a href="/management/picboard/detailPicboard?photo_no=${pic.photo_no }">
							<div class="card-body">
								<img src="../../img/${pic.photo_file_name }" width="200px" height="200px">
							</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

</body>
<%@include file="../footer.jsp"%>
</html>