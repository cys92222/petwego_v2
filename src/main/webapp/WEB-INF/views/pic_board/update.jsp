<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$(function(){
		
		
})


 

</script>
</head>
<body>
	<h2>사진 수정</h2>
	<hr>
	<form action="/pic_board/update" method="post" enctype="multipart/form-data">
	<input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		사진번호 <br>
		<input type="text" name="photo_no" value="${board.photo_no }" readonly="readonly"><br>
		파일번호 <br>
		<input type="text" name="photo_file_no" value="${pic.photo_file_no }" readonly="readonly"><br>
		작성자 <br>
		<input type="text" name="user_id" value="${board.user_id }" readonly="readonly"><br>
		내용 <br>
		<textarea rows="8" cols="100" name="photo_detail">${board.photo_detail }</textarea><br>
		사진<br>
		<input type="text" name="photo_file_name" value="${pic.photo_file_name }"><br>
		<input type="file" name="uploadFile"><br>
		<button type="submit" id="btnUp">수정</button>
	</form>
<%@include file="../footer.jsp"%> 
</body>
</html>

