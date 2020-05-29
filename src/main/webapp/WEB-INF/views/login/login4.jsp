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
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

</head>
<body>
<div class="container">
	  <div class="row" style="padding-top:10%">
		<div class="col-md-4"></div>
		<div class="col-md-4" style="flex-align:center">
			<div class="card">
				<h5 class="card-header">로그인</h5>
				<div class="card-body">
				
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
					<br>
					<!-- 네이버 로그인 창으로 이동 -->
					<div id="naverIdLogin"></div>
					<br>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "94GKviu_hEK0yqX7B96t",
			callbackUrl: "http://localhost:8088/login/login",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, width: 180, height: 40} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
   /* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
</script>
</html>