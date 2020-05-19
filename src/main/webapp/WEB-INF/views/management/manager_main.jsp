<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#member").click(function(){
			self.location="/management/manager_member"
		})

		$("#allBoard").click(function(){
			self.location="/management/manager_member"
		})
	})
</script>
</head>
<body>
	<div id="member" style="border: 1px solid gold; float: left; width: 33%;">회원 관리</div>
	<div id="allBoard" style="border: 1px solid red; float: left; width: 33%;">게시물 관리</div>
	<div id="log" style="border: 1px solid blue; float: left; width: 33%;">Aop 로그</div>
</body>
</html>