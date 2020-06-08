<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>SNS게시판</title>
<style type="text/css">
#snsImg {
	height: 300px !important;
}
/* #pageMaker li{list-style:none; float:left; padding: 6px; position: fixed; bottom: 0; width: 100%;}  */

/* #insertbutton{
	color: #6fd96f;
    background-color: transparent;
    background-image: none;
    border-color: #02B5C2;
} */
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$(function() {
   temp(); 

   $("#pcomment").click(function(){
       var commCheck = confirm("한번 등록하면 수정할 수 없습니다. 이대로 등록하시겠습니까?");
       if(commCheck == true){
          var pcommSubmit = $("form[name='pcommentForm']");            
          pcommSubmit.attr("action","/pcomment/pinsertComment");
          pcommSubmit.submit();
       }
    }); 


})
   var in_user_id = "${login_id}";

var temp = function(){
   var arr_file = ${file};
   var arr_board = ${board};
/*    $.each(arr_file,function(idx,data){
     var id = $("<div></div>").append(arr_board[idx].user_id + "님의 사진");
      var a = $("<a href=/pic_board/detail?photo_no="+data.photo_no+"&user_id="+arr_board[idx].user_id+"&in_user_id="+in_user_id+"></a>");
      var img = $("<img/>").attr({"src":"/img/"+data.photo_file_name,"photo_no":data.photo_no});
      a.append(img); */
//           a.css({"float":"left","margin":"10px"});
//       $("#sns").append(a,id);
   });
}
</script>

</head>

<body>

	<!-- <a href="/MainPage">메인화면</a> -->



	<!-- 사진 -->

	<!-- container-fluid start -->
	<div class="container-fluid">
		<div class="d-flex justify-content-between">
			<h4 class="d-inline mb-4">마이펫</h4>
			<a class="btn btn-primary align-self-center" id="insertbutton"
				href="/pic_board/insertForm">게시글 등록</a>
		</div>


		<!-- Button trigger modal -->


		<div class="row">
			<c:forEach var="sns" items="${board}" varStatus="status">
				<div class="col-4">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<!-- 								<img id="snsImg" class="img-fluid" style="border-radius: 30px;" -->
								<%-- 									onclick="location.href='/pic_board/detail?photo_no=${sns.photo_no }&user_id=${sns.user_id }&in_user_id=${login_id }'" --%>
								<%-- 									src="../img/${file[status.index].photo_file_name}"> --%>

								<img id="snsImg" class="img-fluid" style="border-radius: 30px;"
									data-toggle="modal" data-target="#exampleModalLong"
									src="../img/${file[status.index].photo_file_name}">
								<!-- img-fluid   /card-img -->

								<h4 class="card-widget__title text-dark mt-3">${sns.user_id}</h4>
								<!-- 								<a class="btn gradient-4 btn-lg border-0 btn-rounded px-5" -->
								<!-- 									href="javascript:void()">자세히 보기</a> -->
							</div>
						</div>
						<div class="card-footer border-0 bg-transparent">
							<div class="row">
								<div class="col-4 border-right-1 pt-3">
									<a class="text-center d-block text-muted"
										href="javascript:void()"> <i
										class="fa fa-star gradient-1-text" aria-hidden="true"></i>
										<p class="">등록일</p> <fmt:formatDate value="${sns.photo_date }"
											pattern="yyyy-MM-dd" />
									</a>
								</div>
								<div class="col-4 border-right-1 pt-3">
									<a class="text-center d-block text-muted"
										href="javascript:void()"> <i
										class="fa fa-heart gradient-3-text"></i>
										<p class="">좋아요</p> ${sns.cntLike }
									</a>
								</div>
								<div class="col-4 pt-3">
									<a class="text-center d-block text-muted"
										href="javascript:void()"> <i
										class="fa fa-envelope gradient-4-text"></i>
										<p class="">댓글</p> ${sns.reply_cnt }
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="exampleModalLong">
			<div class="modal-dialog">
				<div class="modal-content" style="width: 600px; text-align: center;">
						<div class="modal-header" style="text-align: center;">
							<h5 class="modal-title">${Board.user_id }</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span>&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<img id="snsImg" class="img-fluid" style="border-radius: 30px;"
								data-toggle="modal" data-target="#exampleModalLong"
								src="../img/${file[status.index].photo_file_name}"><br>
							<p style="margin-top: 30px;">${Board.photo_detail }</p>
							<div class="basic-form">
								<!-- 댓글입력 -->
								<form name="pcommentForm" method="post">
									<button type="submit" id="pcomment"
										class="btn mb-1 btn-primary" style="float: right;">댓글
										등록</button>
									<input type="hidden" id="token" name="${_csrf.parameterName}"
										value="${_csrf.token}" /> <input type="hidden" id="photo_no"
										name="photo_no" value="${Board.photo_no}">
									<!-- 							<div class="col-lg-3"> -->
									<input type="text" name="user_id" readonly="readonly"
										value="${login_id }" class="form-control input-default"
										style="width: 30%;"><br>
									<!-- 							</div> -->

									<textarea name="photo_comm_cont" class="form-control h-150px"
										rows="6"></textarea>
								</form>
								<c:forEach var="plistComment" items="${plistComment}"
									varStatus="status">
											${plistComment.photo_comm_cont }
										</c:forEach>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
				</div>
			</div>
		</div>



		<!-- PAGINATION  -->
		<div class="bootstrap-pagination">
			<nav>
				<ul id="pageMaker" class="pagination justify-content-center">
					<c:if test="${pageMaker.prev}">
						<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1">Previous</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li class="page-item"><a class="page-link"
							href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li class="page-item"><a class="page-link"
							href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</nav>
		</div>

		<!-- PAGINATION END -->
	</div>
	<!-- container-fluid end -->
	<%@include file="../footer.jsp"%>
</body>
</html>
