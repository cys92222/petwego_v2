<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<%@ include file="../head.jsp"%>
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
	<h1>마이페이지</h1>
	알림 리스트
	<br>
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
			<div class="col-lg-4 col-xl-3">
				<div class="card text-center">
					<div class="card-body">
						<div class="media align-items-center justify-content-center mb-4">
							<div class="text-center d-flex flex-column justify-content-center">
								<div class="row mb-5 d-flex flex-column align-items-center">
								<h2>반려인 정보</h2>
									<img class="rounded-circle" alt="사진이 없습니다" src="/img/peopleImg/${myinfo.fname }"
										width="100" height="100">
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
			<div class="col-lg-8 col-xl-9">
				<div class="card">
					<div class="card-body">
						<form action="#" class="form-profile">
							<div class="form-group">
								<textarea class="form-control" name="textarea" id="textarea"
									cols="30" rows="2" placeholder="Post a new message"></textarea>
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
								<button class="btn btn-primary px-3 ml-4">Send</button>
							</div>
						</form>
					</div>
				</div>

				<div class="card">
					<div class="card-body">
						<div class="media media-reply">
							<img class="mr-3 circle-rounded" src="images/avatar/2.jpg"
								width="50" height="50" alt="Generic placeholder image">
							<div class="media-body">
								<div class="d-sm-flex justify-content-between mb-2">
									<h5 class="mb-sm-0">
										Milan Gbah <small class="text-muted ml-3">about 3 days
											ago</small>
									</h5>
									<div class="media-reply__link">
										<button class="btn btn-transparent p-0 mr-3">
											<i class="fa fa-thumbs-up"></i>
										</button>
										<button class="btn btn-transparent p-0 mr-3">
											<i class="fa fa-thumbs-down"></i>
										</button>
										<button
											class="btn btn-transparent text-dark font-weight-bold p-0 ml-2">Reply</button>
									</div>
								</div>

								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel
									metus scelerisque ante sollicitudin. Cras purus odio,
									vestibulum in vulputate at, tempus viverra turpis. Fusce
									condimentum nunc ac nisi vulputate fringilla. Donec lacinia
									congue felis in faucibus.</p>
								<ul>
									<li class="d-inline-block"><img class="rounded" width="60"
										height="60" src="images/blog/2.jpg" alt=""></li>
									<li class="d-inline-block"><img class="rounded" width="60"
										height="60" src="images/blog/3.jpg" alt=""></li>
									<li class="d-inline-block"><img class="rounded" width="60"
										height="60" src="images/blog/4.jpg" alt=""></li>
									<li class="d-inline-block"><img class="rounded" width="60"
										height="60" src="images/blog/1.jpg" alt=""></li>
								</ul>

								<div class="media mt-3">
									<img class="mr-3 circle-rounded circle-rounded"
										src="images/avatar/4.jpg" width="50" height="50"
										alt="Generic placeholder image">
									<div class="media-body">
										<div class="d-sm-flex justify-content-between mb-2">
											<h5 class="mb-sm-0">
												Milan Gbah <small class="text-muted ml-3">about 3
													days ago</small>
											</h5>
											<div class="media-reply__link">
												<button class="btn btn-transparent p-0 mr-3">
													<i class="fa fa-thumbs-up"></i>
												</button>
												<button class="btn btn-transparent p-0 mr-3">
													<i class="fa fa-thumbs-down"></i>
												</button>
												<button
													class="btn btn-transparent p-0 ml-3 font-weight-bold">Reply</button>
											</div>
										</div>
										<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel
											metus scelerisque ante sollicitudin. Cras purus odio,
											vestibulum in vulputate at, tempus viverra turpis. Fusce
											condimentum nunc ac nisi vulputate fringilla. Donec lacinia
											congue felis in faucibus.</p>
									</div>
								</div>
							</div>
						</div>

						<div class="media media-reply">
							<img class="mr-3 circle-rounded" src="images/avatar/2.jpg"
								width="50" height="50" alt="Generic placeholder image">
							<div class="media-body">
								<div class="d-sm-flex justify-content-between mb-2">
									<h5 class="mb-sm-0">
										Milan Gbah <small class="text-muted ml-3">about 3 days
											ago</small>
									</h5>
									<div class="media-reply__link">
										<button class="btn btn-transparent p-0 mr-3">
											<i class="fa fa-thumbs-up"></i>
										</button>
										<button class="btn btn-transparent p-0 mr-3">
											<i class="fa fa-thumbs-down"></i>
										</button>
										<button class="btn btn-transparent p-0 ml-3 font-weight-bold">Reply</button>
									</div>
								</div>

								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel
									metus scelerisque ante sollicitudin. Cras purus odio,
									vestibulum in vulputate at, tempus viverra turpis. Fusce
									condimentum nunc ac nisi vulputate fringilla. Donec lacinia
									congue felis in faucibus.</p>
							</div>
						</div>

						<div class="media media-reply">
							<img class="mr-3 circle-rounded" src="images/avatar/2.jpg"
								width="50" height="50" alt="Generic placeholder image">
							<div class="media-body">
								<div class="d-sm-flex justify-content-between mb-2">
									<h5 class="mb-sm-0">
										Milan Gbah <small class="text-muted ml-3">about 3 days
											ago</small>
									</h5>
									<div class="media-reply__link">
										<button class="btn btn-transparent p-0 mr-3">
											<i class="fa fa-thumbs-up"></i>
										</button>
										<button class="btn btn-transparent p-0 mr-3">
											<i class="fa fa-thumbs-down"></i>
										</button>
										<button class="btn btn-transparent p-0 ml-3 font-weight-bold">Reply</button>
									</div>
								</div>

								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel
									metus scelerisque ante sollicitudin. Cras purus odio,
									vestibulum in vulputate at, tempus viverra turpis. Fusce
									condimentum nunc ac nisi vulputate fringilla. Donec lacinia
									congue felis in faucibus.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<section id="info">
			<h2>${myinfo.user_id }(${myinfo.nick_name })님의정보입니다</h2>
			<input type="text" id="user_id" value="${myinfo.user_id }"><br>
			<table>
				<tr>
					<td>
						<div>
							<img alt="사진이 없습니다" src="/img/peopleImg/${myinfo.fname }"
								width="100" height="100"><br>
						</div>
					</td>

					<td>
						<div>
							사람 정보<br>
							<button id="people_info_up_btn">정보 수정</button>
						</div>
					</td>
				</tr>

				<tr>
					<td>동물 리스트</td>
				</tr>
				<tr>
					<th>동물번호</th>
					<th>반려동물 이름</th>
					<th>반려일</th>
					<th>동물종류</th>
					<th>동물사진</th>
				</tr>
				<c:forEach items="${animal_list }" var="a" begin="0" end="3">
					<tr>
						<td>${a.pet_no }</td>
						<td>${a.pet_name }</td>
						<td>${a.pet_date }</td>
						<td>${a.pet_type }</td>
						<td><img alt="사진이 없습니다" src="/img/animalImg/${a.pet_pic }"
							width="100" height="100"><br></td>
					</tr>
				</c:forEach>
				<td>
					<div>
						<button id="animal_info_up_btn">정보 수정</button>
					</div>
				</td>
			</table>
		</section>

		<section id="board_list">
			<h2>${myinfo.user_id }(${myinfo.nick_name })님이작성한 글 입니다</h2>
			<a href="/mypage/board_list?user_id=${myinfo.user_id }">더보기</a><br>

			<ul>
				<c:forEach var="b" items="${myboard }" begin="0" end="5">
					<li><a href="/board/get?board_no=${b.board_no}">${b.board_title }</a>
					</li>
				</c:forEach>
			</ul>
		</section>

		<section id="together_list">
			<h2>${myinfo.user_id }(${myinfo.nick_name })님이작성한 함께가요 글 입니다</h2>
			<a href="/mypage/together_list?user_id=${myinfo.user_id }">더보기</a><br>
			<ul>
				<c:forEach var="to" items="${mytogether }" begin="0" end="5">
					<li><a href="/together/detailTogether?t_num=${to.t_num}">${to.t_title }</a>
					</li>
				</c:forEach>
			</ul>
		</section>

		<section id="sns_list">
			<h2>${myinfo.user_id }(${myinfo.nick_name })님이작성한 sns 글 입니다</h2>
			<a href="/mypage/sns_list?user_id=${myinfo.user_id }">더보기</a><br>
			<ul>
				<c:forEach var="sns" items="${mysns }" begin="0" end="5">
					<li>글번호 ${sns.photo_no }<br>
					</li>
				</c:forEach>
			</ul>
		</section>

		<section id="reserve_list">
			<h2>${myinfo.user_id }(${myinfo.nick_name })님의예약내역입니다</h2>
			<a href="#">더보기</a>
			<table>
				<th>예약번호</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>사람수</th>
				<th>동물수</th>
				<th>예약상태</th>
				<th>예약자이름</th>
				<th>예약자전화번호</th>
				<th>업소이름</th>
				<th>방이름</th>
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
		</section>

		<section id="pay_list">
			<h2>${myinfo.user_id }(${myinfo.nick_name })님의결제내역입니다</h2>
			<a href="/mypage/pay_list">더보기</a><br>
			<table border="1">
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
				<c:forEach items="${search_pay }" var="search_pay" begin="0" end="5">
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
		</section>

		<button id="widthdraw_btn">회원탈퇴</button>


	</div>
	<!-- #/ container -->
	</div>

	<!-- <section id="info"> -->
	<%-- 	<h2>${myinfo.user_id }(${myinfo.nick_name })님의 정보입니다</h2> --%>
	<%-- 	<input type="text" id="user_id" value="${myinfo.user_id }"><br> --%>
	<!-- 	<table> -->
	<!-- 		<tr> -->
	<!-- 			<td> -->
	<!-- 				<div> -->
	<%-- 					<img alt="사진이 없습니다" src="/img/peopleImg/${myinfo.fname }" width="100" height="100"><br> --%>
	<!-- 				</div> -->
	<!-- 			</td> -->

	<!-- 			<td> -->
	<!-- 				<div> -->
	<!-- 					사람 정보<br> -->
	<!-- 					<button id="people_info_up_btn">정보 수정</button> -->
	<!-- 				</div> -->
	<!-- 			</td> -->
	<!-- 		</tr> -->

	<!-- 	<tr><td>동물 리스트</td></tr>	 -->
	<!-- 		<tr> -->
	<!-- 			<th>동물번호</th><th>반려동물 이름</th><th>반려일</th><th>동물종류</th><th>동물사진</th> -->
	<!-- 		</tr> -->
	<%-- 			<c:forEach items="${animal_list }" var="a" begin="0" end="3"> --%>
	<!-- 				<tr> -->
	<%-- 					<td>${a.pet_no }</td><td>${a.pet_name }</td><td>${a.pet_date }</td><td>${a.pet_type }</td> --%>
	<%-- 					<td><img alt="사진이 없습니다" src="/img/animalImg/${a.pet_pic }" width="100" height="100"><br></td> --%>
	<!-- 				</tr> -->
	<%-- 			</c:forEach> --%>
	<!-- 			<td> -->
	<!-- 				<div> -->
	<!-- 					<button id="animal_info_up_btn">정보 수정</button> -->
	<!-- 				</div> -->
	<!-- 			</td> -->
	<!-- 	</table> -->
	<!-- </section> -->

	<!-- <section id="board_list">	 -->
	<%-- 	<h2>${myinfo.user_id }(${myinfo.nick_name })님이 작성한 글 입니다</h2> --%>
	<%-- 	<a href="/mypage/board_list?user_id=${myinfo.user_id }">더보기</a><br> --%>

	<!-- 	<ul> -->
	<%-- 		<c:forEach var="b" items="${myboard }" begin="0" end="5"> --%>
	<!-- 			<li> -->
	<%-- 				<a href="/board/get?board_no=${b.board_no}">${b.board_title }</a> --%>
	<!-- 			</li> -->
	<%-- 		</c:forEach> --%>
	<!-- 	</ul> -->
	<!-- </section>	 -->

	<!-- <section id="together_list"> -->
	<%-- 	<h2>${myinfo.user_id }(${myinfo.nick_name })님이 작성한 함께가요 글 입니다</h2>  --%>
	<%-- 	<a href="/mypage/together_list?user_id=${myinfo.user_id }">더보기</a><br> --%>
	<!-- 	<ul> -->
	<%-- 		<c:forEach var="to" items="${mytogether }" begin="0" end="5"> --%>
	<!-- 			<li> -->
	<%-- 				<a href="/together/detailTogether?t_num=${to.t_num}">${to.t_title }</a> --%>
	<!-- 			</li> -->
	<%-- 		</c:forEach> --%>
	<!-- 	</ul> -->
	<!-- </section> -->

	<!-- <section id="sns_list"> -->
	<%-- 	<h2>${myinfo.user_id }(${myinfo.nick_name })님이 작성한 sns 글 입니다</h2>  --%>
	<%-- 	<a href="/mypage/sns_list?user_id=${myinfo.user_id }">더보기</a><br> --%>
	<!-- 	<ul> -->
	<%-- 		<c:forEach var="sns" items="${mysns }" begin="0" end="5"> --%>
	<!-- 			<li> -->
	<%-- 			글번호 ${sns.photo_no }<br> --%>
	<!-- 			</li> -->
	<%-- 		</c:forEach> --%>
	<!-- 	</ul> -->
	<!-- </section> -->

	<!-- <section id="reserve_list"> -->
	<%-- 	<h2>${myinfo.user_id }(${myinfo.nick_name })님의 예약내역입니다</h2> --%>
	<!-- 	<a href="#">더보기</a> -->
	<!-- 	<table> -->
	<!-- 		<th>예약번호</th><th>체크인</th><th>체크아웃</th><th>사람수</th><th>동물수</th><th>예약상태</th><th>예약자이름</th><th>예약자전화번호</th><th>업소이름</th><th>방이름</th> -->
	<%-- 		<c:forEach items="${reservation }" var="rs"> --%>
	<!-- 			<tr> -->
	<%-- 				<td>${rs.rsv_no }</td><td>${rs.check_in }</td><td>${rs.check_out }</td><td>${rs.human_num }</td><td>${rs.pet_num }</td><td>${rs.rsv_paid }</td><td>${rs.guest_name }</td><td>${rs.guest_tel }</td> --%>
	<!-- 			</tr> -->
	<%-- 		</c:forEach> --%>
	<!-- 	</table> -->
	<!-- </section> -->

	<!-- <section id="pay_list"> -->
	<%-- 	<h2>${myinfo.user_id }(${myinfo.nick_name })님의 결제내역입니다</h2>   --%>
	<!-- 	<a href="/mypage/pay_list">더보기</a><br> -->
	<!-- 	<table border="1"> -->
	<!-- 	<tr> -->
	<!-- 		<th>고유결제번호</th><th>상점거래id</th><th>결제금액</th><th>결제수단</th><th>카드승인번호</th><th>결제승인시각</th><th>결제상태</th><th>예약번호</th><th>아이디</th> -->
	<!-- 	</tr> -->
	<%-- 	<c:forEach items="${search_pay }" var="search_pay" begin="0" end="5"> --%>
	<!-- 		<tr> -->
	<%-- 			<td>${search_pay.imp_uid }</td> --%>
	<%-- 			<td>${search_pay.merchant_uid }</td> --%>
	<%-- 			<td>${search_pay.paid_amount }</td> --%>
	<%-- 			<td>${search_pay.pay_method }</td> --%>
	<%-- 			<td>${search_pay.apply_num }</td> --%>
	<%-- 			<td>${search_pay.paid_time }</td> --%>
	<%-- 			<td>${search_pay.status }</td> --%>
	<%-- 			<td>${search_pay.rsv_no }</td> --%>
	<%-- 			<td>${search_pay.user_id }</td> --%>
	<!-- 		</tr>	 -->
	<%-- 	</c:forEach> --%>
	<!-- 	</table> -->
	<!-- </section> -->

	<!-- <button id="widthdraw_btn">회원탈퇴</button> -->

</body>
</html>
<%@ include file="../footer.jsp"%>