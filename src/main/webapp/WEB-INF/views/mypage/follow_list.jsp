<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${list }" var="f">
<img src="..img/peopleImg/${f.fname }" width="300" height="300"><br>
${f.user_id }<br>
</c:forEach>
<%@ include file="../footer.jsp" %>
</body>
</html>