<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$(function(){
	var list = "${followList2}";
	
	$.each(list,function(idx,e){
			alert(e);
		});
// 	list.IndexOf()
});
</script>
</head>
<body>
<h2>${followList[0].user_id }님을 팔로우한 유저aaaaaaaaaaa</h2>
<hr>


<c:forEach items="${followList }" var="followList">
${followList.user_id2 } 님 


<%-- <a href="/follow/insert_follow2?user_id=${followList.user_id2 }&user_id2=${followList.user_id }"> --%>
<!-- 맞팔로우 -->
<!-- </a> <br> -->



<%-- <a href="/follow/delete_follow?user_id=${login_id }&user_id2=${followList.user_id2 }"> --%>
<!-- 언팔로우 -->
<!-- </a><br> -->


</c:forEach>
</body>
</html>