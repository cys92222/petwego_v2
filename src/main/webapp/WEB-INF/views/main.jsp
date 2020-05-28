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
<style type="text/css">
   * {margin: 0; padding: 0; }
   li {list-style: none; }
   body {font-family: 'Nanum Gothic', sans-serif; width: 1200px; margin: 0 auto; }
               
   .logo {margin: 50px 0; font-size: 30px; text-align: center; font-family: 'Nanum Gothic', sans-serif; }
               
   .topMenu {width: 100%; margin-bottom: 20px; text-align: center; height: 40px; }
   .topMenu:after {content: ""; display: block; clear: both; }
   .menu01>li {float: left; width: 16%; line-height: 40px; }
   .menu01 span {font-size: 20px; font-weight: bold; }
               
   .dept01 {display: none; padding: 20px 0; border-bottom: 1px solid #ccc; }
               
   #nop {float: none; }
               
   .none:after {content: ""; display: block; clear: both; }
   
</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<script>
   $(document).on('mouseover', '.topMenu span', function() {
       $('.dept01').slideDown(300);
   });
   $(document).on('mouseover', 'div', function () {
       if (!$(this).hasClass('topMenu')) {
           $('.dept01').slideUp(300);
       }
   });

   $(function(){
      $("#mypet").click(function(){
            location.href="#";
         })

      $("#facility").click(function(){
            location.href="#";
         })

      $("#board").click(function(){
            location.href="#";
         })

      $("#together").click(function(){
            location.href="#";
         })

      $("#customer_service").click(function(){
            location.href="#";
         })

      $("#login").click(function(){
            location.href="#";
         })

      

   })
   
   $(function(){
	
	    $("#popbtn").click(function(){
//	    $(".login").click(function(){
	        $('div.modal').modal();
	    })

})
</script>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <button class="btn btn-default" id="popbtn">로그인</button>
   </sec:authorize>
   
   
<%--    <sec:authorize access="isAuthenticated()"> --%>
<%--    <sec:authentication property="principal.user_id" var="irum"/> --%>
<%--    <p><sec:authentication property="principal.user_id"/>님, 반갑습니다.</p> --%>
<!--    <a href="/login/logout"><button class="btn btn-default" id="logoutbtn">로그아웃</button></a> -->
<%--    </sec:authorize> --%>
    <sec:authorize access="isAuthenticated()">
	<li><a href="/login/logout"><span
			class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>
	<span class="navbar-form pull-right"> <img class="img-circle"
		style="width: 60px; height: 70px; right:100;"
		src="../img/peopleImg/<sec:authentication property="principal.fname"/>" />
	</span>
	</sec:authorize>
   
   
   <div class="logo">
      <span class="logo">펫위고 PET WE GO</span>
   </div>
   <div class="topMenu">
      <ul class="menu01">
         <li><span id="mypet">마이펫</span>
            <ul class="dept01">
               <li><a href="/pic_board/list">sns리스트</a></li>
               <li><a href="/pic_board/insertForm">sns글등록</a></li>
            </ul>
         </li>
         <li><span id="facility">숙소찾기</span>
            <ul class="dept01">
               <li><a href="/facility/list">숙소리스트</a></li>
            </ul>
         </li>
         <li><span id="board">커뮤니티</span>
            <ul class="dept01">
               <li><a href="/board/list">자유게시판</a></li>
            </ul>
         </li>
         <li><span id="together">함께가요</span>
            <ul class="dept01">
               <li><a href="/together/listTogether">함께가요</a></li>
            </ul>
         </li>
         <li><span id="customer_service">고객지원</span>
            <ul class="dept01">
               <li><a href="/customerservice/index">고객센터</a></li>
            </ul>
         </li>
         <li><span id="login">로그인</span>
            <ul class="dept01"></ul>
            <ul class="dept01"><a href="/mypage/mypage">마이페이지</a></ul>
            
            <sec:authorize access="hasRole('ROLE_ADMIN')"> 
            <ul class="dept01"><a href="/management/manager_main">관리자페이지</a></ul>
        	 </sec:authorize>
         </li>

      </ul>
   </div>
    <div class="none">
     </div>
     
  <div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">로그인</h4>
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
<!--         Footer --> <a href="/join/join">회원가입</a>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>