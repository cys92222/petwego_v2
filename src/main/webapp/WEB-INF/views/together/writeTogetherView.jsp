<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께 가요</title>

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='writeForm']");
		$("#write_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "writeTogether");
			formObj.attr("method", "post");
			formObj.submit();
		});
		$('#summernote').summernote({
			height : 300, // 에디터 높이
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
			callbacks : { //여기 부분이 이미지를 첨부하는 부분
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0], this);
				}
			}
		});

		/**
		 * 이미지 파일 업로드
		 */
		$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
			var token = "${_csrf.token}";
			jqXHR.setRequestHeader('X-CSRF-Token', token);
		});
		function uploadSummernoteImageFile(file, editor) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "/together/uploadSummernoteImageFile",
				contentType : false,
				processData : false,
				success : function(data) {
					//항상 업로드된 파일의 url이 있어야 한다.
					$(editor).summernote('insertImage', data.url);
					var t_fname = data.t_fname;
					var t_org_fname = data.t_org_fname
					$("#t_fname_input").val(t_org_fname);
				}
			});
		}
	})
	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="basic-form">
							<form method="post" action="writeTogether" name="writeForm"
								enctype="multipart/form-data">
								<input type="hidden" id="token" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="form-group row">

									<label class="col-sm-2 col-form-label"
										style="text-align: center;">썸네일</label>
									<div class="col-sm-10">
										<input type="file" class="form-control-file" id="t_thumbnail"
											name="thumbnailFile">
									</div>

									<label class="col-sm-2 col-form-label"
										style="text-align: center; margin-top: 5px;">제목</label>
									<div class="col-sm-10">
										<input type="text" name="t_title" id="t_title"
											class="form-control input-default" placeholder="제목을 입력하세요.">
									</div>

									<label class="col-sm-2 col-form-label"
										style="text-align: center; margin-top: 5px;">작성자</label>
									<div class="col-sm-10">
										<input type="text" name="user_id" id="user_id"
											value="${login_id }" readonly="readonly"
											class="form-control input-default"
											style="margin-top: 10px; width: 30%;">
									</div>

									<label class="col-sm-2 col-form-label"
										style="text-align: center; margin-top: 5px;">모임소개</label>
									<div class="col-sm-10"">
										<textarea class="form-control h-150px" rows="6" id="comment"
											name="t_intro" placeholder="모임의 소개를 입력해주세요. 최대 200자까지 가능합니다."
											style="margin-top: 10px;"></textarea>
									</div>

									<label class="col-sm-2 col-form-label"
										style="text-align: center; margin-top: 5px;">내용</label>
									<div class="col-sm-10"">
										<textarea name="t_detail" id="summernote"
											class="form-control h-150px" rows="6"></textarea>
									</div>

									<label class="col-sm-2 col-form-label"
										style="text-align: center; margin-top: 5px;">파일첨부</label>
									<div class="col-sm-10">
										<input type="text" name="t_fname" id="t_fname_input"
											class="form-control input-default"
											style="margin-top: 5px; width: 30%;">
									</div>

									<label class="col-sm-2 col-form-label"
										style="text-align: center; margin-top: 5px;">총인원</label>
									<div class="col-sm-10">
										<input type="number" name="t_size" id="t_size"
											class="form-control input-default"
											style="margin-top: 5px; text-align: center; width: 30%;">
									</div>

									<label class="col-sm-2 col-form-label"
										style="text-align: center; margin-top: 5px;">모임장소</label>
									<div class="col-sm-10">
										<input type="text" name="t_place" id="t_place"
											class="form-control input-default"
											style="margin-top: 5px; text-align: center; width: 30%;">
									</div>

									<label class="col-sm-2 col-form-label"
										style="text-align: center; margin-top: 5px;">모임날짜</label>
									<div class="col-sm-10">
										<div class="row form-material">
											<div class="col-md-6">
												<input type="text" class="form-control"
													placeholder="ex)2017-06-04" id="t_date" name="t_date"
													style="margin-top: 5px; width: 60%;">
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-12" style="text-align: center;">
									<button id="write_btn" type="button"
										class="btn mb-1 btn-primary btn-lg"
										style="background-color: #4AD4C7; border: 0; margin-right: 5px;">등록</button>
									<button id="write_btn" type="button"
										class="btn mb-1 btn-primary btn-lg"
										style="background-color: #4AD4C7; border: 0;">취소</button>
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