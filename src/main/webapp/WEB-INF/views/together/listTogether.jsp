<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.back-to-top {
	position: fixed;
	bottom: 25px;
	right: 25px;
	display: none;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				//맨위로 
				$(window).scroll(function() {
					if ($(this).scrollTop() > 50) {
						$('#back-to-top').fadeIn();
					} else {
						$('#back-to-top').fadeOut();
					}
				});
				// scroll body to 0px on click
				$('#back-to-top').click(function() {
					$('body,html').animate({
						scrollTop : 0
					}, 400);
					return false;
				});
				$('#searchBtn').click(
						function() {
							self.location = "listTogether"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput')
											.val());
						});

				$("#writeTogether").click(function() {
					location.href = "writeTogetherView";
				});

			});
</script>
<style type="text/css">
#pageMaker li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>
</head>

<body>
	<div class="row m-b-30" style="padding: 50px;">
		<input type="hidden" id="token" name="${_csrf.parameterName}"
			value="${_csrf.token}" /> <br> <br> <br> <br>
		<div class="col-lg-10" style="float: left; margin-top: 15px;">
			<div class="form-group" style="float: left;">
				<select class="form-control form-control-sm" name="searchType"
					style="width: 100px;">
					<option value="t"
						<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					<option value="d"
						<c:out value="${scri.searchType eq 'd' ? 'selected' : ''}"/>>내용</option>
					<option value="w"
						<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					<option value="p"
						<c:out value="${scri.searchType == 'p' ? 'selected' : ''}"/>>모임장소</option>
					<option value="td"
						<c:out value="${scri.searchType eq 'td' ? 'selected' : ''}"/>>제목
						+ 내용</option>
				</select>
			</div>

			<div class="basic-form" style="float: left;">
				<form>
					<div class="form-group">
						<input type="text" class="form-control input-default"
							name="keyword" id="keywordInput" value="${scri.keyword}"
							style="width: 300px; margin-left: 5px;" />
					</div>
				</form>
			</div>
						<div id="searchBtn" type="button" class="btn mb-1 btn-primary btn-lg"
							style="background-color: #4AD4C7; border: 0; float: left; height: 45px; padding-top: 10px; margin-left: 5px;">검색
						</div>

<!-- 			<button type="button" class="btn mb-1 btn-info" id="searchBtn" style="border: 0; float: left; height: 45px; padding-top: 10px; margin-left: 5px;"> -->
<!-- 				검색 -->
<!-- 			</button> -->

		</div>
		<div class="col-lg-2" style="float: left; text-align: right;">
						<button id="writeTogether" type="button"
							class="btn mb-1 btn-primary btn-lg"
							style="background-color: #4AD4C7; border: 0; height: 45px; padding-bottom: 5px; margin-top: 15px; margin-right: 20px;">모임
							개설하기</button>
<!-- 			<button type="button" class="btn mb-1 btn-info" id="writeTogether" style="margin-top: 15px;"> -->
<!-- 				모임 개설하기 <span class="btn-icon-right"><i -->
<!-- 					class="mdi mdi-message-draw"></i></span> -->
<!-- 			</button> -->
		</div>


		<c:forEach var="c" items="${listTogether}" varStatus="status">
			<div class="col-lg-12">
				<div class="card border-primary">
					<div style="background-color: #4AD4C7;"></div>
					<div class="card-body">
						<input type="hidden" id="t_num" name="t_num"
							value="${detailTogether.t_num }" />
						<div class="col-lg-3" style="float: left; text-align: center;">
							<img src="../t_thumbnailUpload/${c.thumbnail}"
								style="margin-right: 10px; max-width: 100%; height: 300px;">
						</div>
						
						<c:set var="t_size" value="${c.t_size }" />
						<c:set var="t_attendee_cnt" value="${c.t_attendee_cnt }" />
						
						<c:if test="${t_size == t_attendee_cnt }">
							<div class="label label-danger" style="float: right; text-align: center; width:16.6%; height: 30px;">신청마감</div>
<!-- 							<span class="label label-danger">Danger</span> -->
						</c:if>
						
						<div class="col-lg-9" style="float: left;">
							<h2 class="card-title"
								style="font-size: 25px; padding-top: 50px;">${c.t_title }</h2>
						</div>
						<div class="col-lg-7"
							style="float: left; height: 100%; font-size: 18px; padding-right: 60px; padding-top: 50px;">
							<p class="card-text">${c.t_intro }</p>
						</div>
						<div>
							<div class="col-lg-2" style="float: left; padding: 0;">
								<span class="label label-secondary"
									style="background-color:#F2CB05; border: 0; font-size: 14px;">모&nbsp;&nbsp;임&nbsp;&nbsp;&nbsp;장</span>
								<div style="float: right;">&nbsp;&nbsp;${c.user_id }</div>
								<br>
							</div>

							<div class="col-lg-2"
								style="float: left; padding: 0; margin-top: 14px;">
								<span class="label label-secondary"
									style="border: 0; font-size: 14px; background-color: #4AD4C7;">참여
									인원</span>
								<div style="float: right;">&nbsp;&nbsp;${c.t_attendee_cnt }/${c.t_size }</div>
							</div>

							<div class="col-lg-2"
								style="text-align: right; margin-top: 10px; padding: 0; float: right;">
								<a
									href="detailTogether?t_num=${c.t_num}&
																user_id=${login_id }&
																page=${scri.page}&
																perPageNum=${scri.perPageNum}&
																searchType=${scri.searchType}&
																keyword=${scri.keyword}"
									class="btn mb-1 btn-rounded btn-outline-primary"
									style="width: 100%; border: 0; margin-top: 20px; border: 1px solid;">자세히보기</a>
								
								<ul class="clearfix" style="margin-top: 20px;">
									<li class="icons dropdown"><a href="javascript:void(0)">
											<i class="mdi mdi-eye"></i> <span>${c.t_hit }</span>
									</a></li>
									<li class="icons dropdown"><a href="javascript:void(0)">
											<i class="mdi mdi-message-reply"></i> <span>${c.reply_cnt }</span>
									</a></li>
								</ul>

							</div>
						</div>
					</div>

					<div class="card-footer" style="text-align: right; background-color: #f7fafc; border-top:0; ">
						<small>모임날짜 :${c.t_date }</small>
					</div>
					<div style="border-top: 1px; color: gray;"></div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="bootstrap-pagination">
		<ul class="pagination" style="margin-bottom: 2rem; padding-left: 40%;">
			<c:if test="${pageMaker.prev}">
				<li class="page-item"><a class="page-link"
					href="listTogether${pageMaker.makeSearch(pageMaker.startPage - 1)}"
					style="color: #4AD4C7;">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li class="page-item"><a class="page-link"
					href="listTogether${pageMaker.makeSearch(idx)}"
					style="color: #4AD4C7;">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li class="page-item"><a class="page-link"
					href="listTogether${pageMaker.makeSearch(pageMaker.endPage + 1)}"
					style="color: #4AD4C7;">다음</a></li>
			</c:if>
		</ul>
	</div>
	<a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top"
		role="button" style="background-color: #4AD4C7; border: none;"><i
		class="mdi mdi-format-wrap-top-bottom" style="color: white;"></i></a>
	<%@include file="../footer.jsp"%>
</body>

</html>
