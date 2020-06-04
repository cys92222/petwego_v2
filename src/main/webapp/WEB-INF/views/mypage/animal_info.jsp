<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#animal_insert{
	display: none;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	//등록 폼
	$("#form_btn").click(function(){
			$("#animal_insert").css({"display":"block"});
			location.href="#animal_insert";
// 			$("#animail_list").css({"display":"none"});
		});

	//등록
	$("#insert_btn").click(function(){
		$("#animal_insert").css({"display":"none"});
// 		$("#animail_list").css({"display":"block"});
		
// 		var data = $("#insert_animal").serialize();
// 		$.ajax("/mypage/animal_info_up",{data:data,success:function(re){
// 			alert("동물등록 성공");
// 			window.location.reload(true);
// 			}});
		});

	//취소버튼
	$("#cancle").click(function(){
		$("#animal_insert").css({"display":"none"});
// 		$("#animail_list").css({"display":"block"});
		});

});
</script>
</head>
<body>



	<div class="container-fluid">
	<button class="btn btn-primary mb-4" id="form_btn">반려동물 추가</button>
			<div class="row">
		<c:forEach items="${animal_list }" var="al">
				<div class="col-lg-4 col-xl-3">
					<div class="card text-center">
						<div class="card-body" >
							<div class="media align-items-center justify-content-center mb-4">
								<div
									class="text-center d-flex flex-column justify-content-center">
									<div class="row mb-5 d-flex flex-column align-items-center">
										<h2>반려동물 정보</h2>
										<img class="rounded-circle" alt="사진이 없습니다"
											src="/img/animalImg/${al.pet_pic }" width="100" height="100">
									</div>		
									<h3 class="mb-0">${al.pet_name }</h3>
								</div>
							</div>


							<h4>반려동물 소개</h4>
							<textarea class="alert alert-secondary"  readonly="readonly" rows="10" cols="30">${al.pet_intro }</textarea>
<%-- 							<p class="text-muted">${al.pet_intro }</p> --%>
							<ul class="card-profile__info">
								<li class="mb-1"><strong class="text-dark mr-4 ml-4">반려시작일</strong><span>${al.pet_date }</span></li>
								<li><strong class="text-dark mr-4 ml-4">반려동물종류</strong><span>${al.pet_type }</span></li>
							</ul>
							<a class="btn btn-primary"
								href="/mypage/update_animal_form?user_id=${al.user_id }&pet_no=${al.pet_no}">반려동물
								정보 수정</a> 
								<a href="/mypage/delete_animal?user_id=${al.user_id }&pet_no=${al.pet_no}">
								<button type="button" class="btn mb-1 btn-danger">반려동물 정보 삭제</button>
								</a>
						</div>
					</div>
				</div>
		</c:forEach>
			</div>
		
	</div>



<section id="animal_insert">
	

            <h4>반려동물 추가하기</h4>
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-validation">
                                    <form action="/mypage/animal_info_up" enctype="multipart/form-data" method="post">
                                       <input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                              			<div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="user_id"> 반려인 : <span class="text-danger">*</span>
                                            </label>    
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="user_id" name="user_id" value="${login_id }" required="required"/>
                                            </div>                     
                                        </div>   
                                         <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="pet_name"> 반려동물 이름 : <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="pet_name" name="pet_name"/>
                                            </div>                     
                                        </div>  
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="pet_date"> 반려시작일 : <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="pet_date" name="pet_date" >
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="pet_intro"> 반려동물 소개 : </label>
                                            <div class="col-lg-6">
                                                <textarea class="form-control" id="pet_intro" name="pet_intro" rows="8" cols="10"></textarea><br>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="pet_type">반려동물 종류 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="pet_type" name="pet_type">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="pet_pic">반려동물 사진 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                           	 <input type="file" name="aa">
                                            </div>
                                        </div>
                                    <div class="form-group row">
                                        <div class="col-lg-8 ml-auto">
                                            <button type="submit" class="btn btn-primary" id="submit">등록하기</button>
                                            <button type="button" class="btn mb-1 btn-danger" id="cancle">취소하기</button>
<!--                                             <button type="button" class="btn btn-primary" id="cancle">취소하기</button> -->
                                        </div>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           
	
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>