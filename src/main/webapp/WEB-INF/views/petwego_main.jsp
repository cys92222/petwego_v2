<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>PET WE GO</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#mypet").click(function(){
		location.href="/pic_board/list";
	});
});
$(function(){
	$("#reservation").click(function(){
		location.href="/pic_board/list";
	});
});
$(function(){
	$("#board").click(function(){
		location.href="/board/list";
	});
});
$(function(){
	$("#together").click(function(){
		location.href="/together/listTogether";
	});
});
$(function(){
	$("#admin").click(function(){
		location.href="/admin/index";
	});
});
$(function(){
	$("#mypage").click(function(){
		location.href="/mypage/mypage";
	});
});
</script>

<!-- Bootstrap core CSS -->
<link href="resources/main/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="resources/main/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link
	href="resources/main/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="resources/main/css/landing-page.min.css" rel="stylesheet">

</head>

<body>
	<%@include file="header.jsp"%>

	<!-- Navigation -->
	<nav class="navbar navbar-light bg-light static-top">
		<div class="container"></div>
		<!--     <div> -->
		<!--     	<a class="btn btn-primary" href="#">Sign In</a> -->
		<!--     </div> -->
	</nav>

	<!-- Masthead -->
	<header class="masthead text-white text-center">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<h1 class="mb-5">반려동물과 함께 떠나는 신나는 여행</h1>
				</div>
				<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
					<form>
						<div class="form-row"></div>
					</form>
				</div>
			</div>
		</div>
	</header>

	<!-- Icons Grid -->
	<section class="features-icons bg-light text-center">
		<div class="container">
			<div class="row">

				<div class="col-lg-4">
					<div id="mypet" class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
						<div class="features-icons-icon d-flex">
							<i class="icon-star m-auto text-info"></i>
						</div>
						<br>
						<h3>마이펫</h3>
						<p class="lead mb-0">나의 반려동물을 자랑해주세요!</p>
					</div>
				</div>

				<div class="col-lg-4">
					<div id="reservation" class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
						<div class="features-icons-icon d-flex">
							<i class="icon-magnifier m-auto text-info"></i>
						</div>
						<br>
						<h3>숙소찾기</h3>
						<p class="lead mb-0">반려동물과 동반하여 갈 수 있는 숙소를 찾아보세요!</p>
					</div>
				</div>

				<div class="col-lg-4">
					<div id="board" class="features-icons-item mx-auto mb-0 mb-lg-3">
						<div class="features-icons-icon d-flex">
							<i class="icon-bubble m-auto text-info"></i>
						</div>
						<br>
						<h3>커뮤니티</h3>
						<p class="lead mb-0">궁금한 것, 하고 싶은 말, 다 해보기!</p>
					</div>
				</div>

				<div class="col-lg-4">
					<div id="together" class="features-icons-item mx-auto mb-0 mb-lg-3">
						<div class="features-icons-icon d-flex">
							<i class="icon-share m-auto text-info"></i>
						</div>
						<br>
						<h3>함께가요</h3>
						<p class="lead mb-0">내 반려동물의 친구를 만들어 주세요!</p>
					</div>
				</div>

				<div class="col-lg-4">
					<div id="admin" class="features-icons-item mx-auto mb-0 mb-lg-3">
						<div class="features-icons-icon d-flex">
							<i class="icon-bulb m-auto text-info"></i>
						</div>
						<br>
						<h3>고객지원</h3>
						<p class="lead mb-0">공지사항, 문의사항은 여기서 확인!</p>
					</div>
				</div>

				<div class="col-lg-4">
					<div id="mypage" class="features-icons-item mx-auto mb-0 mb-lg-3">
						<div class="features-icons-icon d-flex">
							<i class="icon-info m-auto text-info"></i>
						</div>
						<br>
						<h3>마이페이지</h3>
						<p class="lead mb-0">내 활동 내역, 결제내역 확인!</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Image Showcases -->
	<section class="showcase">
		<div class="container-fluid p-0">
			<div class="row no-gutters">

				<div class="col-lg-6 order-lg-2 text-white showcase-img"
					style="background-image: url('resources/main/img/bg-pic-03.jpg');"></div>
				<div class="col-lg-6 order-lg-1 my-auto showcase-text">
					<h2>내 아이에게 잊지 못할 추억을</h2>
					<p class="lead mb-0">하루하루 집에만 있기 답답하거나 혼자 갈 용기가 없다면 함께가요 콘텐츠를
						통하여 마음맞는 친구끼리 함께 여행을 떠나보아요!</p>
				</div>
			</div>
			<div class="row no-gutters">
				<div class="col-lg-6 text-white showcase-img"
					style="background-image: url('resources/main/img/bg-pic-02.jpg');"></div>
				<div class="col-lg-6 my-auto showcase-text">
					<h2>Updated For Bootstrap 4</h2>
					<p class="lead mb-0">Newly improved, and full of great utility
						classes, Bootstrap 4 is leading the way in mobile responsive web
						development! All of the themes on Start Bootstrap are now using
						Bootstrap 4!</p>
				</div>
			</div>
			<div class="row no-gutters">
				<div class="col-lg-6 order-lg-2 text-white showcase-img"
					style="background-image: url('resources/main/img/bg-pic-01.jpg');"></div>
				<div class="col-lg-6 order-lg-1 my-auto showcase-text">
					<h2>Easy to Use &amp; Customize</h2>
					<p class="lead mb-0">Landing Page is just HTML and CSS with a
						splash of SCSS for users who demand some deeper customization
						options. Out of the box, just add your content and images, and
						your new landing page will be ready to go!</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Testimonials -->
	<section class="testimonials text-center bg-light">
		<div class="container">
			<h2 class="mb-5">저희 직원들을 소개합니다.</h2>
			<div class="row">
				<div class="col-lg-4">
					<div class="testimonial-item mx-auto mb-5 mb-lg-0">
						<img class="img-fluid rounded-circle mb-3"
							src="resources/main/img/testimonials-1.jpg" alt="">
						<h5>Margaret E.</h5>
						<p class="font-weight-light mb-0">"This is fantastic! Thanks
							so much guys!"</p>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="testimonial-item mx-auto mb-5 mb-lg-0">
						<img class="img-fluid rounded-circle mb-3"
							src="resources/main/img/testimonials-2.jpg" alt="">
						<h5>Fred S.</h5>
						<p class="font-weight-light mb-0">"Bootstrap is amazing. I've
							been using it to create lots of super nice landing pages."</p>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="testimonial-item mx-auto mb-5 mb-lg-0">
						<img class="img-fluid rounded-circle mb-3"
							src="resources/main/img/testimonials-3.jpg" alt="">
						<h5>Sarah W.</h5>
						<p class="font-weight-light mb-0">"Thanks so much for making
							these free resources available to us!"</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Call to Action -->
	<section class="call-to-action text-white text-center">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<h1 class="mb-4">Shall we go?</h1>
					<br>
					<h2 class="mb-4">with your pet</h2>
				</div>
				<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
					<form>
						<div class="form-row"></div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<%@include file="footer.jsp"%>

</body>

</html>
