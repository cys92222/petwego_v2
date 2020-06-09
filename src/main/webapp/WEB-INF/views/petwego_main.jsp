<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>PET WE GO</title>
<script type="text/javascript">
	$(function() {
		$("#mypet").click(function() {
			location.href = "/pic_board/list";
		});
	});
	$(function() {
		$("#reservation").click(function() {
			location.href = "/pic_board/list";
		});
	});
	$(function() {
		$("#board").click(function() {
			location.href = "/board/list";
		});
	});
	$(function() {
		$("#together").click(function() {
			location.href = "/together/listTogether";
		});
	});
	$(function() {
		$("#admin").click(function() {
			location.href = "/customerservice/index";
		});
	});
	$(function() {
		$("#mypage").click(function() {
			location.href = "/mypage/mypage";
		});
	});

	$(function() {

		$("#popbtn").click(function() {
			//    $(".login").click(function(){
			$('div.modal').modal();
		})

	})
</script>
</head>
<body>
	<div class="container-fluid" style="padding: 0;">
		<div class="col-lg-12" style="padding: 0;">
			<div class="card">
				<div class="card-body" style="padding: 0;">
					<div class="bootstrap-carousel">
						<div data-ride="carousel" class="carousel slide"
							id="carouselExampleCaptions">
							<ol class="carousel-indicators">
								<li class="" data-slide-to="0"
									data-target="#carouselExampleCaptions"></li>
								<li data-slide-to="1" data-target="#carouselExampleCaptions"
									class=""></li>
								<li data-slide-to="2" data-target="#carouselExampleCaptions"
									class="active"></li>
							</ol>
							<div class="carousel-inner">
								<div class="carousel-item">
									<img class="d-block w-100" src="../img/mainImg/m_1.jpg" alt=""
										style="max-width: 100%;">
										
								
								</div>
								
								<div class="carousel-item">
									<img alt="" class="d-block w-100" src="../img/mainImg/m_2.jpg"
										style="max-width: 100%;">
								
								</div>
								<div class="carousel-item active">
									<img alt="" class="d-block w-100" src="../img/mainImg/m_3.jpg"
										style="max-width: 100%;">
									
								</div>
							</div>
							<a data-slide="prev" href="#carouselExampleCaptions"
								class="carousel-control-prev"><span
								class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span>
							</a><a data-slide="next" href="#carouselExampleCaptions"
								class="carousel-control-next"><span
								class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<h2 style="text-align: center; font-family: sans-serif; padding-bottom: 30px;">기능
			소개</h2>
		<div class="col-md-12">
			<div class="card">
				<div class="card-body">

					<div class="tab-content br-n pn">
						<div id="navpills-1" class="tab-pane active">
							<div class="row align-items-center">
								<div class="col-sm-6 col-md-4 col-xl-3">
									<img src="../img/mainImg/a-9.jpg" alt=""
										class="img-fluid thumbnail m-r-15">
								</div>
								<div class="col-sm-6 col-md-8 col-xl-9">
									<h3>My Pet</h3>
									<a href="../pic_board/list">바로가기</a>
									<br> <br>
									<p><b>[마이펫]</b> 사랑스러운 반려동물을 소개해 주세요!</p>
									<p>나의 반려동물 사진을 뽐내고 다른 회원들과 팔로우하며 서로 소통하는 공간! 
									반려동물 sns 공간입니다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-12">	
			<div class="card">
				<div class="card-body">

					<div class="tab-content br-n pn">
						<div id="navpills2-1" class="tab-pane active">
							<div class="row align-items-center text-right">
								<div class="col-sm-6 col-md-8 col-xl-9">
									<h3>Go Together</h3>
									<a href="../together/listTogether">바로가기</a>
									<br> <br>
									<p><b>[함께가요]</b> 반려동물을 사랑하는 사람들과 친구가 되어 여행을 떠나보세요!</p>
									<p>내가 가고싶은 장소와 날짜를 정해 함께 여행을 떠날 모임원들을 모집하거나
									개설되어있는 모임에 참여해보세요. 좋은 사람들도 만나고 반려동물들에게도 친구를 만들어줄 수 있는 기회!</p>
								</div>
								<div class="col-sm-6 col-md-4 col-xl-3">
									<img src="../img/mainImg/a-8.jpg" alt=""
										class="img-fluid thumbnail m-r-15">
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

		<div class="col-md-12">
			<div class="card">
				<div class="card-body">
					<div class="tab-content br-n pn">
						<div id="navpills-1" class="tab-pane active">
							<div class="row align-items-center">
								<div class="col-sm-6 col-md-4 col-xl-3">
									<img src="../img/mainImg/a-10.jpg" alt=""
										class="img-fluid thumbnail m-r-15">
								</div>
								<div class="col-sm-6 col-md-8 col-xl-9">
									<h3>Communication</h3>
									<a href="../board/list">바로가기</a>
									<br> <br>
									<p><b>[커뮤니티]</b> 반려동물에 대한 정보를 주고받는 자유게시판!</p>
									<p>반려동물에 대한 사소한 지식, 반려동물을 키우는 꿀팁부터 
									자유로운 수다까지 주고받는 공간! <br>다양한 대화를 나눠보세요!</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-12">
			<div class="card">
				<div class="card-body">
					<div class="tab-content br-n pn">
						<div id="navpills2-1" class="tab-pane active">
							<div class="row align-items-center text-right">
								<div class="col-sm-6 col-md-8 col-xl-9">
									<h3>Reservation</h3>
									<a href="#">바로가기</a>
									<br> <br>
									<p><b>[예약]</b> 반려동물 동반이 가능한 호텔을 예약해 보세요! </p>
									<p>일반 호텔이 아닌, 반려동물과 동반 가능한 호텔 목록만 보여드립니다.
									예약부터 결제까지 편안하게 하실 수 있도록 펫위고가 도와드립니다!</p>
								</div>
								<div class="col-sm-6 col-md-4 col-xl-3">
									<img src="../img/mainImg/a-11.jpg" alt=""
										class="img-fluid thumbnail m-r-15">
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<h2 style="text-align: center; font-family: sans-serif;">직원을
			소개합니다.</h2>
		<div class="row" style="padding: 15px;">
			<div class="col-md-4 col-sm-6">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<img src="../img/peopleImg/wonwoo.jpg" class="rounded-circle" alt=""
								width="150" height="150">
							<h5 class="mt-3 mb-1">Won Woo</h5>
							<p class="m-0">Developer</p>
							<!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 col-sm-6">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<img src="../img/peopleImg/ys.png" class="rounded-circle" alt=""
								width="150" height="150">
							<h5 class="mt-3 mb-1">YungSoo</h5>
							<p class="m-0">Developer</p>
							<!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 col-sm-6">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<img src="../img/peopleImg/jjack.jpg" class="rounded-circle" alt=""
								width="150" height="150">
							<h5 class="mt-3 mb-1">SuIn</h5>
							<p class="m-0">Developer</p>
							<!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
						</div>
					</div>
				</div>
			</div>


			<div class="col-md-4 col-sm-6">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<img src="../img/peopleImg/minah.png" class="rounded-circle" alt=""
								width="150" height="150">
							<h5 class="mt-3 mb-1">MinAh</h5>
							<p class="m-0">Developer</p>
							<!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 col-sm-6">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<img src="../img/peopleImg/a-3.jpg" class="rounded-circle" alt=""
								width="150" height="150">
							<h5 class="mt-3 mb-1">JooRaNo</h5>
							<p class="m-0">Developer</p>
							<!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 col-sm-6">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<img src="../img/peopleImg/hj.png" class="rounded-circle" alt=""
								width="150" height="150">
							<h5 class="mt-3 mb-1">HeeJae</h5>
							<p class="m-0">Planner</p>
							<!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12" style="padding: 0;">
				<div class="card">
					<div class="card-body" style="padding: 0; position: relative;">
						<img src="../img/mainImg/a-12.jpg" alt="" width="100%;">
						<div
							style="right: 50px; top: 100px; width: 450px; bottom: 140px; font-size: 1.8em; font-weight: bold; position: absolute;">
							<h1 style="color: white; font-size: 4rem;">Shall we go?</h1>
							<br>
							<h2 style="color: white; font-size: 2.5rem">with your pet</h2>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
</body>

</html>
