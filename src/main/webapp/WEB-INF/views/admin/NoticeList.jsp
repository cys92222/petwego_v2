<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#addSection,#detailSection,#updateSection{
	display: none;
}
li {
	list-style: none; float: left; padding: 6px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<!-- 썸머노트 설정 -->
<script src="../summernote/js/summernote-lite.js"></script>
<script src="../summernote/js/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../summernote/css/summernote-lite.css">

<script type="text/javascript">
$(function(){

// 	이미지 파일 업로드
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/admin/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(data) {
            	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	}

	
	var list = ${list}

	//공지사항 리스트
	$.each(list,function(idx,notice){
		var notice_no = $("<td></td>").append(notice.notice_no);
		var notice_title = $("<td></td>").append(notice.notice_title);
		var notice_content = $("<td></td>").append(notice.notice_content);
		var notice_hit = $("<td></td>").html(notice.notice_hit);
		var notice_date = $("<td></td>").append(moment(notice.notice_date).format('YYYY년 MM월 DD일 HH시 mm분'));

		var cs_no = $("<td></td>");
		
		if(notice.cs_no == 1){
			cs_no.html("홈페이지 이용 관련");
		}else if (notice.cs_no == 2){
			cs_no.html("계정 관련");
		}
		

		var tr = $("<tr></tr>").append(notice_no, cs_no, notice_title, notice_hit, notice_date);

		$("#listNotie").append(tr);

		//상세보기
		$(tr).on("click",function(){
			var ino = {notice_no:notice.notice_no};
			$("#detailSection").css({"display":"block"});
			$("#listSection").css({"display":"none"});
			$.ajax("/admin/detailNotice",{data:ino, success:function(detail){
// 					console.log(detail);
					$("#d_notice_no").val(detail.notice_no);
					$("#d_notice_title").val(detail.notice_title);
					$("#d_notice_content").append(detail.notice_content).css({"border":"1px solid"});
					$("#d_notice_hit").val(detail.notice_hit);
					$("#d_notice_date").val(moment(detail.notice_date).format('YYYY년 MM월 DD일 HH시 mm분'));
					
					var d_ca = detail.cs_no;
					console.log(d_ca);
					if(d_ca = 1){
						$("#d_cs_no").val("홈페이지 이용 관련");
						}
					else if(d_ca = 2){
						$("#d_cs_no").val("계정 관련");
						}
				}});
			});
		
		}); //each end

		//공지사항 등록 폼
		$("#addbtn").click(function(){
			$("#listSection").css({"display":"none"});
			$("#addSection").css({"display":"block"});
// 			alert("등록버튼 누름");
			//썸머노트
			$('#notice_content').summernote({
				height: 300,                 // 에디터 높이
				minHeight: null,             // 최소 높이
				maxHeight: null,             // 최대 높이
				focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				lang: "ko-KR",					// 한글 설정
				placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
				callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files) {
						uploadSummernoteImageFile(files[0],this);
					}
				}
			}); //썸머노트 폼 end
		
		});
		
		//공지사항 등록 
		$("#addNotice").click(function(){
			var data = $("#insertForm").serialize();
			$.ajax("/admin/insertNotice",{data:data,success:function(){
// 				alert("공지사항 등록");
				$("#listSection").css({"display":"block"});
				$("#addSection").css({"display":"none"});
				window.location.reload(true);
				}});
		});//공지사항 등록 end

	
});
</script>
</head>
<body>

<section id="listSection">
<h2>공지사항 리스트</h2>
<hr>
<table id="listNotie" width="80%">
	<tr>
		<th>공지사항 번호</th><th>카테고리</th><th>제목</th><th>조회수</th><th>작성일</th>
	</tr>
</table>
<button id="addbtn">공지사항 등록</button>
</section>

<section id="addSection">
<h2>공지사항 등록</h2>
<hr>
<form id="insertForm">
<select name="cs_no">
	<option value="1">홈페이이지 관련</option>
	<option value="2">계정 관련</option>
</select>
제목<br>
<input type="text" id="notice_title" name="notice_title" required="required"><br>
내용<br>
<textarea rows="8" cols="100" id="notice_content" name="notice_content"></textarea>
</form>
<button id="addNotice">등록하기</button>
</section>

<section id="detailSection">
<h2>공지사항 상세보기</h2>
<hr>
카테고리<br>
<input type="text" id="d_cs_no" readonly="readonly"><br>
공지사항 번호 : <input type="text" id="d_notice_no" readonly="readonly"><br>
제목 : <input type="text" id="d_notice_title" readonly="readonly"><br>
내용<br>
<div id="d_notice_content"></div><br>
조회수 : <input type="text" id="d_notice_hit" readonly="readonly"><br>
작성일 : <input type="text" id="d_notice_date" readonly="readonly"><br>


</section>

<section id="updateSection">
<h2>공지사항 수정</h2>
<hr>

</section>
</body>
</html>