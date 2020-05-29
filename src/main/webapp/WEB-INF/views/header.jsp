<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>PET WE GO</title>
	<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
	<link rel="icon" href="../assets/img/icon.ico" type="image/x-icon"/>

	<!-- Fonts and icons -->
	<script src="../assets/js/plugin/webfont/webfont.min.js"></script>
	<script>
		WebFont.load({
			google: {"families":["Lato:300,400,700,900"]},
			custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['../assets/css/fonts.min.css']},
			active: function() {
				sessionStorage.fonts = true;
			}
		});
	</script>

	<!-- CSS Files -->
	<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="../assets/css/atlantis.min.css">
	
	<!--   Core JS Files   -->
	<script src="../assets/js/core/jquery.3.2.1.min.js"></script>
	<script src="../assets/js/core/popper.min.js"></script>
	<script src="../assets/js/core/bootstrap.min.js"></script>

	<!-- jQuery UI -->
	<script src="../assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="../assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

	<!-- jQuery Scrollbar -->
	<script src="../assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>


	<!-- Chart JS -->
	<script src="../assets/js/plugin/chart.js/chart.min.js"></script>

	<!-- jQuery Sparkline -->
	<script src="../assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

	<!-- Chart Circle -->
	<script src="../assets/js/plugin/chart-circle/circles.min.js"></script>

	<!-- Datatables -->
	<script src="../assets/js/plugin/datatables/datatables.min.js"></script>
 
	<!-- Bootstrap Notify -->
	<script src="../assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

	<!-- jQuery Vector Maps -->
	<script src="../assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
	<script src="../assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

	<!-- Sweet Alert -->
	<script src="../assets/js/plugin/sweetalert/sweetalert.min.js"></script>

	<!-- Atlantis JS -->
	<script src="../assets/js/atlantis.min.js"></script>
</head>

<div class="wrapper">
	<div class="main-header">
		<!-- Logo Header -->
		<div class="logo-header" data-background-color="white">

			<a href="index.html" class="logo"> <img
				src="../assets/img/petwego_logo.png" alt="navbar brand"
				class="navbar-brand" style="width: 160px; height: 30px;">
			</a>
			<button class="navbar-toggler sidenav-toggler ml-auto" type="button"
				data-toggle="collapse" data-target="collapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"> <i class="icon-menu"></i>
				</span>
			</button>
			<button class="topbar-toggler more">
				<i class="icon-options-vertical"></i>
			</button>
			<div class="nav-toggle">
				<button class="btn btn-toggle toggle-sidebar">
					<i class="icon-menu"></i>
				</button>
			</div>
		</div>
		<!-- End Logo Header -->

		<!-- Navbar Header -->
		<nav class="navbar navbar-header navbar-expand-lg"
			data-background-color="blue2">

			<div class="container-fluid">
				<div class="collapse" id="search-nav">
					<form class="navbar-left navbar-form nav-search mr-md-3">
						<div class="input-group">
							<div class="input-group-prepend">
								<button type="submit" class="btn btn-search pr-1">
									<i class="fa fa-search search-icon"></i>
								</button>
							</div>
							<input type="text" placeholder="Search ..." class="form-control">
						</div>
					</form>
				</div>
				<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
					<li class="nav-item toggle-nav-search hidden-caret"><a
						class="nav-link" data-toggle="collapse" href="#search-nav"
						role="button" aria-expanded="false" aria-controls="search-nav">
							<i class="fa fa-search"></i>
					</a></li>
<!-- 					<li class="nav-item dropdown hidden-caret"><a -->
<!-- 						class="nav-link dropdown-toggle" href="#" id="notifDropdown" -->
<!-- 						role="button" data-toggle="dropdown" aria-haspopup="true" -->
<!-- 						aria-expanded="false"> <i class="fa fa-bell"></i> <span -->
<!-- 							class="notification">4</span> -->
							
<!-- 							 알람 수  -->
<!-- 					</a> -->
<!-- 						<ul class="dropdown-menu notif-box animated fadeIn" -->
<!-- 							aria-labelledby="notifDropdown"> -->
<!-- 							<li> -->
<!-- 								<div class="dropdown-title">You have 4 new notification</div> -->
<!-- 							</li> -->
<!-- 							<li> -->
<!-- 								<div class="notif-scroll scrollbar-outer"> -->
<!-- 									<div class="notif-center"> -->
<!-- 										<a href="#"> -->
<!-- 											<div class="notif-icon notif-primary"> -->
<!-- 												<i class="fa fa-user-plus"></i> -->
<!-- 											</div> -->
<!-- 											<div class="notif-content"> -->
<!-- 												<span class="block"> New user registered </span> <span -->
<!-- 													class="time">5 minutes ago</span> -->
<!-- 											</div> -->
<!-- 										</a> <a href="#"> -->
<!-- 											<div class="notif-icon notif-success"> -->
<!-- 												<i class="fa fa-comment"></i> -->
<!-- 											</div> -->
<!-- 											<div class="notif-content"> -->
<!-- 												<span class="block"> Rahmad commented on Admin </span> <span -->
<!-- 													class="time">12 minutes ago</span> -->
<!-- 											</div> -->
<!-- 										</a> <a href="#"> -->
<!-- 											<div class="notif-img"> -->
<!-- 												<img src="../assets/img/profile2.jpg" alt="Img Profile"> -->
<!-- 											</div> -->
<!-- 											<div class="notif-content"> -->
<!-- 												<span class="block"> Reza send messages to you </span> <span -->
<!-- 													class="time">12 minutes ago</span> -->
<!-- 											</div> -->
<!-- 										</a> <a href="#"> -->
<!-- 											<div class="notif-icon notif-danger"> -->
<!-- 												<i class="fa fa-heart"></i> -->
<!-- 											</div> -->
<!-- 											<div class="notif-content"> -->
<!-- 												<span class="block"> Farrah liked Admin </span> <span -->
<!-- 													class="time">17 minutes ago</span> -->
<!-- 											</div> -->
<!-- 										</a> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</li> -->
<!-- 							<li><a class="see-all" href="javascript:void(0);">See -->
<!-- 									all notifications<i class="fa fa-angle-right"></i> -->
<!-- 							</a></li> -->
<!-- 						</ul></li> -->

					<li class="nav-item dropdown hidden-caret"><a
						class="dropdown-toggle profile-pic" data-toggle="dropdown"
						href="#" aria-expanded="false">
						<button id="login-button" name="submit" type="submit" class="btn btn-block btn-primary text-light">로그인</button>\
						
								<!-- 유저 프로필사진이었는데 일단 막아 놓음 -->
