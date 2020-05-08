<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>사진 등록</h2>
	<hr>
	<form action="insert" method="post">
	<input type="hidden" name="photo_no" value="${no }">
	<table border="1" width="80%">
		<tr>
			<td>내용</td>
			<td><textarea rows="30%" cols="80%" name="photo_detail" required="required"></textarea></td>
    		<td><input type="file" name="fileName"></td>
		</tr>
	</table>

		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
</body>
</html>