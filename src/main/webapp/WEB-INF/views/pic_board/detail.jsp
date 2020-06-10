<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.25.0/moment.min.js"></script>
<script type="text/javascript">
	$(function() {

		// 민아) 5/17, 좋아요기능 추가
		var photo_no = $("#photo_no").val();
		var user_id = "${login_id}";
		$("#clickLike").hide();

		//이 사진에 좋아요를 눌렀는지 체크 
		var okLike = function(user_id, photo_no) {
			$.ajax("/pic_board/okLike", {
				data : {
					user_id : user_id,
					photo_no : photo_no
				},
				success : function(re) {
					if (re == 1) { //좋아요를 눌렀다면
						$("#clickLike").show(); //좋아요 눌러서 바뀐 사진을 보여주고
						$("#like").hide(); //안눌린상태의 좋아요사진은 숨겨줘 
					}
				}
			})
		}
		okLike(user_id, photo_no);

		
		// 좋아요 insert
		$(document).on("click", "#like", function() { // 좋아요를 클릭했을때
			$.ajax("/pic_board/insertLike", {
				data : {
					user_id : user_id,
					photo_no : photo_no
				},
				success : function(re) {
					if (re == 1) {
						$("#clickLike").show(); //좋아요 눌러서 바뀐 사진을 보여주고
						$("#like").hide(); //안눌린상태의 좋아요사진은 숨겨줘 
						$("#cntLike").html(eval($("#cntLike").html()) + 1); // 좋아요 수가 보이는 창의 데이터에 + 1 해줘
					}
				}
			})
			window.location.reload(true);
		})

		// 좋아요 delete 좋아요를 한번 더 누르면 취소 
		$(document).on("click", "#clickLike", function() {
			$.ajax("/pic_board/deleteLike", {
				data : {
					user_id : user_id,
					photo_no : photo_no
				},
				success : function(re) {
					if (re == 1) {
						$("#clickLike").hide(); //좋아요 눌러서 바뀐 사진을 숨기고
						$("#like").show(); //안눌린상태의 좋아요사진을 보여줘
						$("#cntLike").html(eval($("#cntLike").html()) - 1); // 좋아요 수가 보이는 창의 데이터에 - 1 해줘
					}
				}
			})
			window.location.reload(true);
		})

		// 여기까지 좋아요 처리 완료 
		//수정
		$("#btnUpdate").click(function() {
			self.location = "/pic_board/update?photo_no=${file.photo_no}";
		});

		//삭제   
		$("#btnDelete").click(function() {

			swal({
				  title: "삭제하시겠습니까?",
				  text: "복구할 수 없습니다. 게시글을 삭제하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
				    swal("게시글을 삭제하였습니다!!", {
				      icon: "success",
				    }).then((result) =>  {
				    	self.location = "/pic_board/delete?photo_no=${file.photo_no}";
					});
				  } else {
				    swal("글 삭제 취소");
				  }
				})
		});

		// 댓글작성버튼을 누르면!
		$("#pc_btn").click(function() {
			var commCheck = confirm("한번 등록하면 수정할 수 없습니다. 이대로 등록하시겠습니까?");
			if (commCheck == true) {
// 				var pcommSubmit = $("form[name='pcommentForm']");
// 				pcommSubmit.attr("action", "/pcomment/pinsertComment");
// 				pcommSubmit.submit();
				var id = '${login_id}';
				var ct = $("#photo_comm_cont").val();
				var pn = ${file.photo_no};
				var d = {user_id:id, photo_comm_cont:ct, photo_no:pn};
				$.ajax("/pcomment/pinsertComment",{data:d,success:function(){
					window.location.reload(true);
					}});
			}
		});

		//팔로우하기
		$("#follow").click(function() {
			var u2 = $("#follow_user_id").val();
			var id = '${login_id}';
			
// 			var follow_user_id = $("#follow_user_id").val();
// 			var follow_in_user_id = $("#follow_in_user_id").val();
// 			alert("팔로우할 아이디"+ ${Board.user_id } + "팔로워아이디"+${login_id});
			$.ajax("/follow/insert_follow", {
				data : {
					user_id2 : u2,
					in_user_id : id
				},
				success : function(re) {
					window.location.reload(true);
				}
			});
			
		});

		//팔로우취소하기
		$("#delete_follow").click(function() {
			var follow_user_id = $("#follow_user_id").val();
			var user_id2 = "${login_id}";
			$.ajax("/follow/delete_follow", {
				data : {
					user_id : follow_user_id,
					user_id2 : user_id2
				},
				success : function(re) {
					window.location.reload(true);
				}
			});
		});

var comm_list = ${comm_list};

	$.each(comm_list,function(idx,no){
		
		$('#comment_delete'+no.photo_comm_no).click(function(){
// 		$("#comment_delete"+no.photo_comm_no).click(function(){
			var comment_no = $("#comment_no").val();
			var cid1 = $("#comment_id").val();
			var cid2 ='${login_id}';
			var data = {photo_comm_no:comment_no,user_id:cid1,user_id2:cid2};
			$.ajax("/pcomment/pcommDeleteSubmit",{data:data,success:function(){
				window.location.reload(true);
				}});
		});
	})

	});
