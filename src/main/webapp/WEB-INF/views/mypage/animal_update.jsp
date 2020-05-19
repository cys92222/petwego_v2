<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
});
</script>
</head>
<body>
<h2>동물정보 수정</h2>
<hr>
<form action="/mypage/update_animal" enctype="multipart/form-data">
		반려동물 번호 : <input type="text" name="pet_no" value="${animal_info.pet_no }" readonly="readonly"> <br>
		반려동물 이름 :<input type="text" name="pet_name" value="${animal_info.pet_name }"> <br>
		반려시작일 : <input type="text" name="pet_date" value="${animal_info.pet_date }"> <br>
		반려동물 사진 : <img alt="사진이 없습니다" src="${animal_info.pet_pic }"><br>
					<input type="hidden" name="pet_pic" value="${animal_info.pet_pic }"><br>
		<input type="file" name="aa"><br>
	<button>정보 수정</button>
</form>
</body>
</html>