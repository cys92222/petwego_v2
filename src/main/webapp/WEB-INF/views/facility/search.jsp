<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PETWEGO | 숙소</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#searchForm #searchBtn').click(function() {
		
		display = $(this).prev().find('#keywordInput').val();
		self.location = 'search' + '${pageMaker.makeQuery(1)}' + '&keyword=' + encodeURIComponent(display);
		return false;
	});
	$('.area').click(function(e){
		e.preventDefault();
		display = $(this).find('b').text();
		self.location='search' + '${pageMaker.makeQuery(1)}' + '&keyword=' + encodeURIComponent(display);
	});

	
	$('.row #type').click(function(e){
		e.preventDefault();
		display = $(this).children('p').text();
		window.location.href='search' + '${pageMaker.makeQuery(1)}' + '&keyword=' + encodeURIComponent(display);
		return false;
	});
	

	
});
</script>
    <!--Font awesome CDN-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <style type="text/css">
  
    </style>
</head>

<body>


                    <div class="container-fluid mt-2">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
          
                                   <div class="basic-form">
                                       <form id="searchForm">
								          <div class="form-row">
								                    <div class="col-lg-11 col-md-12 col-sm-12 mb-3">
								                              <input id="keywordInput" type="text" class="form-control input-default" placeholder="어디로 가시나요?">
								                    </div>
								                    <button id="searchBtn" type="submit" class="btn btn-primary col-lg-1 col-md-12 col-sm-12 my-1 h-75">검색</button>
								          </div>
                                       </form>
                                   </div>
                                </div>
                            </div>
                        </div><!--  col end -->
          			</div><!-- row end -->
                    <!-- row start-->
                    <div class="row">
                  
                    <div class="col-lg-3">
                                  <div class="card mb-5">
                                      <div class="card-body">
                                        <h6 class="font-weight-light">숙소유형으로 검색</h6>
                                       
                         <div class="row">
                                                                
                                        <div class="col-4 pt-3 pr-1">
                                            <a id="type" class="type text-center d-block text-muted" href="#">
                                                <i class="fas fa-check-circle gradient-4-text"></i>
                                                <p class="text">복층</p>
                                            </a>
                                        </div>
                                        <div class="col-4 pt-3">
                                        	<a id="type" class="type text-center d-block text-muted" href="#">
                                            	<i class="fas fa-check-circle gradient-4-text"></i>
                                                <p class="text">독채</p>
                                            </a>
                                        </div>
                                        <div class="col-4 pt-3 pl-1">
                                        	<a id="type" class="type text-center d-block text-muted" href="#">
                                            <i class="fas fa-check-circle gradient-4-text"></i>
                                                <p class="text">풀빌라</p>
                                            </a>
                                        </div>
                                                                                            
                            </div>
                            
                            <div class="row">
                                        <div class="col-4 pt-3 pr-1">
                                            <a id="type" class="text-center d-block text-muted" href="#">
                                                <i class="fas fa-check-circle gradient-4-text"></i>
                                                <p class="text">온돌</p>
                                            </a>
                                        </div>
                                        <div class="col-4 pt-3">
                                        	<a id="type" class="text-center d-block text-muted" href="#">
                                            <i class="fas fa-check-circle gradient-4-text"></i>
                                                <p>한옥</p>
                                            </a>
                                        </div>
                                        <div class="col-4 pt-3 pl-1">
                                        	<a id="type" class="text-center d-block text-muted" href="#">
                                            <i class="fas fa-check-circle gradient-4-text"></i>
                                                <p>캠핑</p>
                                            </a>
                                        </div>
                            </div>
                            <div class="row">
                                        <div class="col-4 pt-3 pr-1">
                                            <a id="type" class="text-center d-block text-muted" href="#">
                                                <i class="fas fa-check-circle gradient-4-text"></i>
                                                <p>글램핑</p>
                                            </a>
                                        </div>
                                        <div class="col-4 pt-3">
                                        	<a id="type" class="text-center d-block text-muted" href="#">
                                            <i class="fas fa-check-circle gradient-4-text"></i>
                                                <p>도미토리</p>
                                            </a>
                                        </div>
                                        <div class="col-4 pt-3 pl-1">
                                        	<a id="type" class="text-center d-block text-muted" href="#">
                                            <i class="fas fa-check-circle gradient-4-text"></i>
                                                <p>신축</p>
                                            </a>
                                        </div>
                            </div>
                        
                                          <h6 class="font-weight-light mt-5">지역명으로 검색</h6>
                                          <p class="text-muted"><code></code></p>
                                          <div id="accordion-one" class="accordion mb-5"><!-- accordion-one start -->
                                              <div class="card">
                                                  <div class="mail-list">
                                                  <a class="area list-group-item border-0 text-primary p-r-0"> <b>경기</b> <!-- <span class="badge badge-primary badge-sm float-right m-t-5">198</span> --> </a>
                                                  <a href="#" class="area list-group-item border-0 text-primary p-r-0"><b>강원</b></a>  <a href="#" class="area list-group-item border-0 text-primary p-r-0"><b>제주</b></a>
                                                  <a href="#" class="area list-group-item border-0 text-primary p-r-0"><b>충남</b></a><a href="#" class="area list-group-item border-0 text-primary p-r-0"><b>충북</b></a>
                                                  <a href="#" class="area list-group-item border-0 text-primary p-r-0"><b>경남</b></a><a href="#" class="area list-group-item border-0 text-primary p-r-0"><b>경북</b></a>
                                                  <a href="#" class="area list-group-item border-0 text-primary p-r-0"><b>전남</b></a><a href="#" class="area list-group-item border-0 text-primary p-r-0"><b>전북</b></a>
                                              	  </div>
                                              </div>
                                          </div>
                                          <!--  carousel start -->
                                          <c:forEach var="c" items="${listFacility}">
                                          <div class="bootstrap-carousel">
                                    <div data-ride="carousel" class="carousel slide" id="carouselExampleCaptions">
                                        <ol class="carousel-indicators">
                                            <li class="" data-slide-to="0" data-target="#carouselExampleCaptions"></li>
                                            <li data-slide-to="1" data-target="#carouselExampleCaptions" class=""></li>
                                            <li data-slide-to="2" data-target="#carouselExampleCaptions" class="active"></li>
                                        </ol>
                                        <div class="carousel-inner">
                                            <div class="carousel-item">
                                                <img class="d-block w-100" src="${c.f_pic}" alt="">
                                                <div class="carousel-caption d-none d-md-block">
                                                    <h5>First slide label</h5>
                                                    <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <img alt="" class="d-block w-100" src="${c.f_pic}">
                                                <div class="carousel-caption d-none d-md-block">
                                                    <h5>Second slide label</h5>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                                </div>
                                            </div>
                                            <div class="carousel-item active">
                                                <img alt="" class="d-block w-100" src="${c.f_pic}">
                                                <div class="carousel-caption d-none d-md-block">
                                                    <h5>Third slide label</h5>
                                                    <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
                                                </div>
                                            </div>
                                        </div><a data-slide="prev" href="#carouselExampleCaptions" class="carousel-control-prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span> </a><a data-slide="next" href="#carouselExampleCaptions" class="carousel-control-next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
                                    </div>
                                </div>
   								</c:forEach>
									<!-- carousel end -->


                                  </div>	
          
                                          </div>
                                      </div>
                                      <div class="col-lg-8 col-xl-9">
                        

                        <div class="card">
                            <div class="card-body">
                            	 <h4 class="mb-5 font-weight-light">총 ${pageMaker.getTotalCount()}개의 애견펜션이 검색되었습니다.</h4>
                            	<c:forEach var="c" items="${listFacility}">
          <div class="media media-reply">

                    <div class="media-body">


                              <div class="media align-items-center">
                                        <img class="mr-3 col-3 my-auto"
                                                  src="${c.f_pic}"
                                                  alt="hotel image" height="118">

                                        <div class="media-body col-6">
                                                  <div class="mb-2">
                                                            <h4 class="mb-sm-0 mb-lg-2">
                                                            <c:set var="m" value="${pageContext.request.userPrincipal.name}" />   
                                                            <a href="detail?facility_no=${c.facility_no}&user_id=${fn:substring(m,21,26)}">${c.facility_name}</a><small
                                                                                class="text-muted ml-3">${c.facility_addr}</small></h4>
                                                            <div class="media-reply__link">

                                                                      <button class="btn btn-transparent p-0 mr-3"><i
                                                                                          class="fa fa-star"></i><i
                                                                                          class="fa fa-star"></i><i
                                                                                          class="fa fa-star"></i><i
                                                                                          class="fa fa-star"></i><i
                                                                                          class="fa fa-star"></i></button>

                                                            </div>
                                                  </div>
                                                  <p>${c.f_intro}</p>
                                        </div>
                                        <div class="col-3 text-center">
                                                  <h4 class="mb-3">￦${c.f_minprice}~</h4>
                                                  <c:set var="m" value="${pageContext.request.userPrincipal.name}" />                                                  
                                                  <a href="detail?facility_no=${c.facility_no}&user_id=${fn:substring(m,21,26)}" class="btn mb-1 btn-primary">지금 바로 예약<span
                                                                      class="btn-icon-right"><i
                                                                                class="fa fa-check"></i></span>
                                                  </a>
                                        </div>
                              </div>
                    </div>
          </div>
</c:forEach>
<!-- pagination start -->
<div class="bootstrap-pagination">
          <nav>
              <ul class="pagination justify-content-end">
                    <c:if test="${pageMaker.prev}">
                              <li class="page-item disabled">
                                        <a class="page-link" href="search${pageMaker.makeKeywordSearch(pageMaker.startPage - 1)}" tabindex="-1">이전</a>
                              </li>
                    </c:if>
                    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                              <li class="page-item">
                                        <a class="page-link" href="search${pageMaker.makeKeywordSearch(idx)}">${idx}</a>
                              </li>
                    </c:forEach>
                              <li class="page-item">
                                        <a class="page-link" href="search${pageMaker.makeKeywordSearch(pageMaker.endPage + 1)}">다음</a>
                              </li>
              </ul>
          </nav>
</div>                            
                            




<!-- pagination end -->
                            
                        </div>
                        </div>
                    </div>
                                            
                                 
       	                                                                               
                                                                      
                    
                                  </div>
          
                              </div><!-- col-lg-3 -->
                                        
                                                 
          
          
          
          
          
                        </div>                
          
                              
                    </div><!-- container fluid end -->
                    
                    
                    
                    

          

    
</body>

</html>
<%@include file="../footer.jsp"%>