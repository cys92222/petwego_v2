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
// 	var boardList = ${boardList};
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
// 		});
	
	//아이디
// 	$.each(boardList,function(idx,id){
// 		var id = $("<div></div>").html(id.user_id);
// 		$("#list").append(id);
// 		});

})
</script>
<body>
<h2>sns게시판</h2>
<hr>
	<c:forEach items="${fileList }" var="pic" varStatus="status">
	<a href="/management/picboad/detailPicboad?photo_no=${pic.photo_no }">
		<img src="../../img/${pic.photo_file_name }" width="200px" height="200px"><br>
		${boardList[status.index].user_id }<br>
	</a>	
	</c:forEach>
<!-- 참고사이트  http://m.blog.daum.net/lsw4942/11301571 -->

</body>
</html>