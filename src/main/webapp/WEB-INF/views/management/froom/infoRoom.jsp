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
              <div class="card-body">
             	<c:forEach var="info" items="${infoRoom }" begin="1" end="1">

                    <div class="media media-reply">

                                        <div class="media-body">


                                                  <div class="media align-items-center">



                                                            <div class="col-xl-4">
                                                                      <img class="rounded" src="${info.f_pic }" width="330" height="330">
                                                            </div>


                                                            <div class="col-xl-5 pt-3 border-right">
                                                                      <div class="mb-3">

    <div>
              <h3 class="text-dark mb-4">${info.facility_name }</h3>

              <h6 class="text-muted font-weight-light">
                         ${info.facility_addr }</h6>


    </div>
</div>
    <p class="mb-2 pl-2 pb-3 font-weight-light"><i class="fab fa-whatsapp text-primary"></i> ${info.f_phone }</p>                                                                  
   <h6 class="mb-3 pl-2">${info.f_checkin } | ${info.f_checkout }</h6>
   <p class="mb-2 p-2 font-weight-light text-muted small">${info.f_feature }</p> 
    
                                                            </div>


                                                            
                                                            <div class="col-xl-3 text-center">

                                                                      <h5 class="mb-3">￦${info.f_minprice }~</h5>


                                                            </div>
                                                  </div>
                                        </div>
                              </div>
                    </c:forEach>
                  </div> 
         </div>


		<!-- Collapsable Card Example -->
		<div class="card shadow mb-4">
			<c:forEach var="info" items="${infoRoom }">
				<a href="#go${info.rm_no }" class="d-block card-header py-3"
					data-toggle="collapse" role="button" aria-expanded="true"
					aria-controls="${info.rm_no }">

					<h6 class="m-0 font-weight-bold text-primary">
    					<c:out value="${info.rm_no }" /><span class="ml-1 font-weight-light"><c:out value="${info.rm_name }" /></span>
					</h6>
				</a>

				<div class="align-items-center collapse show" id="go${info.rm_no }">
                    <div class="card-body">



                        <div class="media media-reply">

                             <div class="media-body">


                                       <div class="media align-items-center">



                                                 <div class="col-xl-3">
                                                           <img class="rounded" src="${info.rm_pic }" width="250" height="250">
                                                 </div>


                                                 <div class="col-xl-4 ml-3">
                                                           <div class="mb-4">

                                                                     <div>
                                                                               
                                                                               <h5 class="text-muted font-weight-light">
                                                                                         <i class="fas fa-user-friends text-primary"></i>
                                                                                         <c:out value="${info.rm_max }" /></h5>

                                                                     </div>
                                                           </div>
                                                           <h6 class="mb-3 font-weight-light">
                                                                     <c:out value="${info.rm_info }" /></h6>

                                                 </div>


                                                 <div class="col-xl-2 text-right">
                                                     
	                                                 <c:choose>
										
													    <c:when test="${info.rm_ok==1}">
													        <h5 class="btn btn-danger">예약가능</h5>
													    </c:when>

													    <c:when test="${info.rm_ok==0}">
													        <h5 class="btn btn-warning">예약마감</h5>
													    </c:when>
																									
													</c:choose>

                                                 </div>
                                                 
                                                 <div class="col-xl-3 text-center">

                                                           <h4 class="mb-3 text-dark">￦${info.f_minprice }</h4>


                                                 </div>
                                       </div>
                             </div>
                        </div>

                    </div>
          </div>
			</c:forEach>
		</div>
		

	
</body>
<%@include file="../footer.jsp"%>
</html>