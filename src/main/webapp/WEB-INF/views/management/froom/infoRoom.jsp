<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
		<h1 class="h3 mb-2 text-gray-800">숙소관리</h1>
		<p class="mb-4">숙소관리 | 관리자접속중</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">숙소 상세정보</h6>
			</div>
			 <!-- Collapsable Card Example -->
              <div class="card shadow mb-4">
              <div class="card-body">
             	<c:forEach var="info" items="${infoRoom }" begin="1" end="1">
               
                  <h6 class="m-0 font-weight-bold text-primary">숙소명:<c:out value="${info.facility_name }" />&nbsp;&nbsp;||&nbsp;&nbsp;숙소번호:<c:out value="${info.facility_no }" /></h6>
                    <p>숙소주소 : <c:out value="${info.facility_addr }" /></p>
                    <p>숙소연락처 : <c:out value="${info.f_phone }" /></p>
                    <p>숙소 최저가 : <c:out value="${info.f_minprice }" /></p>
                    <p>숙소특징 : <c:out value="${info.f_feature }" /></p>
                    <p>숙소소개글 : <c:out value="${info.f_intro }" /></p>
                    <p>체크인시간 : <c:out value="${info.f_checkin }" /></p>
                    <p>체크아웃시간 : <c:out value="${info.f_checkout }" /></p>
                    <p>숙소사진 : <img src="<c:out value="${info.f_pic }" />" width="400px" height="400px"></p>
                    </c:forEach>
                  </div> 
                </div>
               
               
               
               <c:forEach var="info" items="${infoRoom }">
            
                <!-- Card Header - Accordion -->
                <a href="#${info.rm_no }" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="${info.rm_no }">
                  <h6 class="m-0 font-weight-bold text-primary">방이름:<c:out value="${info.rm_name }" />&nbsp;&nbsp; 방번호:<c:out value="${info.rm_no }" /></h6>
                </a>
                <!-- Card Content - Collapse -->
                <div class="collapse show" id="${info.rm_no }">
                  <div class="card-body">
                    This is a collapsable card example using Bootstrap's built in collapse functionality. 
                </div>
                
              </div>
              </c:forEach>
	</div>
</div>

		
</body>
<%@include file="../footer.jsp"%>
</html>