<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 민아) 5/10, 자유게시판 글 등록 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="../summernote/js/summernote-lite.js"></script>
<script src="../summernote/js/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../summernote/css/summernote-lite.css">

<script type="text/javascript">
$(function(){

	//summer노트에 20mb 이하의 이미지만 첨부할 수 있도록 검사
	var checkFile = new RegExp("^(image)/(.*?)");
	var maxVolume = 20971520; 	//20mb를 byte로 환산한 숫자
	
	//썸머노트
	$('#summernote').summernote({
		width: 650,
		height: 300,                 	// 에디터 높이
		minHeight: null,             	// 최소 높이
		maxHeight: null,             	// 최대 높이
		focus: true,                  	// 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: '본문 내용을 입력해주세요.',	//placeholder 설정
		callbacks: {					// 이미지를 첨부하는 부분
			onImageUpload : function(files) {
				uploadSummernoteImageFile(files[0],this);
			}
		}
});

	//이미지 파일 업로드
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		console.log(file); // 이미지파일인지에 대한 유효성검사 파일타입, 이미지/확장자 용량 .... 용량을 제한할수있음 
		
		if(!checkFile.test(file.type)){
			alert("이미지 파일만 첨부할 수 있습니다.");
			return false;
		}
		//이미지 파일 최대 용량에 대한 유효성 검사 최대 20mb로 제한
		if(file.size > maxVolume){
			alert("파일의 용량은 20MB를 넘을 수 없어요!");
			return false;
		}
			
		$.ajax({
			data : data,
			type : "POST",
			url : "/board/boardUpload",	// 이 url을 컨트롤러 @PostMapping(value="/boardUpload", 와 동일해야함 
			contentType : false,
			processData : false,
			success : function(data) {
		    	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
				
			}
		});
	}

	$("#save").click(function(){
		alert("게시물이 등록되었습니다!");
	})
});
</script>
</head>
<body>
	<h2>게시글 등록</h2>
	<hr>
	<form id="insertForm" action="insert" method="post" enctype="multipart/form-data">
	<input type="hidden" name="board_no" value="${no }">
	<table width="100%">
		<tr>
			<td>제목</td><td> <input type="text" name="board_title" required="required" style="width:650px"></td>
		</tr>
		<tr>
		<select name="category">
			<option selected>카테고리 선택</option>
			<option value="수다">수다</option>
			<option value="질문">질문</option>
		</select>
		</tr>
		<tr>
			<td>작성자</td><td> <input type="text" name="user_id" required="required"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="board_content" id="summernote"></textarea></td>
		</tr>
	</table>
		<input type="submit" value="등록" id="save">
		<input type="reset" value="취소">
	</form>
</body>
</html>

