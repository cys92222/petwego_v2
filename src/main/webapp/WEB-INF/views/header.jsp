<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>PET WE GO</title>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script type="text/javascript">
  $(function(){
		
	    $("#popbtn").click(function(){
	        $('div.modal').modal();
	    })

})
  </script>

  <!-- Bootstrap core CSS -->
  <link href="resources/main/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="resources/main/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="resources/main/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="resources/main/css/scrolling-nav.css" rel="stylesheet">

</head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>PET WE GO</title>
  <style type="text/css">
  	#logoArea{
  		top:0;
  		text-align: center;
  	}
  </style>

  <!-- Bootstrap core CSS -->
  <link href="resources/main/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="resources/main/css/scrolling-nav.css" rel="stylesheet">

</head>

<body id="page-top">
	<div id="logoArea">
  		<a class="navbar-brand" href="petwego_main"><img src="resources/img/petwego_logo.jpg" width="450" height="300" id="logo"></a>
  	</div>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-info fixed-top" id="mainNav">
    <div class="container">
     <a class="navbar-brand js-scroll-trigger" href="#page-top">PET WE GO</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- 로그인, 로그아웃 여부 보여주기 -->
    	<sec:authorize access="isAnonymous()">
    		<button class="btn btn-info" id="popbtn">로그인</button>  <!-- glyphicon glyphicon-user -->
   	  	</sec:authorize>
   
    	<sec:authorize access="isAuthenticated()">
    	<span class="navbar-form pull-right"> <img class="img-circle"
		style="width: 20px; height: 20px; margin-right:10px"
		src="../img/peopleImg/<sec:authentication property="principal.fname"/>" />
		</span>
    	<span><sec:authentication property="principal.user_id"/>님</span>
		<a href="/login/logout"><button class="btn btn-info" id="logoutbtn">로그아웃</button></a>
		</sec:authorize>
      <!-- 로그인, 로그아웃 여부 보여주기 끝-->
      
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/pic_board/list">마이펫</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#services">숙소찾기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/board/list">커뮤니티</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/together/listTogether">함께가요</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/customerservice/index">고객지원</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/mypage/mypage">마이페이지</a>
          </li>
          <sec:authorize access="hasRole('ROLE_ADMIN')">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/management/manager_main" id="adminPage">관리자페이지</a>
          </li>
           </sec:authorize>
        </ul>
      </div>
    </div>
  </nav>
  
  <!-- Bootstrap core JavaScript -->
  <script src="resources/main/vendor/jquery/jquery.min.js"></script>
  <script src="resources/main/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="resources/main/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom JavaScript for this theme -->
  <script src="resources/main/js/scrolling-nav.js"></script>

<!-- 여기부터는 로그인 팝업창 -->	
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <h4 class="modal-title">로그인</h4>
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        
      </div>
      <!-- body -->
      <div class="modal-body">
           <form action="/login/login" method="POST"><!-- /login-processing --> <!-- /MainPage -->
  						<input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}"/>
  				<!--  	<input type="text" name="_csrf" value="${_csrf}"/>-->	
  						<!--<sec:csrfInput/>-->
						<div class="form-group">
							<label for="InputId">아이디</label>
							<input type="text" class="form-control" id="user_id" name="user_id" placeholder="ID">
						</div>
						<div class="form-group">
							<label for="InputPassword">비밀번호</label>
							<input type="password" class="form-control" id="pwd" name="pwd" placeholder="PASSWORD">
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox" name="remember-me">아이디 기억하기 <!-- 로그인 유지 기능 -->
							</label>
						</div>
						<button id="login-button" name="submit" type="submit" class="btn btn-block btn-primary text-light">로그인</button>
						<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
						    <font color="red">
						        <p>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
						        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
						    </font>
						</c:if>
					</form>
      </div>
      <!-- Footer -->
      <div class="modal-footer">
			<!--         Footer --> 
			<a href="/join/join">회원가입</a>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 로그인 팝업창 끝 -->
</body>

</html>
