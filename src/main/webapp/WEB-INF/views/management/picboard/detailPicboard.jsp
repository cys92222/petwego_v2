<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>sns상세보기</h2>
<hr>
픽보드 상세보기
${pb }<br>

픽보드파일 상세보기
${pbf }<br>
<img src="../../img/${pbf.photo_file_name }" width="200px" height="200px"><br>

<a href="/management/picboad/deletePicboard?photo_no=${pb.photo_no }">삭제</a>

댓글 리스트<br>
<c:forEach items="${pbc }" var="pbc">
${pbc }
<a href="/management/picboad/picboardcomment_delete?photo_comm_no=${pbc.photo_comm_no }&photo_no=${pbc.photo_no}">삭제</a><br>
</c:forEach>


</body>
</html>