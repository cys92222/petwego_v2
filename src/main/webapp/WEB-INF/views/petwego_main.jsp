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
									<img class="d-block w-100" src="../img/a-1.jpg" alt=""
										style="max-width: 100%;">
									<div class="carousel-caption d-none d-md-block">
										<h5>First slide label</h5>
										<p>Nulla vitae elit libero, a pharetra augue mollis
											interdum.</p>
									</div>
								</div>
								<div class="carousel-item">
									<img alt="" class="d-block w-100" src="../img/a-2.jpg"
										style="max-width: 100%;">
									<div class="carousel-caption d-none d-md-block">
										<h5>Second slide label</h5>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit.</p>
									</div>
								</div>
								<div class="carousel-item active">
									<img alt="" class="d-block w-100" src="../img/a-4.jpg"
										style="max-width: 100%;">
									<div class="carousel-caption d-none d-md-block">
										<h5>Third slide label</h5>
										<p>Praesent commodo cursus magna, vel scelerisque nisl
											consectetur.</p>
									</div>
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
									<img src="../img/a-9.jpg" alt=""
										class="img-fluid thumbnail m-r-15">
								</div>
								<div class="col-sm-6 col-md-8 col-xl-9">
									<h3>My Pet</h3>
									<a href="../pic_board/list">바로가기</a>
									<br> <br>
									<p>Raw denim you probably haven't heard of them jean shorts
										Austin. Nesciunt tofu stumptown aliqua, retro synth master
										cleanse. Mustache cliche tempor, williamsburg carles vegan
										helvetica.</p>
									<p>Reprehenderit butcher retro keffiyeh dreamcatcher synth.
										Cosby sweater eu banh mi, qui irure terry richardson ex squid.</p>
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
									<p>Lorem, ipsum dolor sit amet consectetur adipisicing
										elit. Nobis architecto dolor quidem temporibus, itaque
										aliquid, quasi nulla adipisci laborum quaerat impedit quae,
										tenetur laudantium tempore deleniti commodi quod praesentium
										fugiat.</p>
									<p>Reprehenderit butcher retro keffiyeh dreamcatcher synth.
										Cosby sweater eu banh mi, qui irure terry richardson ex squid.</p>
								</div>
								<div class="col-sm-6 col-md-4 col-xl-3">
									<img src="../img/a-8.jpg" alt=""
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
									<img src="../img/a-10.jpg" alt=""
										class="img-fluid thumbnail m-r-15">
								</div>
								<div class="col-sm-6 col-md-8 col-xl-9">
									<h3>Communication</h3>
									<a href="../board/list">바로가기</a>
									<br> <br>
									<p>Raw denim you probably haven't heard of them jean shorts
										Austin. Nesciunt tofu stumptown aliqua, retro synth master
										cleanse. Mustache cliche tempor, williamsburg carles vegan
										helvetica.</p>
									<p>Reprehenderit butcher retro keffiyeh dreamcatcher synth.
										Cosby sweater eu banh mi, qui irure terry richardson ex squid.</p>
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
									<p>Lorem, ipsum dolor sit amet consectetur adipisicing
										elit. Nobis architecto dolor quidem temporibus, itaque
										aliquid, quasi nulla adipisci laborum quaerat impedit quae,
										tenetur laudantium tempore deleniti commodi quod praesentium
										fugiat.</p>
									<p>Reprehenderit butcher retro keffiyeh dreamcatcher synth.
										Cosby sweater eu banh mi, qui irure terry richardson ex squid.</p>
								</div>
								<div class="col-sm-6 col-md-4 col-xl-3">
									<img src="../img/a-11.jpg" alt=""
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
							<img src="../img/wonwoo.jpg" class="rounded-circle" alt=""
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
							<img src="../img/ys.png" class="rounded-circle" alt=""
								width="150" height="150">
							<h5 class="mt-3 mb-1">0 soo</h5>
							<p class="m-0">Store Manager</p>
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
							<h5 class="mt-3 mb-1">쓔</h5>
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
							<img src="../img/a-3.jpg" class="rounded-circle" alt=""
								width="150" height="150">
							<h5 class="mt-3 mb-1">Ana Liem</h5>
							<p class="m-0">Senior Manager</p>
							<!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 col-sm-6">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<img src="../img/a-3.jpg" class="rounded-circle" alt=""
								width="150" height="150">
							<h5 class="mt-3 mb-1">John Abraham</h5>
							<p class="m-0">Store Manager</p>
							<!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 col-sm-6">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<img src="../img/a-3.jpg" class="rounded-circle" alt=""
								width="150" height="150">
							<h5 class="mt-3 mb-1">John Doe</h5>
							<p class="m-0">Sales Man</p>
							<!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12" style="padding: 0;">
				<div class="card">
					<div class="card-body" style="padding: 0; position: relative;">
						<img src="../img/a-12.jpg" alt="" width="100%;">
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
