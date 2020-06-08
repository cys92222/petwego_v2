<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<%@ include file="../header.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/mypage/mypage">마이페이지 | 예약 상세페이지</a></li>
				<li class="breadcrumb-item active"><a href="/MainPage">메인</a></li>
			</ol>
		</div>
	</div>
	
	<div class="container-fluid">
                <div class="row">
<!--                 숙소소개 -->
                    <div class="col-12 m-b-30">
                        <div class="row">
                            <div class="col-md-6 col-lg-6">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <a href="/facility/detail?facility_no=${detail.facility_no }&user_id=${login_id}"><h5 class="card-title">${detail.facility_name } / 구경하기</h5></a>
                                        <h6 class="card-subtitle mb-2 text-muted">${detail.facility_addr }</h6>
                                    </div>
                                    <img class="img-fluid" src="${detail.f_pic }" alt="">
                                    <div class="card-body">
                                        <p class="card-text">숙소소개</p>
                                        <p class="card-text">${detail.f_intro }</p>
                                    </div>
                                    <div class="card-footer">
                                        <p class="card-text d-inline"><small class="text-muted">${detail.f_feature }</small>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            
                            <!--                         예약내역 -->
                            <div class="col-md-6 col-lg-6">
                                <div class="card">
                                    <div class="card-header bg-white">
                                        <h5 class="card-title">예약 정보</h5>
                                        <h6 class="card-subtitle mb-2 text-muted">${detail.guest_name }</h6>
                                    </div>
<%--                                     <img class="img-fluid" src="${detail.rm_pic }" alt=""> --%>
                                    <div class="card-body">
                                 		 <p class="card-text"> - 사람 수 ${detail.human_num } 명</p>
                                    	 <p class="card-text"> - 동물 수 ${detail.pet_num } 마리</p>
                                        <p class="card-text"> - 방소개</p>
                                        <p class="card-text"> -  방번호 (${detail.rm_no }) / 방이름 (${detail.rm_name })</p>
                                        <p class="card-text"> - ${detail.rm_info }</p>
                                        <p class="card-text"> -  체크인 날짜 : 
                                        <fmt:parseDate var="check_in" value="${detail.check_in }" pattern="yyyy-MM-dd"/> 
								<fmt:formatDate value="${check_in }" pattern="yyyy-MM-dd" />
								</p>
								<p class="card-text"> - 체크아웃 날짜 : 
								 <fmt:parseDate var="check_out" value="${detail.check_out }" pattern="yyyy-MM-dd"/> 
								<fmt:formatDate value="${check_out }" pattern="yyyy-MM-dd" />
								</p>
								
                                    </div>
                                    <div class="card-footer">
                                        <p class="card-text d-inline">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								 가격 ${detail.rsv_price } / <a href="/facility/reservationpay?rsv_no=${detail.rsv_no }&user_id=${detail.user_id }&rsv_price=${detail.rsv_price }&rsv_date=${detail.rsv_date }&check_in=${detail.check_in }&check_out=${detail.check_out }&human_num=${detail.human_num}&pet_num=${detail.pet_num }&rm_no=${detail.rm_no }&rsv_paid=${detail.rsv_paid}&guest_name=${detail.guest_name }&guest_tel=${detail.guest_tel }" class="btn btn-danger btn-circle btn-sm"  onclick="return confirm('결제하겠습니까?');">
                   							결제하기
                  							</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            
                            
                        </div>

                       
                    </div>
                    

                        </div>
                
                        
                
            </div>

<%@ include file="../footer.jsp"%>
</body>
</html>