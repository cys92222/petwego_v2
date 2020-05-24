<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.menu {float: left;}
	.content {float: left; width: 80%; }
	.m_ul {
	    list-style-type: none;
	    margin: 0;
	    padding: 0;
	    width: 200px;
	    height: 800px ;
	    background-color: #f1f1f1;
	}
	.m_li a {
	    display: block;
	    color: #000;
	    padding: 8px 16px;
	    text-decoration: none;
	}
	.m_li a.active {
	    background-color: #7AFFC8;
	    color: #3E8061;
	}
	.m_li a:hover:not(.active) {
	    background-color: #555;
	    color: white;
	}
</style>
</head>
<body>
	<div class="menu">
		<ul class="m_ul">
	      <li class="m_li"><a class="active">관리자 페이지</a></li>
	      <li class="m_li"><a href="#news">회원관리</a></li>
	      <li class="m_li"><a href="#contact">Contact</a></li>
	      <li class="m_li"><a href="#about">About</a></li>
	    </ul>
	</div>
	
<!-- 	<div class="content"> -->
<!-- 		<p>여기가 내용 </p> -->
<!-- 	</div> -->
</body>
</html>