<!-- 							<div class="avatar-sm"> -->
<!-- 								<img src="../assets/img/profile.jpg" alt="..." -->
<!-- 									class="avatar-img rounded-circle"> -->
<!-- 							</div> -->
					</a>
						<ul class="dropdown-menu dropdown-user animated fadeIn">
							<div class="dropdown-user-scroll scrollbar-outer">
								<li>		
								<button id="login-button" name="submit" type="submit" class="btn btn-block btn-primary text-light">로그인</button>	
<!-- 									<div class="user-box"> -->
<!-- 										<div class="avatar-lg"> -->
<!-- 											<img src="../assets/img/profile.jpg" alt="image profile" -->
<!-- 												class="avatar-img rounded"> -->
<!-- 										</div> -->
<!-- 										<div class="u-text"> -->
											
<!-- 										</div> -->
<!-- 									</div> -->
								</li>
								<li>
									<div class="dropdown-divider"></div> <a class="dropdown-item"
									href="#">My Profile</a> <a class="dropdown-item" href="#">My
										Balance</a> <a class="dropdown-item" href="#">Inbox</a>
									<div class="dropdown-divider"></div> <a class="dropdown-item"
									href="#">Account Setting</a>
									<div class="dropdown-divider"></div> <a class="dropdown-item"
									href="#">Logout</a>
								</li>
							</div>
						</ul></li>
				</ul>
			</div>
		</nav>
		<!-- End Navbar -->
	</div>

	<!-- Sidebar -->
	<div class="sidebar sidebar-style-2">
		<div class="sidebar-wrapper scrollbar scrollbar-inner">
			<div class="sidebar-content">
				<div class="user">
					<div class="avatar-sm float-left mr-2">
					<!-- 비로그인일때는 디폴트 사진, 로그인 시 자기 프로필 사진으로 -->
<!-- 						<img src="../assets/img/profile.jpg" alt="..." -->
<!-- 							class="avatar-img rounded-circle"> -->
					</div>
					<div class="info">
						<a data-toggle="collapse" href="#collapseExample"
							aria-expanded="true"> <span> Hizrian <span
								class="user-level">Administrator</span> <span class="caret"></span>
						</span>
						</a>
						<div class="clearfix"></div>

						<div class="collapse in" id="collapseExample">
							<ul class="nav">
								<li><a href="#profile"> <span class="link-collapse">My
											Page</span>
								</a></li>
								<li><a href="#edit"> <span class="link-collapse">회원
											정보 수정</span>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
				<ul class="nav nav-primary">
					<li class="nav-section"><span class="sidebar-mini-icon">
							<i class="fa fa-ellipsis-h"></i>
					</span>
						<h4 class="text-section">Menu</h4></li>
					<li class="nav-item"><a href="/pic_board/list">
							<i class="fas fa-layer-group"></i>
							<p>마이펫</p>
					</a></li>
					<li class="nav-item"><a data-toggle="collapse"
						href="#sidebarLayouts"> <i class="fas fa-th-list"></i>
							<p>숙소찾기</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="sidebarLayouts">
							<ul class="nav nav-collapse">
								<li><a href="/reservation/reservation"> <span
										class="sub-item">예약하기</span>
								</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a href="/together/listTogether">
							<i class="fas fa-pen-square"></i>
							<p>함께가요</p>
					</a></li>
					<li class="nav-item"><a href="/board/list">
							<i class="fas fa-table"></i>
							<p>커뮤니티</p>
					</a></li>
					<li class="nav-item"><a data-toggle="collapse" href="#maps">
							<i class="fas fa-map-marker-alt"></i>
							<p>고객지원</p> <span class="caret"></span>
					</a>
						<div class="collapse" id="maps">
							<ul class="nav nav-collapse">
								<li><a href="/customerservice/index"> <span class="sub-item">공지사항</span>
								</a></li>
								<li><a href="/customerservice/index"> <span class="sub-item">문의사항</span>
								</a></li>
							</ul>
						</div></li>
				</ul>
			</div>
		</div>
	</div>

<!-- End Sidebar -->
