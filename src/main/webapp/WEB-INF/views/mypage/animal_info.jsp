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
			$("#animail_list").css({"display":"none"});
		});

	//등록
	$("#insert_btn").click(function(){
		$("#animal_insert").css({"display":"none"});
		$("#animail_list").css({"display":"block"});
		
// 		var data = $("#insert_animal").serialize();
// 		$.ajax("/mypage/animal_info_up",{data:data,success:function(re){
// 			alert("동물등록 성공");
// 			window.location.reload(true);
// 			}});
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
						<div class="card-body">
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
							<p class="text-muted">${al.pet_intro }</p>
							<ul class="card-profile__info">
								<li class="mb-1"><strong class="text-dark mr-4 ml-4">반려시작일</strong><span>${al.pet_date }</span></li>
								<li><strong class="text-dark mr-4 ml-4">반려동물종류</strong><span>${al.pet_type }</span></li>
							</ul>
							<a class="btn btn-primary"
								href="/mypage/update_animal_form?user_id=${al.user_id }&pet_no=${al.pet_no}">반려동물
								정보 수정</a> <a class="btn btn-primary"
								href="/mypage/delete_animal?user_id=${al.user_id }&pet_no=${al.pet_no}">반려동물
								정보 삭제</a>
						</div>
					</div>
				</div>
		</c:forEach>
			</div>
		
	</div>



<section id="animal_insert">
<h2>반려동물 추가</h2>
<hr>
	<form action="/mypage/animal_info_up" id="insert_animal" enctype="multipart/form-data" method="post">
	<input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<%-- 		<input type="text" name="user_id" value="${animal_list[0].user_id}" readonly="readonly"><br> --%>
		반려인 <input type="text" name="user_id" value="${user_id.user_id }" readonly="readonly"><br>
		동물이름 <input type="text" name="pet_name"><br>
		반려시작일 <input type="date" id="pet_date" name="pet_date"><br>
		동물종류 <input type="text" name="pet_type"><br>
		사진 <input type="file" name="aa"><br>
		반려동물소개 <br>
		<textarea rows="8" cols="10" name="pet_intro"></textarea>
	<button id="insert_btn">반려동물 등록</button>
	</form>
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>