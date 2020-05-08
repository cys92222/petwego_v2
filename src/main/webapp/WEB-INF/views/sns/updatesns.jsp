<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h2>게시글 수정</h2>
		<form action="updatesns.do" method="post" enctype="multipart/form-data">
		<img src="img/${file.photo_file_name }" width="50" height="50"><br>
		내용:<br>
		<textarea rows="10" cols="80" name="detailsns">${board.photo_detail}</textarea>		
		<input type="submit" value="수정">
		<input type="reset" value="취소">
	</form>
</body>
</html>