<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>PETWEGO | 숙소 | 검색결과</title>
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <!-- CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
   <!-- jQuery library & bootstrap.min.js -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(function(){

		$('.area').click(function(e){
			e.preventDefault();
			display = $(this).text();
			self.location='search' + '${pageMaker.makeQuery(1)}' + '&keyword=' + encodeURIComponent(display);
		});
		$('.type').click(function(e){
			e.preventDefault();
			display = $(this).text();
			self.location='search' + '${pageMaker.makeQuery(1)}' + '&keyword=' + encodeURIComponent(display);
		});
		
		$('#searchBtn').click(function() {
			self.location = 'search' + '${pageMaker.makeQuery(1)}' + '&keyword=' + encodeURIComponent($('#keywordInput').val());
		});
	
	
	});
	</script>
   
   <style>
      /* common */

      *,
      *::before,
      *::after {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
      }

      /*Custom properties*/

      /* Header */
      .main-menu ul li a {
                color: #222;
                font-size: 14px;
                text-transform: uppercase;
      }

      /*Global styles*/
      html {
                font-size: 10px;
      }

      body {
                font-family: 'Open Sans', sans-serif;
                font-size: 1.6rem;
                color: var(--dark-color);
      }

      html,
      body {
                overflow-x: hidden;
                position: relative;

      }

      a {
                text-decoration: none;
                color: inherit;
      }

      ul {
                list-style: none;
      }

      section {
                padding: 5rem 0;
      }

      select {

                border-radius: 0;

                -webkit-appearance: none;
                -webkit-border-radius: 0px;
      }

      img {
                max-width: 100%;
                transition: all 0.3s ease-out 0s;
      }

      /* shop */

      .page-title-area.pt-100.pb-100 {
                background-size: cover;
                background-position: center;
      }

      .breadcrumb {
                list-style: none;
      }

      .shop-sidebar {
                margin-bottom: 50px;
      }

      .shop-sidebar h3 {
                font-size: 14px;
                font-weight: 600;
                text-transform: uppercase;
                border-bottom: 1px solid #ddd;
                padding-bottom: 10px;
                margin-bottom: 20px;
      }

      .shop-sidebar:first-child h3 {
                border: none;
      }

      .size li a {
                color: #666;
                font-size: 13px;
                font-weight: 500;
      }

      .size li {
                margin-bottom: 10px;
      }

      .size li:last-child {
                margin-bottom: 0px;
      }

      .cat li a {
                border: 1px solid #ddd;
                padding: 10px;
                display: inline-block;
                font-size: 12px;
                color: #666;
      }

      .cat li {
                float: left;
                margin-right: 10px;
                margin-bottom: 10px;
      }

      .shop-tab {
                margin-bottom: 30px;
      }

      .shop-tab li {
                margin-right: 10px;
                display: inline-block;
      }

      .shop-tab li a {
                color: #777;
                font-size: 20px;
                padding: 10px;
                /* border: 1px solid #ddd; */
                height: 40px;
                width: 40px;
                text-align: center;
                line-height: 40px;
      }



      .shop-tab li a.active {
                color: #000;
      }

      /*product*/
      .product-wrapper {
                padding: 15px;
      }

      .product-wrapper .product-img {
                position: relative;

      }


      .product-img img {
                width: 100%; 
                height: 145px;
      }

      .product-wrapper {
                border: 1px solid #ddd;
      }

      .product-wrapper:hover .secondary-img {
                opacity: 1;
                top: 0;
      }

      .product-action {
                background: #fff none repeat scroll 0 0;
                left: 0;
                margin: auto;
                opacity: 0;
                padding: 13px 0;
                position: absolute;
                right: 0;
                top: 50%;
                visibility: hidden;
                width: 60px;
                transition: .3s;
      }

      .product-wrapper:hover .product-action {
                opacity: 1;
                visibility: visible;
                transform: translateY(-50%);
      }

      .product-action>a {
                color: #111;
                display: block;
                padding: 13px 0;
                text-align: center;
      }

      .product-img>span {
                padding: 10px 25px;
                position: absolute;
                right: 0;
      }

      .product-price {
                display: flex;
                flex-direction: column;
      }

      .cart-btn {
                border: 1px solid #ddd;
      }

      .product-content p {
                font-weight: 100;
                font-size: 1.25rem;
      }
      #reserveBtn{
      	text-decoration:none;
      }
      

      /* .product-content .small {

                font-size: 1rem;
      } */
   </style>
