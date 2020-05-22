<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#insert,#detail{
	display: none;
}


</style>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="../summernote/js/summernote-lite.js"></script>
<script src="../summernote/js/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../summernote/css/summernote-lite.css">

<script type="text/javascript">

//페이지 이동
function fn_movePage(val){
    jQuery("input[name=pageNo]").val(val);
    jQuery("form[name=frm]").attr("method", "post");
    jQuery("form[name=frm]").attr("action","").submit();
}

//검색 버튼
function fn_search(){
    if( jQuery("#searchS").val() == "" ){
        return;
    }else{
        jQuery("input[name=searchFiled]").val(jQuery("#searchS").val());
    }
    var searchValue = jQuery("#searchI").val();
    jQuery("input[name=searchValue]").val(searchValue);

    jQuery("input[name=pageNo]").val("1");
    jQuery("form[name=frm]").attr("method", "post");
    jQuery("form[name=frm]").attr("action","").submit();
}


$(function(){
	
	//썸머노트
	$('#summernote').summernote({
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
});



/**
* 이미지 파일 업로드
*/
function uploadSummernoteImageFile(file, editor) {
data = new FormData();
data.append("file", file);
$.ajax({
	data : data,
	type : "POST",
	url : "/uploadSummernoteImageFile",
	contentType : false,
	processData : false,
	success : function(data) {
    	//항상 업로드된 파일의 url이 있어야 한다.
		$(editor).summernote('insertImage', data.url);
	}
});
}

// 	// 서머노트에 text 쓰기
// 	$('#summernote').summernote('insertText', "써머노트에 쓸 텍스트");
// 	// 서머노트 쓰기 비활성화
// 	$('#summernote').summernote('disable');
// 	// 서머노트 쓰기 활성화
// 	$('#summernote').summernote('enable');
// 	// 서머노트 리셋
// 	$('#summernote').summernote('reset');
// 	// 마지막으로 한 행동 취소 ( 뒤로가기 )
// 	$('#summernote').summernote('undo');
// 	// 앞으로가기
// 	$('#summernote').summernote('redo');
	
	
	
	var insert_result = ${insert_result};
	
	if(insert_result > -1){
		window.location.href = "/customerservice/listQnA";
		}
	
	var arr = ${resultList};

	//리스트
	$.each(arr,function(idx,qna){
		var tr = $("<tr></tr>");
		var inq_no = $("<td></td>").html(qna.inq_no);
		var category = qna.cs_no;
		var cs_no = $("<td></td>");
		if(category == 1){
			cs_no.html("홈페이지 관련");
			}
		else if(category ==2){
			cs_no.html("계정 관련");
			}
		else{
			cs_no.html("기타");
			}
		
		var inq_title = $("<td></td>").html(qna.inq_title);
		var user_id = $("<td></td>").html(qna.user_id);
		var inq_date = $("<td></td>").html(qna.inq_date);
		$(tr).append(inq_no,cs_no,inq_title,user_id,inq_date);

		$("#list_qna").append(tr);

		//상세보기
		$(tr).on("click",function(){
			var data = {inq_no:qna.inq_no,user_id:qna.user_id};
			$("#list").css({"display":"none"});
			$("#detail").css({"display":"block"});		
	        
			$.ajax("/customerservice/detail_qna",{data:data,success:function(detail){
					$("#d_inq_no").val(detail.inq_no);
					$("#d_user_id").val(detail.user_id);
					$("#d_cs_no").val(detail.cs_no);
					$("#d_inq_title").val(detail.inq_title);
					$('#d_inq_content').summernote({
				  height: 300,                 // 에디터 높이
				  minHeight: null,             // 최소 높이
				  maxHeight: null,             // 최대 높이
				  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				  lang: "ko-KR",					// 한글 설정
				  placeholder: detail.inq_content 	//placeholder 설정
		        
					});

					$("#d_inq__file").attr("src","/img/"+detail.inq__file);
				}});
			});
		})
	
	//등록폼
	$("#QnA").click(function(){
		
		
		$("#list").css({"display":"none"});
		$("#insert").css({"display":"block"});

		
		
		var i = 0;
		//사진추가
		$("#add").click(function() {
			if (i < 4) {
				$("#fileUpload").append("<input id='i' class='form-control' type='file' name='inq__file'>");
				i++;
			}
		});
	
		$("#remove").click(function() {
			i--;
			$("#i").remove();
		});		
		});

	
	$("#sub").click(function(){
		 
		$("#insert_f").submit();
		});


	
	
	//삭제
	$("#delete_qna").click(function(){
		var c = confirm("삭제하시겠습니까?");
		if(c == true){
			var data = $("#detail_f").serialize();
			console.log(data);
			$.ajax("/customerservice/detele_qna",{data:data,success:function(){
				$("#list").css({"display":"block"});
				$("#detail").css({"display":"none"});
				window.location.reload(true);
				}});
			}
		
		})
})
</script>

