<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- 민아) 6/2, 관리자페이지 숙소목록 -->
<%@include file="../header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {

	})
</script>
</head>
<body>
	<br>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">숙소관리</h1>
		<p class="mb-4">숙소관리 | 관리자접속중</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">관리중인 숙소목록</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0" style="text-align: center;">
						<thead>
							<tr>
								<th>숙소번호</th>
								<th>숙소명</th>
								<th>숙소주소</th>
								<th>숙소연락처</th>								
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>숙소번호</th>
								<th>숙소명</th>
								<th>숙소주소</th>
								<th>숙소연락처</th>								
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="listF" items="${listFacility }">
								<tr>
									<td><c:out value="${listF.facility_no }" /></td>
									<td>
										<a href="/management/froom/infoRoom?facility_no=${listF.facility_no  }">
										<c:out value="${listF.facility_name }" />
										</a>
									</td>
									<td><c:out value="${listF.facility_addr }" /></td>
									<td><c:out value="${listF.f_phone }" /></td>									
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