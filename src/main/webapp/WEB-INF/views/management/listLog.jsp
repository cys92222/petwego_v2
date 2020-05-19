<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지- 로그기록</title>
<style type="text/css">
	li {list-style: none; float: left; padding: 6px;}	<!--페이징 가로정렬 스타일 -->
</style>
</head>
<body>

	<h1>로그관리</h1>
	<hr>
	<a href="/management/manager_main">관리자페이지 메인</a><br>
	<table border="1" width="70%">
		<thead>
			<tr>
				<th>로그번호</th>
				<th>url</th>
				<th>ip</th>
				<th>시간</th>
				<th>아이디</th>
			</tr>
		</thead>
											
		<tbody>
		<c:forEach var="logg" items="${listLog }">
			<tr>
				<td><c:out value="${logg.log_num }"/></td>
				<td><c:out value="${logg.url }"/></td>
				<td><c:out value="${logg.ip }"/></td>
				<td>
				<c:out value="${logg.time }"/>
				</td>
				<td><c:out value="${logg.user_id }"/></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<hr>
	<div>
  <ul>
    <c:if test="${pageMaker.prev}">
    	<li><a href="listLog${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="listLog${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="listLog${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>
</body>
</html>