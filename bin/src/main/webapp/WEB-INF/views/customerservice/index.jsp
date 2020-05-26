<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--     영수) 5월12일 고객센터 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();
 
    String name = "";
    if(principal != null) {
        name = auth.getName();
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>고객센터</h2>
<h2>게시글 등록</h2>
	<sec:authorize access="isAnonymous()">
   <a href="/login/login">로그인</a>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user_id" var="irum"/>
   <p><sec:authentication property="principal.user_id"/>님, 반갑습니다.</p>
<input type="text" value="${irum }">
   <a href="/login/logout">로그아웃</a>
	</sec:authorize>
<hr>
<a href="/customerservice/allNotice">공지사항</a><br>
<a href="/customerservice/List">문의사항</a><br>
</body>
</html>