</head>

<body>
          <!--header-->

          <!--content-->

          <!--shop-area start-->
          <div class="shop-area pt-100 pb-100 mt-5">
                    <!-- container start-->
                    <div class="container">
                    		  <!-- form start -->
							  <form class="mb-5">
					             <div class="form-row">
					                       <div class="form-group col-md-3 mr-5">
					                                 <!-- <label for="inputCity">City</label> -->
					                                 <input type="text" class="form-control" id="inputCity">
					                       </div>
					
					                       <div class="form-group col-md-2 d-flex">
					                                 <!-- <label for="inputZip">Zip</label> -->
					                                 <i class="far fa-calendar-alt mr-2"></i>
					                                 <input type="text" class="form-control" id="inputZip">
					                       </div>
					                       <div class="form-group col-md-2 d-flex">
					                                 <!-- <label for="inputZip">Zip</label> -->
					                                 <i class="far fa-calendar-alt mr-2"></i>
					                                 <input type="text" class="form-control" id="inputZip">
					                       </div>
					                       <div class="form-group col-md-1 ml-5">
					                                 <!-- <label for="inputState">State</label> -->
					                                 <select id="inputState" class="form-control">
					                                           <option selected>성인 1명</option>
					                                           <option>성인 2명</option>
					                                           <option>성인 3명</option>
					                                           <option>성인 4명</option>
					                                           <option>성인 5명</option>
					                                           <option>성인 6명</option>
					                                           <option>성인 7명</option>
					                                           <option>성인 8명</option>
					                                           <option>성인 9명</option>
					                                 </select>
					                       </div>
					                       <div class="form-group col-md-1">
					                                 <!-- <label for="inputState">State</label> -->
					                                 <select id="inputState" class="form-control">
					                                           <option selected>동물 1마리</option>
					                                           <option>동물 2마리</option>
					                                           <option>동물 3마리</option>
					                                           <option>동물 4마리</option>
					                                           <option>동물 5마리</option>
					                                           <option>동물 6마리</option>
					                                 </select>
					                       </div>
					                       <div class="form-group col-md-2 ml-5">
					                                 <button type="submit" class="btn btn-primary bg-light" style="width:100%;border:1px solid #ddd;color:#333;">검색</button>
					                       </div>
					
					
							             </div>
							
							
							   </form>
                              <!-- form end -->
                              <!-- row start-->
                              <div class="row mb-5">
                                        <!-- sidebar(col-xl-3) start-->
                                        <div class="col-xl-3">

                                                  <h4 class="mb-5">총 ${pageMaker.getTotalCount()}개의 애견펜션이 검색되었습니다.</h4>

                                                 <!--  <div class="shop-sidebar">
                                                            <h3>키워드로 검색</h3>
                                                            <div class="d-flex">
                                                            <input id="keywordInput" type="text" class="form-control col-xl-10 mr-2">
                                                            <button id="searchBtn" type="button">검색</button>
                                                            <button type="button" id="searchBtn" class="btn btn-light col-xl-2">검색</button>
                                                            </div>
                                                            
                                                  </div> -->
                                                  <div class="shop-sidebar">
                                                            <h3>지역명</h3>
                                                            <ul class="size">
                                                                      <li><a class="area" href="#">경기</a></li>
                                                                      <li><a class="area" href="#">강원</a></li>
                                                                      <li><a class="area" href="#">제주</a></li>
                                                                      <li><a class="area" href="#">충남</a></li>
                                                                      <li><a class="area" href="#">충북</a></li>
                                                                      <li><a class="area" href="#">경남</a></li>
                                                                      <li><a class="area" href="#">경북</a></li>
                                                                      <li><a class="area" href="#">전남</a></li>
                                                                      <li><a class="area" href="#">전북</a></li>
                                                            </ul>
                                                  </div>
                                                  <div class="shop-sidebar">
                                                            <h3>숙소유형</h3>
                                                            <ul class="cat">
                                                                      <li><a class="type" href="#">복층</a></li>
                                                                      <li><a class="type" href="#">독채</a></li>
                                                                      <li><a class="type" href="#">풀빌라</a></li>
                                                                      <li><a class="type" href="#">온돌</a></li>
                                                                      <li><a class="type" href="#">글램핑</a></li>
                                                                      <li><a class="type" href="#">한옥</a></li>
                                                                      <li><a class="type" href="#">캠핑</a></li>
                                                                      <li><a class="type" href="#">도미토리</a></li>
                                                            </ul>
                                                  </div>
                                        </div>
                                        <!-- sidebar(col-xl-3) end-->


                                        <!-- content(col-xl-9) start-->

                                        <div class="col-xl-9">

                                                  <!-- product-wrapper start -->

                                                  <c:forEach var="c" items="${listFacility}">
                                                            <div class="product-wrapper d-flex justify-content-start">
                                                                      <div class="product-img col-xl-3">
                                                                                <a href="detail?facility_no=${c.facility_no}">
                                                                                          <img src="${c.f_pic}"
                                                                                                    alt=""><img
                                                                                                    class="secondary-img"
                                                                                                    src="" alt="">
                                                                                </a>
                                                                                <!-- <span>Hot</span> -->
                                                                                <div class="product-action">
                                                                                          <a href="detail?facility_no=${c.facility_no}">
                                                                                                    <i
                                                                                                              class="fas fa-eye"></i>
                                                                                          </a>
                                                                                          <a href="detail?facility_no=${c.facility_no}">
                                                                                                    <i
                                                                                                              class="fas fa-shopping-cart"></i>
                                                                                          </a>
                                                                                          <a href="detail?facility_no=${c.facility_no}">
                                                                                                    <i
                                                                                                              class="far fa-heart"></i>
                                                                                          </a>
                                                                                </div>
                                                                      </div>
                                                                      <div class="product-content col-xl-6"
                                                                                style="padding:15px 0 0 18px;">

                                                                                <h3>
                                                                                          <a
                                                                                                    href="detail?facility_no=${c.facility_no}">${c.facility_name}</a>
                                                                                </h3>
                                                                                <div class="rating mb-2">
                                                                                          <i class="fas fa-star"></i>
                                                                                          <i class="fas fa-star"></i>
                                                                                          <i class="fas fa-star"></i>
                                                                                          <i class="fas fa-star"></i>
                                                                                          <i class="fas fa-star"></i>
                                                                                </div>
                                                                                <p>${c.facility_addr}</p>

                                                                      </div>
                                                                      <div
                                                                                class="product-price col-xl-3 d-flex flex-column justify-content-center">
                                                                                <div class="price text-center mb-4">
                                                                                          ￦<span>${c.f_minprice}</span>~
                                                                                </div>
                                                                                <div class="cart-btn text-center p-3">
                                                                                          <a id="reserveBtn" href="detail?facility_no=${c.facility_no}">예약하기</a>
                                                                                </div>
                                                                      </div>
                                                            </div>
                                                  </c:forEach>

                                                  <!--product-wrapper end-->
                                        </div>
                                        <!--content(col-xl-9) end-->
                              </div>
                              <!-- row end-->
                              
                              <!--pagign area start-->
                              	<nav aria-label="Page navigation example">
								  <ul class="pagination justify-content-end">
								  	<c:if test="${pageMaker.prev}">
									    <li class="page-item disabled">
									      <a class="page-link text-dart" href="search${pageMaker.makeKeywordSearch(pageMaker.startPage - 1)}" tabindex="-1">이전</a>
									    </li>
									</c:if> 
									<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
									    <li class="page-item">
									    	<a class="page-link text-dark" href="search${pageMaker.makeKeywordSearch(idx)}">${idx}</a>	
									    </li>
									</c:forEach>
									    <li class="page-item">
									      <a class="page-link text-dark" href="search${pageMaker.makeKeywordSearch(pageMaker.endPage + 1)}">다음</a>
									    </li>
								  </ul>
								</nav>
							<!-- paging area end -->
                    </div>
                    <!-- container end-->
          </div>
          <!--shop-area-end-->
 
          <!--footer-->
</body>

</html>