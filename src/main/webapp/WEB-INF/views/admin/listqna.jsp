<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$(function(){

	var arr = ${list};
	
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
		});
	
	
		//등록 폼
		$("#qna").click(function(){
			$("#insert").css({"display":"block"});
			$("#list").css({"display":"none"});
			});

})
</script>
</head>
<body>
<section id="list">
	<h2>문의사항 리스트</h2>
	<hr>
	<table border="1" width="60%" id="list_qna">
		<tr>
			<th>글번호</th><th>카테고리</th><th>글제목</th><th>작성자</th><th>작성일</th>
		</tr>
	</table>
	<button id="qna">문의하기</button>
</section>

<section id="insert">

</section>

<section id="detail">

</section>

</body>
</html>