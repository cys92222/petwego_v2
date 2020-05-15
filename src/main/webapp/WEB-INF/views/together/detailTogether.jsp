<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께가요</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//form태그를  변수에 저장
	 var formObj = $("form[name='detailForm']");

	//수정
	$(".update_btn").on("click",function(){
		formObj.attr("action","updateTogetherView");
		formObj.attr("method","get");
		formObj.submit();
	});

	//삭제
	$(".delete_btn").on("click",function(){
		var deleteYN = confirm("삭제하시겠습니까?");
		
		if(deleteYN==true){
			formObj.attr("action","deleteTogether");
			formObj.attr("method","post");
			formObj.submit();
		}
	});

	//검색 유지한 목록으로 돌아가기
	//5월8일 현재 동작 안되고 있음 주소창에 입력값은 가져와지는데 페이지가 넘어가지지 않음
	$(".list_btn").on("click", function(){
		event.preventDefault();
		location.href = "/together/listTogether?page=${scri.page}"
		+"&perPageNum=${scri.perPageNum}"
		+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
	})
	$(".replyWriteBtn").on("click", function(){
		var formObj = $("form[name='replyForm']");
		formObj.attr("action", "/together/writeReply");
		formObj.submit();
	});

	//댓글 수정 View
	$(".replyUpdateBtn").on("click", function(){
		location.href = "/together/updateReplyView?t_num=${detailTogether.t_num}"
						+ "&page=${scri.page}"
						+ "&perPageNum=${scri.perPageNum}"
						+ "&searchType=${scri.searchType}"
						+ "&keyword=${scri.keyword}"
						//클릭이벤트가 발생한 수정버튼의 data-t_r_num을 가져오겠다.
						+ "&t_r_num="+$(this).attr("data-t_r_num");
	});
			
	//댓글 삭제 View
	$(".replyDeleteBtn").on("click", function(){
		location.href = "/together/deleteReplyView?t_num=${detailTogether.t_num}"
						+ "&page=${scri.page}"
						+ "&perPageNum=${scri.perPageNum}"
						+ "&searchType=${scri.searchType}"
						+ "&keyword=${scri.keyword}"
						+ "&t_r_num="+$(this).attr("data-t_r_num");
	});


// 	$(".replyDeleteBtn").on("click",function(){
// 		var formObj = $("form[name='replyForm']");
// 		var deleteYN = confirm("삭제하시겠습니까?");
		
// 		if(deleteYN==true){
// 			formObj.attr("action","deleteReply");
// 			formObj.attr("method","post");
// 			formObj.submit();
// 		}
// 	});

});
</script>
</head>
<body>
		<div id="root">
			<header>
				<h1> 함께가요 상세</h1>
			</header>
			<hr />
			 
			<nav>
			  홈 - 글 작성
			</nav>
			<hr />
			
			<section id="container">
				<form name="detailForm" role="form" method="get">
				<!-- scri의 값을 보관하기 위해서 form태그안에 타입 hidden -->
				<input type="hidden" id="t_num" name="t_num" value="${detailTogether.t_num }"/>
				<input type="hidden" id="page" name="page" value="${scri.page }"/>
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }"/>
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }"/>
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }"/>
				
					<table>
						<tbody>
							
							<tr>
								<td>
									<label for="t_num">글번호</label><input type="text" id="t_num" name="t_num" value="${detailTogether.t_num }"/>
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="t_thumbnail">썸네일</label><input type="text" id="thumbnail" name="thumbnail" value="${detailTogether.thumbnail }"/><br>
									<img src="../t_thumbnailUpload/${detailTogether.thumbnail}">
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="t_title">제목</label><input type="text" id="t_title" name="t_title" value="${detailTogether.t_title }"/>
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="t_intro">인트로</label><input type="text" id="t_intro" name="t_intro" value="${detailTogether.t_intro }"/>
								</td>
							<tr>
							
							<tr>
								<td>
									<label for="t_detail">내용</label><div id="t_detail" name="t_detail">${detailTogether.t_detail }</div>
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="t_place">모임장소</label><input type="text" id="t_place" name="t_place" value="${detailTogether.t_place }"/>
								</td>
							<tr>
							
							<tr>
								<td>
									<label for="t_size">총참가 인원</label><input type="text" id="t_size" name="t_size" value="${detailTogether.t_size }"/>
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="t_date">모임일</label><input type="text" id="t_date" name="t_date" value="${detailTogether.t_date }"/>
								</td>
							</tr>		
						</tbody>			
					</table>
					<hr>
					<a href="/chat">채팅하기</a>
					
					<hr>
					<button type="submit" class="update_btn">수정</button>
					<button type="submit" class="delete_btn">삭제</button>
					<button type="submit" class="list_btn">목록</button>

				</form>
				<button class="btn btn-primary btn-sm" id="btn-add-t_num-${togetherVo.t_num}">신청</button>
				<hr>
				<form name="replyForm" method="post">
					<input type="hidden" id="t_num" name="t_num" value="${detailTogether.t_num }"/>
					<input type="hidden" id="page" name="page" value="${scri.page }"/>
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }"/>
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }"/>
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }"/>
					
					
					<div>
						<label for="user_id">댓글 작성자</label><input type="text" id="user_id" name="user_id" />
						<br/>
						<label for="t_r_content">댓글 내용</label><input type="text" id="t_r_content" name="t_r_content" />
					</div>
					<div>
				 		<button type="button" class="replyWriteBtn">작성</button>
				  	</div>
					
					<div id="reply">
					  <ol class="replyList">
					    <c:forEach items="${replyList}" var="replyList">
					      <li>
					        <p>
					        작성자 : ${replyList.user_id}<br />
					        작성 날짜 :  <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
					        </p>
					
					        <p>${replyList.t_r_content}</p>
					        <div>
							  <button type="button" class="replyUpdateBtn" data-t_r_num="${replyList.t_r_num}">수정</button>
							  <button type="button" class="replyDeleteBtn" data-t_r_num="${replyList.t_r_num}">삭제</button>
							</div>
					      </li>
					    </c:forEach>
					  </ol>
					</div>
				</form>
			</section>
			<input type="button" value="맨위로" onClick="javascript:window.scrollTo(0,0)" />
			<input type="image" src="/top.png" onClick="javascript:window.scrollTo(0,0)" alt="맨위로" />
			<hr />
		</div>
	</body>
</html>
