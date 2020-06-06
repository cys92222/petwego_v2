<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- petwego_v2 헤더 -->
<%@include file="head.jsp"%>
<!DOCTYPE html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>PET WE GO</title>
<style type="text/css">
.back-to-top {
	position: fixed;
	bottom: 25px;
	right: 25px;
	display: none;
	z-index: 1;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="../resources/quixlab/images/favicon.png">


<!-- Custom Stylesheet -->
<link href="/resources/quixlab/css/style.css" rel="stylesheet">

<script type="text/javascript">
	$(document).ready(function() {
		$("#mainPage").click(function() {
			location.href = "/MainPage";
		})
		$("#mainPage2").click(function() {
			location.href = "/MainPage";
		})

		$(window).scroll(function() {
			if ($(this).scrollTop() > 50) {
				$('#back-to-top').fadeIn();
			} else {
				$('#back-to-top').fadeOut();
			}
		});
		// scroll body to 0px on click
		$('#back-to-top').click(function() {
			$('body,html').animate({
				scrollTop : 0
			}, 400);
			return false;
		});

	})
</script>
</head>

<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10" />
            </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header d-flex justify-content-center" style="background-color: #4AD4C7;">
					<div class="brand-logo my-auto align-items-center">
						<a class="d-flex justify-content-center align-items-center d-block" href="#" id="mainPage">  
		                    <span class="brand-title" style="color: white; font-weight: bold;">
								PET WE GO 
						    </span>
		                    <img src="/resources/quixlab/images/logo_compact_03.png" alt="" style="width: 80px;">
						</a>
					</div>
		</div>	
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
			<div class="header-content clearfix">

				<div class="nav-control">
					<div class="hamburger">
						<span class="toggle-icon"><i class="icon-menu"></i></span>
					</div>
				</div>
				<div class="header-left">
					<div class="input-group icons">
						<div class="input-group-prepend">
							<span
								class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
								id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
						</div>
						<input type="search" class="form-control" placeholder="검색"
							aria-label="Search Dashboard">
						<div class="drop-down animated flipInX d-md-none">
							<form action="#">
								<input type="text" class="form-control" placeholder="Search">
							</form>
						</div>
					</div>
				</div>
				<div>
					<a href="#" id="mainPage2"><img
						src="../resources/quixlab/images/petwego_logo_05.png" alt=""
						style="float: left; width: 300px; padding-top: 10px; margin-left: 25%;"></a>
				</div>
				<div class="header-right">
					<ul class="clearfix">

						<!-- 로그인 안했을 때 -->
						<sec:authorize access="isAnonymous()">
						<a href="/login/login" style="float: left; padding-top: 12px;">로그인</a>
							<li class="icons dropdown">
								<div class="user-img c-pointer position-relative"
									data-toggle="dropdown">
									<img src="../img/peopleImg/profile.jpg" height="40" width="40"
										alt="">
								</div>
								<div
									class="drop-down dropdown-profile animated fadeIn dropdown-menu">
									<div class="dropdown-content-body">
										<ul>
											<li><a href="/login/login"><i class="icon-user"></i>
													<span>로그인</span></a></li>
											<hr class="my-2">
											<li><a href="/join/join"><i class="icon-key"></i> <span>회원가입</span></a></li>
										</ul>
									</div>
								</div>
							</li>
						</sec:authorize>

						<!-- 로그인 했을 때 -->
						<sec:authorize access="isAuthenticated()">
							
							<p style="float: left; padding-top:12px;"><sec:authentication property="principal.user_id"/></p>
							<a style="float: left; padding-top:12px;" href="/login/logout">&nbsp;&nbsp;로그아웃</a>&nbsp;
							
							<li class="icons dropdown">
								<div class="user-img c-pointer position-relative"
									data-toggle="dropdown">
									<sec:authentication property="principal.fname" var="fname" />
									<c:choose>
										<c:when test="${empty fname  }">
											<img src="../img/peopleImg/profile.jpg" height="40"
												width="40" alt="">
										</c:when>


										<c:when test="${not empty fname  }">
											<img src="../img/peopleImg/${fname }" height="40" width="40"
												alt="">
										</c:when>

										<c:otherwise>

										</c:otherwise>
									</c:choose>
								    
								</div>
								<div
									class="drop-down dropdown-profile animated fadeIn dropdown-menu">
									<div class="dropdown-content-body">
										<ul>
											<li><a href="/mypage/mypage"><i class="icon-user"></i>
													<span>마이페이지</span></a></li>

											<sec:authorize access="hasRole('ROLE_ADMIN')">
												<li><a href="<c:url value='/management/manager_main'/>"><i
														class="fas fa-unlock-alt"></i> <span>관리자페이지</span></a></li>
											</sec:authorize>

											<li><a href="/login/logout"><i class="icon-key"></i>
													<span>로그아웃</span></a></li>
										</ul>
									</div>
								</div>
							</li>
						</sec:authorize>
					</ul>
				</div>
			</div>
		</div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<div class="nk-sidebar">
			<div class="nk-nav-scroll">
				<ul class="metismenu" id="menu">
					<li class="nav-label">Menu</li>
					<li><a class="has-arrow" href="/pic_board/list"
						aria-expanded="false"> <i class="fas fa-dog"></i><span
							class="nav-text" id="myPet">마이펫</span>
					</a></li>
					<li class="mega-menu mega-menu-sm"><a class="has-arrow"
						href="/facility/search" aria-expanded="false"> <i
							class="fas fa-hotel"></i><span class="nav-text" id="reservation">숙소찾기</span>
					</a></li>

					<li><a class="has-arrow" href="/board/list"
						aria-expanded="false"> <i class="far fa-comments"></i> <span
							class="nav-text" id="board">커뮤니티</span>
					</a></li>
					<li><a class="has-arrow" href="/together/listTogether"
						aria-expanded="false"> <i class="far fa-handshake"></i><span
							class="nav-text" id="together">함께가요</span>
					</a></li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="fas fa-headphones"></i> <span
							class="nav-text">고객지원</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="/customerservice/allNotice">공지사항</a></li>
							<li><a href="/customerservice/List">문의사항</a></li>
						</ul></li>

					<li><a class="has-arrow" href="/mypage/mypage"
						aria-expanded="false"> <i class="far fa-user"></i></i> <span
							class="nav-text" id="myPage">마이페이지</span>
					</a></li>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li><a class="has-arrow"
							href="<c:url value='/management/manager_main'/>"
							aria-expanded="false"> <i class="fas fa-unlock-alt"></i> <span
								class="nav-text" id="management">관리자페이지</span>
						</a></li>
					</sec:authorize>
				</ul>
			</div>
		</div>
		<!--**********************************
            Sidebar end
        ***********************************-->

		<div class="content-body">

			<!--       view페이지 작업할때 민아가 준 Quixlab사이트에서  f12누르고  <div class="content-body"> 검색 후 다음 코드부터 복사 한 후 작업 시작 -->
			<!--       ex) -->
			<!--       <div class="content-body"> -->

			<!--       여기서부터 코드 긁어오면 됌 -->
			<!--          <div class="어쩌구저쩌구"> -->

			<a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top"
				role="button" style="background-color: #4AD4C7; border: none;"><i
				class="mdi mdi-format-wrap-top-bottom" style="color: white;"></i></a>