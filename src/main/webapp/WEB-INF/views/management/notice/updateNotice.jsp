<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>

<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="../../summernote/js/summernote-lite.js"></script>
<script src="../../summernote/js/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../../summernote/css/summernote-lite.css">
<script type="text/javascript">
$(function(){

	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	 
	var maxVolume = 20971520; 	//20mb를 byte로 환산한 숫자

	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

	
	//썸머노트
	$('#notice_content').summernote({
		maximumImageFileSize : maxVolume,	//첨부 이미지 크기 20MB로 보여짐 
		width: 650,
		height: 300,                 		// 에디터 높이
		minHeight: null,             		// 최소 높이
		maxHeight: null,             		// 최대 높이
		focus: true,                  		// 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",						// 한글 설정
		placeholder: '본문 내용을 입력해주세요!',	//placeholder 설정
		callbacks: {						// 이미지를 첨부하는 부분
			onImageUpload : function(files) {
				$.each(files, function(idx, images){
					uploadSummernoteImageFile(files[0],$("#notice_content"));
					//console.log(file);
				})
				//uploadSummernoteImageFile(files[0],this);	
			}
		}
	});

var content = "${up.notice_content}";
	
	$('#notice_content').summernote('code', content);
// 	$('#notice_content').summernote('code', "asdasd");
	
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		
		$.ajax({
			data : data,
			type : "POST",
			beforeSend: function(xhr){
				xhr.setRequestHeader(header, token);
			},
			url : "/management/notice/uploadNotice",
			contentType : false,
			processData : false,
			success : function(data) {
	        	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	}
	//공지사항 수정
	$("#upNotice").click(function(e){
		e.preventDefault();
		var insert = $("#updateForm").serialize();

		$.ajax({
				url :"/management/notice/updateNotice",
				type : "POST",
				data : insert,
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				success:function(){
			
				alert("공지사항 등록성공");	
				location.href = "/management/notice/listNotice";
			
		}});
		
	});
})
</script>
</head>
<body>

	<br>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">공지사항</h1>
		<p class="mb-4">공지사항 | 관리자접속중</p>

		<!-- 내용부분 -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">공지사항 | 수정 하기</h6>
			</div>
			<div class="card-body">
				<form id="updateForm" method="POST" enctype="multipart/form-data">	
			<input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			공지사항 번호<br>
			<input type="text" name="notice_no" value="${up.notice_no }" readonly="readonly"><br>
				<select name="cs_no">
					<option selected>카테고리 선택</option>
					<option value="1">홈페이지 관련</option>
					<option value="2">계정 관련</option>
					<option value="3">결제 관련 문의</option>
				</select><br>
				제목<br>
				<input type="text" id="notice_title" name="notice_title" required="required" value="${up.notice_title }"><br>
				내용<br>
				<textarea rows="8" cols="100" id="notice_content" name="notice_content"></textarea>
				<br>
				<!-- 글쓰기 버튼  -->
				<sec:authorize access="hasRole('ROLE_ADMIN')"> 
				<a href="#" class="btn btn-success btn-icon-split" id="upNotice">
		       		<span class="icon text-white-50">
		        		<i class="fas fa-edit"></i>
		        	</span>
		        	<span class="text">공지수정</span>
	       		</a>
				</sec:authorize>		
				</form>
			</div>
		</div>
	</div>

</body>
<%@include file="../footer.jsp"%>
</html>