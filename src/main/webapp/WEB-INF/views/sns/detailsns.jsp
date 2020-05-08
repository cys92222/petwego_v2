<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h2>상세보기</h2>
		<hr>
		<img src="img/${photo.no }"><br>
		<textarea rows="10" cols="80">${photo_detail}</textarea>
		</form>
		
		<a href="update.do?no=${photo.no }">수정</a>
		<a href="delete.do?no=${photo.no }">삭제</a>
	
</body>
</html>