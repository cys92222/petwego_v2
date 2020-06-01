<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
	$(function() {

		//사람 정보 수정
		$("#people_info_up_btn")
				.click(
						function() {
							window.location.href = "/mypage/people_info_up_form?user_id=${myinfo.user_id }";
						});

		//동물 정보 수정
		$("#animal_info_up_btn")
				.click(
						function() {
							window.location.href = "/mypage/animal_info_up_form?user_id=${myinfo.user_id }";
						});

		//회원탈퇴
		$("#widthdraw_btn").click(function() {
			var ck = confirm("탈퇴하시겠습니까?");
			if (ck == true) {
				var data = {
					user_id : $("#user_id").val()
				};
				// 			alert(data);
				$.ajax("/mypage/delete_member", {
					data : data,
					success : function(re) {
						// 				alert(re);
						//				컨트롤러에서 return "/MainPage"; 으로 /MainPage 받아와서 href로 이동
						window.location.href = re;
					}
				});
				// 			alert("탈퇴");
			} else {

			}
		});

	});
</script>
</head>
<body>

	<div class="row">
		<div class="col-3">
			<div class="card card-widget">
				<div class="card-body gradient-3">
					<div class="media">
						<span class="card-widget__icon"><i class="icon-home"></i></span>
						<div class="media-body">
							<!-- 							<h5 class="card-widget__subtitle">마이페이지</h5> -->
							<h1 style="color: white;">마이페이지</h1>
						</div>
					</div>
				</div>
			</div>
		</div>

		알림 리스트 수정예정<br>
		<!-- 자유게시판 -->
		<c:if test="${search_insert_board_alarm_count>0 }">
		자유게시판 신규 댓글 수 : ${search_insert_board_alarm_count } 개 입니다<br>
			<c:forEach items="${search_insert_board_alarm }"
				var="search_insert_board_alarm">
			${search_insert_board_alarm.in_user_id } 님이 댓글을 등록했습니다 <a
					href="/board/get?board_no=${search_insert_board_alarm.t_num }">게시물로
					이동</a>
			</c:forEach>
			<br>
		</c:if>

		<c:if test="${search_cancle_board_alarm_count>0 }">
		자유게시판 취소 댓글 수 : ${search_cancle_board_alarm_count } 개 입니다<br>
			<c:forEach items="${search_cancle_board_alarm }"
				var="search_cancle_board_alarm">
			${search_cancle_board_alarm.in_user_id } 님이 댓글을 삭제했습니다 <a>확인</a>
			</c:forEach>
			<br>
		</c:if>

		<!-- 함께가요 -->
		<c:if test="${search_insert_together_count>0 }">
		함께가요 신청자 수 : ${search_insert_together_count } 명 입니다<br>
			<c:forEach items="${search_insert_together_alarm }"
				var="search_insert_together_alarm">
			${search_insert_together_alarm.in_user_id } 님 <a
					href="/mypage/check_alarm_in?user_id=${search_insert_together_alarm.user_id }&in_user_id=${search_insert_together_alarm.in_user_id }">확인</a>
				<br>
			</c:forEach>
			<br>
		</c:if>

		<c:if test="${search_cancle_together_count>0 }">
		함께가요 취소자 수 : ${search_cancle_together_count } 명 입니다<br>
			<c:forEach items="${search_cancle_together_alarm }"
				var="cancle_together_alarm">
			${cancle_together_alarm.in_user_id } 님 <a
					href="/mypage/check_alarm_cancle?user_id=${cancle_together_alarm.user_id }&in_user_id=${cancle_together_alarm.in_user_id }">확인</a>
				<br>
			</c:forEach>
			<br>
		</c:if>

		<hr>

		<div class="container-fluid">
			<div class="row">
				<!-- 반려인 정보 -->
				<div class="col-lg-4 col-xl-3">
					<div class="card text-center">
						<div class="card-body">
							<div class="media align-items-center justify-content-center mb-4">
								<div
									class="text-center d-flex flex-column justify-content-center">
									<div class="row mb-5 d-flex flex-column align-items-center">
										<h2>반려인 정보</h2>
										<img class="rounded-circle" alt="사진이 없습니다"
											src="/img/peopleImg/${myinfo.fname }" width="100"
											height="100">
									</div>
									<h3 class="mb-0">${myinfo.user_id }</h3>
									<h3 class="mb-0">(${myinfo.nick_name })</h3>
									<p class="text-muted mb-0">${myinfo.address }</p>
								</div>
							</div>


							<h4>자기소개</h4>
							<p class="text-muted">${myinfo.intro }</p>
							<ul class="card-profile__info">
								<li class="mb-1"><strong class="text-dark mr-4">전화번호</strong>
									<span>${myinfo.tel }</span></li>
								<li><strong class="text-dark mr-4">이메일</strong> <span>${myinfo.email }</span></li>
							</ul>
							<button class="btn btn-primary" id="people_info_up_btn">수정하기</button>
						</div>
					</div>
				</div>
				<!-- 		반려인 정보 끝	 -->


				<div class="col-lg-8 col-xl-9">


					<div class="card">
						<div class="card-body">
							<h2>반려동물 정보</h2>

							<!-- 동물 정보 -->
							<div class="media media-reply">
								<c:forEach items="${animal_list }" var="a" begin="0" end="3">
									<img class="mr-3 circle-rounded"
										src="/img/animalImg/${a.pet_pic }" width="100" height="100"
										alt="반려동물 사진">
									<div class="media-body">
										<div class="d-sm-flex justify-content-between mb-2">
											<h5 class="mb-sm-0">
												반려동물 이름 (${a.pet_name }) <small class="text-muted ml-3">반려시작일
													(${a.pet_date })</small>
											</h5>
										</div>

										<p>반려동물 소개 (${a.pet_type }) / 칼럼 추가해야될거같음</p>
									</div>
								</c:forEach>
							</div>
							<!-- 동물 정보 끝						 -->

							<button class="btn btn-primary" id="animal_info_up_btn">수정하기</button>
						</div>
					</div>





				</div>
			</div>

			<!-- 내가쓴글 ~ 리스트 -->

			<div class="card">
				<div class="card-body">
					<h4 class="card-title">나의 활동 내역</h4>
					<!-- Nav tabs -->
					<div class="default-tab">
						<ul class="nav nav-tabs mb-3" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#board_list">자유게시판 작성글</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#together_list">함께가요 작성글</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#pic_board_list">sns 작성글</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#reservation_list">예약 내역</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#payment_list">결제 내역</a></li>
						</ul>
						<div class="tab-content">

							<!-- 					자유게시판 -->
							<div class="tab-pane fade show active" id="board_list"
								role="tabpanel">
								<div class="p-t-15">
									<c:forEach var="b" items="${myboard }" begin="0" end="5">
										<h4>
											<a href="/board/get?board_no=${b.board_no}">${b.board_title }</a>
										</h4>
									</c:forEach>
								</div>
								<a href="/mypage/board_list?user_id=${myinfo.user_id }">더보기</a><br>
							</div>
							<!-- 						자유게시판 끝 -->

							<!-- 함께가요 -->
							<div class="tab-pane fade" id="together_list">
								<div class="p-t-15">
									<c:forEach var="to" items="${mytogether }" begin="0" end="5">
										<h4>
											<a href="/together/detailTogether?t_num=${to.t_num}">${to.t_title }</a>
										</h4>
									</c:forEach>
								</div>
								<a href="/mypage/together_list?user_id=${myinfo.user_id }">더보기</a><br>
							</div>
							<!-- 						함께가요 끝 -->

							<!-- sns  -->
							<div class="tab-pane fade" id="pic_board_list">
								<div class="p-t-15">
									<c:forEach var="sns" items="${mysns }" begin="0" end="5">
										<h4>글번호 ${sns.photo_no }</h4>
									</c:forEach>
								</div>
								<a href="/mypage/sns_list?user_id=${myinfo.user_id }">더보기</a><br>
							</div>
							<!-- 						sns 끝 -->

							<!-- 예약 -->
							<div class="tab-pane fade" id="reservation_list">
								<div class="p-t-15">
									<table border="1" width="80%">
										<tr>
											<th>예약번호</th>
											<th>체크인</th>
											<th>체크아웃</th>
											<th>사람수</th>
											<th>동물수</th>
											<th>예약상태</th>
											<th>예약자이름</th>
											<th>예약자전화번호</th>
										</tr>
										<c:forEach items="${reservation }" var="rs">
											<tr>
												<td>${rs.rsv_no }</td>
												<td>${rs.check_in }</td>
												<td>${rs.check_out }</td>
												<td>${rs.human_num }</td>
												<td>${rs.pet_num }</td>
												<td>${rs.rsv_paid }</td>
												<td>${rs.guest_name }</td>
												<td>${rs.guest_tel }</td>
											</tr>
										</c:forEach>
									</table>
								</div>
								<a href="/mypage/reservation_list?user_id=${login_id }">더보기</a>
							</div>
							<!-- 						에약 끝 -->

							<!-- 결제 -->
							<div class="tab-pane fade" id="payment_list">
								<div class="p-t-15">
									<table border="1" width="80%">
										<tr>
											<th>고유결제번호</th>
											<th>상점거래id</th>
											<th>결제금액</th>
											<th>결제수단</th>
											<th>카드승인번호</th>
											<th>결제승인시각</th>
											<th>결제상태</th>
											<th>예약번호</th>
											<th>아이디</th>
										</tr>
										<c:forEach items="${search_pay }" var="search_pay" begin="0"
											end="5">
											<tr>
												<td>${search_pay.imp_uid }</td>
												<td>${search_pay.merchant_uid }</td>
												<td>${search_pay.paid_amount }</td>
												<td>${search_pay.pay_method }</td>
												<td>${search_pay.apply_num }</td>
												<td>${search_pay.paid_time }</td>
												<td>${search_pay.status }</td>
												<td>${search_pay.rsv_no }</td>
												<td>${search_pay.user_id }</td>
											</tr>
										</c:forEach>
									</table>
								</div>
								<a href="/mypage/pay_list">더보기</a><br>
							</div>
							<!-- 						결제끝 -->

						</div>
					</div>
				</div>
			</div>
			<!-- 내가쓴글 ~ 리스트 끝 -->

			<!-- 				방명록 -->
			<div class="card">
				<div class="card-body">
					<form action="#" class="form-profile">
						<h2>방명록</h2>
						<div class="form-group">
							<textarea class="form-control" name="textarea" id="textarea"
								cols="30" rows="2" placeholder="발자취를 남겨주세요 (칼럼추가해야됨)"></textarea>
						</div>
						<div class="d-flex align-items-center">
							<ul class="mb-0 form-profile__icons">
								<li class="d-inline-block">
									<button class="btn btn-transparent p-0 mr-3">
										<i class="fa fa-user"></i>
									</button>
								</li>
								<li class="d-inline-block">
									<button class="btn btn-transparent p-0 mr-3">
										<i class="fa fa-paper-plane"></i>
									</button>
								</li>
								<li class="d-inline-block">
									<button class="btn btn-transparent p-0 mr-3">
										<i class="fa fa-camera"></i>
									</button>
								</li>
								<li class="d-inline-block">
									<button class="btn btn-transparent p-0 mr-3">
										<i class="fa fa-smile"></i>
									</button>
								</li>
							</ul>
							<button class="btn btn-primary px-3 ml-4">등록하기</button>
						</div>
					</form>
				</div>
			</div>
			<!-- 				방명록  끝-->


		<button class="btn btn-primary px-3 ml-4" id="widthdraw_btn">회원탈퇴</button>


		</div>
		<!-- #/ container -->
</body>
</html>
<%@ include file="../footer.jsp"%>