</script>
</head>
<body>
	<sec:authorize access="isAuthenticated()">
		<input type="hidden" id="follow_in_user_id" value="${login_id }">

		<div class="container-fluid">
			<form id="f">
				<div class="row">

					<input type="hidden" id="token" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <input type="hidden" id="photo_no"
						value="${Board.photo_no }">
					<div class="col-lg-4 col-xl-3">
						<div class="card">
							<div class="card-body">
								<div class="media align-items-center mb-4">
									<img class="mr-3" src="images/avatar/11.png" width="80"
										height="80" alt="">
									<div class="media-body">
										<h3 class="mb-0">${Board.user_id }</h3>
										<input type="hidden" id="follow_user_id" value="${Board.user_id }">
									</div>
								</div>

								<div class="row mb-5">
									<div class="col">
										<div class="card card-profile text-center">
											<span class="mb-1 text-warning"><i
												class="icon-user-follow"></i></span>
											<p class="text-muted">${search_follow_count }</p>
										</div>
									</div>
									<div class="col-12 text-center">
										<c:if test="${follow_chk ==0 }">
											<c:if test="${login_id ne Board.user_id}">
												<button class="btn btn-danger px-5" type="button" id="follow">팔로우하기</button>
											</c:if>
										</c:if>
										<c:if test="${follow_chk !=0 or Board.user_id eq login_id}">
						          
						         	팔로워:
						         <c:forEach items="${search_follow }" var="search_follow"
												begin="0" end="5">
						            ${search_follow.user_id2 }님 
						         </c:forEach>

											<div class="bootstrap-modal">

												<!-- Button trigger modal -->
												<button type="button" class="btn btn-primary"
													data-toggle="modal" data-target="#basicModal">더보기</button>

												<!-- Modal -->
												<div class="modal fade" id="basicModal"
													style="display: none;" aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content p-4 pb-5">
															<div class="modal-header">
																<h5 class="modal-title font-weight-light">${followList[0].user_id }님의
																	팔로워</h5>
																<button type="button" class="close" data-dismiss="modal">
																	<span>×</span>
																</button>
															</div>
															<c:forEach items="${followList }" var="followList">
																<div class="modal-body border-bottom">
																	<div
																		class="row align-items-center justify-content-between d-flex">
																		<div class="align-items-center d-flex">
																			<!-- fname: 사용자의 프로필사진 -->
																			<img src="../img/peopleImg/${followList.fname }"
																				width="30" height="30">

																			<div class="d-flex flex-column">
																				<span class="text-dark">${followList.user_id2 }</span>
																				<!-- intro : 사용자의 자기소개 -->
																				<span class="text-muted small"><div>${followList.intro }</div></span>
																			</div>
																		</div>
																		<c:if test="${followList.user_id2 eq login_id }">
																			<button type="button"
																				class="btn-sm mb-1 btn-danger small mr-2"
																				id="delete_follow">
																				<i class="fa fa-times mr-1"></i>언팔로우
																			</button>
																		</c:if>
																	</div>
																</div>
															</c:forEach>
														</div>
													</div>
												</div>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-8 col-xl-9">
						<div class="card">
							<div class="card-body" style="text-align: center;">
								<img src="/img/snsImg/${file.photo_file_name}"
									style="max-width: 100%;" /> <br> <br>
								<p>${Board.photo_detail }</p>
								<div>
									<img id="like" src="/img/snsImg/like.png" width="50"
										height="50"> <img id="clickLike"
										src="/img/snsImg/clickLike.png" width="50" height="50">
									<c:out value="<p id='cntLike'>${Board.cntLike }</p>"
										escapeXml="false" />
								</div>
								<c:if test="${Board.user_id eq login_id }">
								<div class="general-button">
									<button type="button" id="btnUpdate" class="btn mb-1 btn-primary">수정</button>
									<button type="button" id="btnDelete" class="btn mb-1 btn-danger">삭제</button>
								</div>
								</c:if>
							</div>
							<hr>
							<div class="card-body">
<!-- 								<form action="/pcomment/pinsertComment" method="post"> -->
									<input type="hidden" id="token" name="${_csrf.parameterName}"
										value="${_csrf.token}" /> <input type="hidden" id="photo_no"
										name="photo_no" value="${Board.photo_no}">
									<div class="form-group">
										<input type="text" name="user_id" value="${login_id }"
											readonly="readonly"
											style="border: none; border-right: 0px; padding-bottom: 10px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;"><br>
										<textarea class="form-control" name="photo_comm_cont"
											id="photo_comm_cont" cols="20" rows="5"
											placeholder="댓글을 입력해주세요."></textarea>
									</div>
									<div class="d-flex align-items-center">
										<button class="btn btn-primary px-3 ml-4" type="button" id="pc_btn">댓글
											달기</button>
									</div>
<!-- 								</form> -->
							</div>
						</div>
						<c:forEach var="plistComment" items="${plistComment}"
							varStatus="status">
							<div class="card">
							<input type="hidden" id="comment_no" value="${plistComment.photo_comm_no }">
							<input type="hidden" id="comment_id" value="${plistComment.user_id }">
								<div class="card-body">
									<div class="media media-reply">
										<img class="mr-3 circle-rounded" src="../img/peopleImg/${plistComment.fname}"
											width="50" height="50" alt="Generic placeholder image">
										<div class="media-body">
											<div class="d-sm-flex justify-content-between mb-2">
												<h5 class="mb-sm-0">${plistComment.user_id }
													<small class="text-muted ml-3"><fmt:formatDate
															value="${plistComment.photo_comm_date }"
															pattern="yyyy-MM-dd" /></small>
												</h5>
												<c:if test="${plistComment.user_id eq login_id }">
													<div class="general-button">
														<button type="button" class="btn mb-1 btn-danger" id="comment_delete${plistComment.photo_comm_no }">
															댓글삭제
														</button>
													</div>
												</c:if>
											</div>

											<p>${plistComment.photo_comm_cont }</p>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</form>
		</div>
		<!-- #/ container -->
		</div>


	</sec:authorize>
</body>
<%@include file="../footer.jsp"%>
</html>