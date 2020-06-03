<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../header.jsp"%>
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$("#cancel_btn").on("click", function(){
				location.href = "/together/detailTogether?t_num=${updateReply.t_num}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			 
		})

		
	</script>
<body>
	
	<form name="updateForm" role="form" method="post"
		action="/together/updateReply">
		<input type="hidden" id="token" name="${_csrf.parameterName}"
			value="${_csrf.token}" /> <input type="hidden" id="t_num"
			name="t_num" value="${updateReply.t_num}" readonly="readonly" /> <input
			type="hidden" id="t_r_num" name="t_r_num"
			value="${updateReply.t_r_num}" /> <input type="hidden" id="page"
			name="page" value="${scri.page}"> <input type="hidden"
			id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
		<input type="hidden" id="searchType" name="searchType"
			value="${scri.searchType}"> <input type="hidden" id="keyword"
			name="keyword" value="${scri.keyword}">

		<div class="col-xl-12" style="padding: 50px; padding-top: 0;">
		<hr>
		<h3>댓글수정</h3>
		<hr>
			<div class="card" style="margin-top: 50px;">
				<div class="card-body">
					<div class="form-group">
						<%-- 					<label id="c_user_id" for="c_user_id">${login_id }</label> --%>
						<input type="text" id="c_user_id" name="c_user_id"
							readonly="readonly" value="${login_id }"
							style="border: none; border-right: 0px; padding-bottom: 10px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;" />
						<textarea class="form-control" name="t_r_content" id="t_r_content"
							cols="30" rows="2" placeholder="댓글을 입력하세요.">${replyUpdate.t_r_content}</textarea>
					</div>
					<button class="btn btn-primary px-3 ml-4"
						style="float: right; background-color: #4AD4C7; border: none;"
						id="replyWriteBtn">수정</button>
					<button class="btn btn-primary px-3 ml-4" type="button"
						id="cancel_btn"
						style="float: right; background-color: #4AD4C7; border: none;">취소</button>
				</div>
			</div>
		</div>
	</form>
	<%@include file="../footer.jsp"%>
</body>
</html>