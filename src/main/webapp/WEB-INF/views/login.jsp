<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 로그인 아이디 -->
<sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal.user_id" var="login_id"/>
</sec:authorize>

<!-- 로그인 계정 유저 / 어드민 정보 안가져와짐-->
<sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal.user_role" var="login_role"/>
</sec:authorize>

<sec:authorize access="isAnonymous()">
   <a href="/login/login">로그인</a>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
   <p><sec:authentication property="principal.user_id"/>님, 반갑습니다.</p>
   <a href="/login/logout">로그아웃</a>
</sec:authorize>
<hr>


</body>
</html>