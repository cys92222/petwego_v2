<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$(function(){
		
		
})


 

</script>
</head>
<body>
	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/pic_board/insertForm">SNS | 사진수정</a></li>
				<li class="breadcrumb-item"><a href="/pic_board/list">SNS 목록</a></li>
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
						<h4 class="card-title">사진 수정</h4>
						<div class="basic-form">
							<form action="/pic_board/update" method="post" enctype="multipart/form-data">
								<input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<div class="form-group">
									사진번호<br>
									<input type="text" name="photo_no" value="${board.photo_no }" readonly="readonly" class="form-control input-default">
								</div>
								<div class="form-group">
									파일번호<br>
									<input type="text" name="photo_file_no" value="${pic.photo_file_no }" readonly="readonly" class="form-control input-default">
								</div>
								<div class="form-group">
									작성자<br>
									<input type="text" name="user_id" value="${board.user_id }" readonly="readonly" class="form-control input-default">
								</div>
								<div class="form-group">
									내용<br/>
									<textarea name="photo_detail" id="photo_detail" class="form-control h-150px" rows="6">${board.photo_detail }</textarea>
								</div>
									사진<br>
								<div class="form-group">
									<input type="text" name="photo_file_name" value="${pic.photo_file_name }" class="form-control input-default"><br>
									<input type="file" name="uploadFile" class="form-control input-default">
								</div>
								<div style="text-align: center;">
									<button type="submit" id="btnUp" class="btn btn-primary mb-1">수정</button>
									<button type="reset" class="btn btn-danger mb-1">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="../footer.jsp"%> 
</body>
</html>

