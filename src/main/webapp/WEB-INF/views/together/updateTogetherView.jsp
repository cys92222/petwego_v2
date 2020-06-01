<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께 가요</title>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var formObj = $("form[name='updateForm']");
						$(".cancel_btn")
								.on(
										"click",
										function() {
											event.preventDefault();
											location.href = "/together/detailTogether?t_num=${updateTogether.t_num}"
													+ "&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}"
													+ "&keyword=${scri.keyword}";
										});
						$("#update_btn").on("click", function() {
							if (fn_valiChk()) {
								return false;
							}
							formObj.attr("action", "updateTogether");
							formObj.attr("method", "post");
							formObj.submit();
						});
						function fn_valiChk() {
							var updateForm = $("form[name='updateForm'] .chk").length;
							for (var i = 0; i < updateForm; i++) {
								if ($(".chk").eq(i).val() == ""
										|| $(".chk").eq(i).val() == null) {
									alert($(".chk").eq(i).attr("title"));
									return true;
								}
							}
						}
						//썸네일 파일 수정 버튼을 누르면
						$("#th_btn")
								.click(
										function(e) {
											//폼 안에 있어서 기본 이벤트 제거
											//	 		e.preventDefault();
											//	 		e.stopPropagation();
											$("#thumbnail").remove();
											$("#th_btn").css({
												"display" : "none"
											});
											var aa = $("<input type='file' name='up_thumbnailFile'>");

											$("#o_section").append(aa);
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
						$.ajaxPrefilter(function(options, originalOptions,
								jqXHR) {
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
								beforeSend : function(xhr) {
									xhr.setRequestHeader(header, token);
								},
								contentType : false,
								processData : false,
								success : function(data) {
									//항상 업로드된 파일의 url이 있어야 한다.
									$(editor).summernote('insertImage',
											data.url);
									var t_fname = data.t_fname;
									var t_org_fname = data.t_org_fname
									$("#t_fname_input").val(t_org_fname);
								}
							});
						}
					})
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="basic-form">
							<form method="post" action="updateTogether" name="updateForm"
								enctype="multipart/form-data">
								<input type="hidden" id="token" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="hidden" name="t_num"
									value="${updateTogether.t_num}" readonly="readonly" />
								<div class="form-group row">
									<label class="col-sm-2 col-form-label"
										style="text-align: center;">썸네일</label>
									<div class="col-sm-8" id="o_section">
										<input type="text" class="form-control input-default"
											id="thumbnail" name="thumbnail"
											value="${updateTogether.thumbnail}">
									</div>
									<div class="col-sm-2">
										<button type="button" id="th_btn"
											class="btn mb-1 btn-primary btn-lg"
											style="background-color: #4AD4C7; border: 0; margin-top: 3px;">썸네일 수정</button>
									</div>

									<label class="col-sm-2 col-form-label"
										style="text-align: center; margin-top: 5px;">제목</label>
									<div class="col-sm-10">
										<input type="text" name="t_title" id="t_title"
											style="margin-top: 10px;" class="form-control input-default"
											placeholder="제목을 입력하세요." value="${updateTogether.t_title }">
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
											style="margin-top: 10px;">${updateTogether.t_intro }</textarea>
									</div>

									<label class="col-sm-2 col-form-label"
										style="text-align: center; margin-top: 5px;">내용</label>
									<div class="col-sm-10" style="margin-top: 10px;">
										<textarea name="t_detail" id="summernote"
											class="form-control h-150px" rows="6">${updateTogether.t_detail }</textarea>
									</div>

									<label class="col-sm-2 col-form-label"
										style="text-align: center; margin-top: 5px;">파일첨부</label>
									<div class="col-sm-10">
										<input type="text" name="t_fname" id="t_fname_input"
											class="form-control input-default"
											style="margin-top: 5px; width: 30%;" value="${updateTogether.t_fname }">
									</div>

									<label class="col-sm-2 col-form-label"
										style="text-align: center; margin-top: 5px;">총인원</label>
									<div class="col-sm-10">
										<input type="number" name="t_size" id="t_size"
											class="form-control input-default"
											style="margin-top: 5px; text-align: center; width: 30%;" value="${updateTogether.t_size }">
									</div>

									<label class="col-sm-2 col-form-label"
										style="text-align: center; margin-top: 5px;">모임장소</label>
									<div class="col-sm-10">
										<input type="text" name="t_place" id="t_place"
											class="form-control input-default"
											style="margin-top: 5px; text-align: center; width: 30%;" value="${updateTogether.t_place }">
									</div>

									<label class="col-sm-2 col-form-label"
										style="text-align: center; margin-top: 5px;">모임날짜</label>
									<div class="col-sm-10">
										<div class="row form-material">
											<div class="col-md-6">
												<input type="text" class="form-control"
													placeholder="ex)2017-06-04" id="t_date" name="t_date"
													style="margin-top: 5px; width: 60%;" value="${updateTogether.t_date }">
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-12" style="text-align: center;">
									<button id="update_btn" type="button"
										class="btn mb-1 btn-primary btn-lg"
										style="background-color: #4AD4C7; border: 0; margin-right: 5px;">수정</button>
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