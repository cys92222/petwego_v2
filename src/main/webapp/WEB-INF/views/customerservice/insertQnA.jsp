<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!--     <link href="../resources/quixlab/plugins/summernote/dist/summernote.css" rel="stylesheet"> -->
<!--     <link href="../resources/quixlab/css/style.css" rel="stylesheet"> -->

<meta charset="UTF-8">
<script type="text/javascript">
$(function(){
	//썸머노트
// 	$('#summernote').summernote({
// 		height: 300,                 // 에디터 높이
// 		minHeight: null,             // 최소 높이
// 		maxHeight: null,             // 최대 높이
// 		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
// 		lang: "ko-KR",					// 한글 설정
// 		placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
// 		callbacks: {	//여기 부분이 이미지를 첨부하는 부분
// 			onImageUpload : function(files) {
// 				uploadSummernoteImageFile(files[0],this);
// 			}
// 		}
// 	});
	
	var formObj = $("form[id='QnA']");
	
	//문의 등록 버튼
	$("#inser_btn").click(function(){
		formObj.submit();
		});	
})
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<div class="email-right-box">
							<div class="compose-content mt-5">
								<form action="/customerservice/insertQnA" id="QnA">
									<div class="form-group">
									<select class="form-control bg-transparent" name="cs_no">
										<option value="1">홈페이지 이용 관련</option>
										<option value="2">계정 관련</option>
										<option value="3">결제 관련</option>
									</select>
									</div>
									<div class="form-group">
										<input type="text" class="form-control bg-transparent"
											placeholder=" 제목" name="inq_title" required="required">
									</div>
									<div class="form-group">
										<input type="text" class="form-control bg-transparent"
											name="user_id" value="${login_id }" readonly="readonly">
									</div>
									<div class="form-group">	
									
									<textarea id="summernote"></textarea>
									
									
										<textarea class="textarea_editor form-control bg-light"
											rows="15" placeholder="내용 ..." required="required"></textarea>
									</div>
								</form>
								<h5 class="m-b-20">
									<i class="fa fa-paperclip m-r-5 f-s-18"></i> 첨부파일
								</h5>
								<form action="#" class="dropzone">
									<div class="form-group">
										<div class="fallback">
											<input class="l-border-1" name="file" type="file"
												multiple="multiple">
										</div>
									</div>
								</form>
							</div>
							<div class="text-left m-t-15">
								<button
									class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10"
									type="button" id="inser_btn">
									<i class="fa fa-paper-plane m-r-5"></i> 문의등록
								</button>
								<button class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20"
									type="button">
									<i class="ti-close m-r-5 f-s-12"></i> 취소하기
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!--     <script src="../resources/quixlab/plugins/summernote/dist/summernote.min.js"></script> -->
<!--     <script src="../resources/quixlab/plugins/summernote/dist/summernote-init.js"></script>	 -->
<%@ include file="../footer.jsp"%>
</body>
</html>