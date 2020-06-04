<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#cancle").click(function(){
		window.location.href = "/mypage/animal_info_up_form?user_id=${login_id}";
		});
});
</script>
</head>
<body>


<div class="container-fluid">
            <h4>반려동물 정보수정</h4>
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-validation">
                                    <form action="/mypage/update_animal" enctype="multipart/form-data" method="post">
                                       <input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                              			<div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="user_id"> 반려인 : <span class="text-danger">*</span>
                                            </label>    
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="user_id" name="user_id" value="${animal_info.user_id }" required="required"/>
                                            </div>                     
                                        </div>  
                                        <div class="form-group row">
<!--                                             <label class="col-lg-4 col-form-label" for="pet_no"> 반려동물 번호 :  <span class="text-danger">*</span> -->
<!--                                             </label>     -->
                                            <div class="col-lg-6">
                                                <input type="hidden" class="form-control" id="pet_no" value="${animal_info.pet_no }" readonly="readonly" name="pet_no"/>
                                            </div>                     
                                        </div>  
                                         <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="pet_name"> 반려동물 이름 : <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="pet_name" value="${animal_info.pet_name }" name="pet_name"/>
                                            </div>                     
                                        </div>  
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="pet_date"> 반려시작일 : <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="pet_date" name="pet_date" value="${animal_info.pet_date }">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="pet_intro"> 반려동물 소개 : </label>
                                            <div class="col-lg-6">
                                                <textarea class="form-control" id="pet_intro" name="pet_intro" rows="5">${animal_info.pet_intro }</textarea><br>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="pet_type">반려동물 종류 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="pet_type" name="pet_type" value="${animal_info.pet_type }">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="pet_pic">반려동물 사진 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                           	 <img alt="사진이 없습니다" src="/img/animalImg/${animal_info.pet_pic }">
                                           	 <input type="hidden" id="pet_pic" name="pet_pic" value="${animal_info.pet_pic }"><br>
                                           	 <input type="file" name="aa">
                                                <a href="/mypage/delete_animal_pic?user_id=${animal_info.user_id }&pet_no=${animal_info.pet_no }">사진 삭제</a><br>
                                            </div>
                                        </div>
                                    <div class="form-group row">
                                        <div class="col-lg-8 ml-auto">
                                            <button type="submit" class="btn btn-primary" id="submit">수정하기</button>
                                            <button type="button" class="btn mb-1 btn-danger" id="cancle">취소하기</button>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

<%@ include file="../footer.jsp" %>
</body>
</html>