<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>사진 등록</h2>
	<hr>
	<form action="/pic_board/insert" method="post" enctype="multipart/form-data">
	<input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden"><br>  <!-- name="user_id" -->
		작성자 <input type="text" name="user_id" value="${login_id }"><br>
		내용 <br>
		<textarea rows="8" cols="100" name="photo_detail"></textarea><br>
		사진<br>
		<input type="file" name="uploadFile"><br>
		<input type="submit" value="등록">
		<input type="submit" value="취소">
	</form>
</body>
</html>
