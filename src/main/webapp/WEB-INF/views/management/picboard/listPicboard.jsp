<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$(function(){
// 	var boardList = '${boardList}';
// 	var fileList = '${fileList}';

// 	console.log(boardList);
// 	console.log(fileList);

	//사진
// 	$.each(fileList,function(idx,pic){
// 		alert(pic);
// 		var img = $("<img src='../img/pic.photo_file_name'/>");
// 		var id = $("<div></div>").html(${board[idx].user_id});
// 		var div = $("<div></div>").append(img);
// 		$("#picSec").append(div);
		});


})
</script>
<body>
<h2>sns게시판</h2>
<hr>
<c:forEach items="${fileList }" var="pic">
	<img src="../../img/${pic.photo_file_name }">
</c:forEach>

</body>
</html>