<body>
<a href="/customerservice/index">고객센터</a>


<section id="insert">
<h2>QnA등록</h2>
<hr>

	<form action="/customerservice/insert_qna" id="insert_f"  enctype="multipart/form-data" method="post">
		작성자<br>
		<input type="text" name="user_id" required="required"><br>
		
		카테고리<br>
		<select name="cs_no">
			<option value="1">홈페이지 관련</option>
			<option value="2">계정 관련</option>
		</select><br>
		
		
		제목<br>
		<input type="text" name="inq_title" required="required"><br>
		
		내용<br>
		<textarea name="inq_content" id="summernote" rows="10" cols="100"></textarea><br>
		
		사진 업로드<br>
		<a id="add" class="btn btn-primary">파일 추가하기</a><br>
		<a id="remove" class="btn btn-primary">파일 제거하기</a><br>
		<div id="fileUpload">
			<input multiple="multiple" type="file" name="uploadFile">
		</div><br>
	</form>
	<input type="button" id="sub" value="문의 등록">
	<br>
<!-- 	<div id="add_qna">문의등록</div> -->
</section>


<section id="detail">
	<h2>QnA상세화면</h2>
	<form id="detail_f">
		문의번호<br>
		<input type="text" id="d_inq_no" name="inq_no" readonly="readonly"><br>
	
		작성자<br>
		<input type="text" id="d_user_id" name="user_id" readonly="readonly"><br>
		
		카테고리<br>
		<input type="text" id="d_cs_no" readonly="readonly"><br>
		
		제목<br>
		<input type="text" id="d_inq_title" readonly="readonly"><br>
		
		내용<br>
		<textarea rows="8" cols="100" id="d_inq_content" readonly="readonly"></textarea><br>
		
		사진<br>
		<img id="d_inq__file" alt="이미지가 없습니다">
	</form>
	<br>
	<div id="delete_qna">삭제</div>
	<br>
	<a href="/customerservice/listQnA">리스트</a>
</section>





<section id="list">
<form name="frm">
    <input type="hidden" name="pageNo" /><!-- //페이지 번호 -->
    <input type="hidden" name="searchFiled" value="${pageVO.searchFiled }" /><!-- //검색조건 -->
    <input type="hidden" name="searchValue" value="${pageVO.searchValue }" /><!-- //검색어 -->

<div id="wrap">
    <div id="table" style="height: 470px;">
    <h2>QnA게시판</h2>
	<hr>
        <table id="list_qna" border="1" width="60%">
            <thead>
                <tr>
                    <th>글번호</th>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일자</th>
                </tr>                              
             </thead>
        </table>
        <div id="QnA">QnA등록</div>
    </div>
    <div id="page">
    <c:if test="${pageVO.pageNo != 0}">
        <c:if test="${pageVO.pageNo > pageVO.pageBlock}">
            <a href="javascript:fn_movePage(${pageVO.firstPageNo})" style="text-decoration: none;">[첫 페이지]</a>
       </c:if>
       <c:if test="${pageVO.pageNo != 1}">
           <a href="javascript:fn_movePage(${pageVO.prevPageNo})" style="text-decoration: none;">[이전]</a>
        </c:if>
        <span>
            <c:forEach var="i" begin="${pageVO.startPageNo}" end="${pageVO.endPageNo}" step="1">
                <c:choose>
                    <c:when test="${i eq pageVO.pageNo}">
                        <a href="javascript:fn_movePage(${i})" style="text-decoration: none;">
                            <font style="font-weight: bold;">${i}</font>

                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:fn_movePage(${i})" style="text-decoration: none;">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </span>
        <c:if test="${pageVO.pageNo != pageVO.finalPageNo }">
            <a href="javascript:fn_movePage(${pageVO.nextPageNo})" style="text-decoration: none;">[다음]</a>
        </c:if>
        <c:if test="${pageVO.endPageNo < pageVO.finalPageNo }">
            <a href="javascript:fn_movePage(${pageVO.finalPageNo})" style="text-decoration: none;">[마지막 페이지]</a>
        </c:if>
    </c:if>
    </div>
    <div id="search">
        <select id="searchS">
            <option value="inq_no">문의번호</option>
            <option value="inq_title">제목</option>
        </select>
        <input type="text" id="searchI"/>
        <input type="button" value="SEARCH" onclick="fn_search();"/>
    </div>
 
</div>
</form>
</section>
</body>
</html>