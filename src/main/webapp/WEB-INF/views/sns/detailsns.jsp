<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form>
		<h2>상세보기</h2>
		<hr>
		<img src="img/${file.photo_file_name}"><br>
		<textarea rows="10" cols="80">${board.photo_detail}</textarea>
		</form>
		
		<a href="updatesns.do?no=${board.photo_no }">수정</a>
		<a href="deletesns.do?no=${board.photo_no }">삭제</a>
</body>
</html>