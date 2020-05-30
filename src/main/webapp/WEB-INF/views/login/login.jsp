<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<html class="h-100" lang="en" dir="ltr"><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Quixlab - Bootstrap Admin Dashboard Template by Themefisher.com</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../resources/quixlab/images/favicon.png">
    <!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->
    <link href="../resources/quixlab/css/style.css" rel="stylesheet">
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>

<body class="h-100" data-theme-version="light" data-layout="vertical" data-nav-headerbg="color_1" data-headerbg="color_1" data-sidebar-style="full" data-sibebarbg="color_1" data-sidebar-position="static" data-header-position="static" data-container="wide" direction="ltr">
    
    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader" style="display: none;">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"></circle>
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <a class="text-center" href="/MainPage"> <h4>메인으로 돌아가기</h4></a>
                                <form class="mt-5 mb-5 login-input" action="/login/login" method="POST">
                                    <input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="user_id" name="user_id" placeholder="ID">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="pwd" name="pwd" placeholder="PASSWORD">
                                    </div>
                                    <button class="btn login-form__btn submit w-100">로그인</button>
                                	<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
								    <font color="red">
								        <p>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
								        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
								    </font>
									</c:if>
                                </form>
								<!-- 네이버 로그인 창으로 이동 -->
								<div id="naverIdLogin"></div>
                                <p class="mt-5 login-form__footer" style="margin-left: 400px;"><a href="/join/join" class="text-primary">회원가입</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>							
    

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="../resources/quixlab/plugins/common/common.min.js"></script>
    <script src="../resources/quixlab/js/custom.min.js"></script>
    <script src="../resources/quixlab/js/settings.js"></script>
    <script src="../resources/quixlab/js/gleek.js"></script>
    <script src="../resources/quixlab/js/styleSwitcher.js"></script>

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