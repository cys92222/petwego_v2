<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<!DOCTYPE html>
<html>
<%@include file="../header.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 민아) 5/10, 자유게시판 상세보기화면 -->
<!-- 민아) 5/31, 자유게시판 부트스트랩적용 -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.25.0/moment.min.js"></script>
<script type="text/javascript">

$(function(){
	var board_no = $("#board_no").val();

	// 수정버튼 누르면...
	$("#btnUpdate").click(function(){
		self.location = "/board/update?board_no="+board_no;
	})
	
	// 삭제버튼 누르면...
	$("#btnDelete").click(function(){
		var user_id = "${login_id}";

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
					self.location = "/board/delete?board_no="+board_no+"&user_id="+user_id;
				});
			  } else {
			    swal("글 삭제 취소");
			  }
			})
	});

	
	// 댓글작성버튼을 누르면!
	$("#comment").click(function(){

		var commCheck = confirm("한번 등록하면 수정할 수 없습니다. 이대로 등록하시겠습니까?");

		if(commCheck == true){
			var commSubmit = $("form[name='commentForm']");
			commSubmit.attr("action","/comment/insertComment");
			commSubmit.submit();
		}

	})
	
	// 댓글 목록
	// 5초마다 새로고침, 내가 보고있는 화면이 아니라, 다른 사람이 내 포트에 들어와서 댓글을 남겨도 실시간으로 보이도록! 
	// 이때, 조회수는 증가되지 않고, 댓글목록 부분만 리프레쉬된다.
	setInterval(listComment, 5000);

	function listComment(){

		$("#comm_list").empty();
		
		$.ajax("/comment/listComment",{type:"GET",data:{board_no:board_no},success:function(comm){

			comm = JSON.parse(comm);

			$.each(comm, function(idx,c){						
				var tr = $("<tr></tr>");
				var td1 = $("<td></td>").html(c.comm_cont);
				var td2 = $("<td></td>").html( moment(c.comm_date).format('YYYY년 MM월 DD일 HH:mm:ss')	);
				var td3 = $("<td></td>").html(c.user_id);
				if(c.user_id === "${login_id}"){
					var delBtn = $("<button class='badge badge-danger'></button>").text("댓글삭제").attr("comm_num",c.comm_num);
					}
				
				var td4 = $("<td></td>");
				td4.append(delBtn);
				tr.append(td1, td2, td3, td4);
				$("#comm_list").append(tr);
	
				//댓글 삭제
				$(delBtn).click(function(){
						var delCheck = confirm("댓글을 삭제하시겠습니까?");
						if(delCheck == true){
							self.location = "/comment/commDeleteSubmit?comm_num="+c.comm_num+"&user_id=${login_id}";
							alert("댓글을 삭제했습니다!");
							location.reload();
						}
				})
			})
		}}) //댓글 ajax통신끝
	}
	
	listComment();
});
</script>
</head>
<body>
	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">자유게시판 | 상세보기</a></li>
				<li class="breadcrumb-item"><a href="/board/list">자유게시판</a></li>
				<li class="breadcrumb-item active"><a href="/MainPage">메인</a></li>
			</ol>
		</div>
	</div>
	<!-- row -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">게시글 상세보기</h4>
						<div class="basic-form">
							<form id="f">
								<input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<input type="hidden" id="board_no" value="${ detail.board_no }">
								<div class="table-responsive">
									<table class="table header-border">
										<tbody>
											<tr>
												<td>제목|${detail.board_title }</td>
												<td>카테고리|${detail.category }</td>
												<td></td>
											</tr>
											<tr>
												<td>작성자|${detail.user_id }</td>
												<td>등록일|<fmt:formatDate pattern="yyyy년 MM월 dd일 EE요일" value="${detail.board_date }" /></td>
												<td>조회수|${detail.board_hit }</td>
											</tr>
											<tr>
												<td>내용|<br> <br>${detail.board_content }</td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</form>
							<c:if test="${login_id eq detail.user_id }">
								<button type="button" id="btnDelete" style="float: left" class="btn mb-1 btn-danger">글 삭제</button>
								<button type="button" id="btnUpdate" style="float: right;" class="btn mb-1 btn-primary">글 수정</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="col-lg-12 d-flex">
			<div class="card" style="width: 35%; float: left;">
				<div class="card-body">
					<div class="basic-form">
						<!-- 댓글입력 -->
						<form name="commentForm" method="get">
							<input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
							<input type="hidden" id="board_no" name="board_no" value="${detail.board_no}"> 
							<input type="hidden" name="user_id" value="${detail.user_id }">

							댓글 작성자 : 
							<input type="text" name="in_user_id" required="required" value="${login_id }" class="form-control input-default"><br>

							댓글 내용 :
							<textarea name="comm_cont" class="form-control h-150px" rows="6"></textarea>
							<br>
							<button type="submit" id="comment" class="btn mb-1 btn-primary">댓글 등록</button>
							
						</form>
					</div>
				</div>
			</div>

			<!-- 댓글 목록-->
			<div class="card ml-3" style="float: left; width: 65%;">
				<div class="card-body">
				<div class="table-responsive">
					<table id="comm_list" class="table table-striped">
					</table>
				</div>
				</div>
			</div>
		</div>
		</div>
	</div>
</body>
<%@include file="../footer.jsp"%>
</html>