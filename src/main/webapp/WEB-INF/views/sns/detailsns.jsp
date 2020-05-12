<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sns상세보기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
			var photo_no = $("#photo_no").val;
			//수정
		$("#btnUpdate").click(function(){
				self.location ="/sns/updatesns?photo_no="+photo_no;	
				})
			//삭제
		$("btnDelete").click(function(){
			var chk == confirm(function(){
				if(check == true){
					self.location = "/board/update?photo_no="+photo_no;
					alert("게시글이 삭제되었습니다.")
					}
				})
			})	
			// 댓글작성버튼을 누르면!
			$("#comment").click(function(){

				var commCheck = confirm("한번 등록하면 수정할 수 없습니다. 이대로 등록하시겠습니까?");
				if(commCheck == true){
					var commSubmit = $("form[name='commentForm']");
					commSubmit.attr("action","/comment/insertComment");
					commSubmit.submit();
				}
			})
			
			// 댓글 목록
			$.ajax("/comment/listComment",{type:"GET",data:{board_no:board_no},success:function(comm){
				comm = JSON.parse(comm);
				$.each(comm, function(idx,c){						
					var tr = $("<tr></tr>");
					var td1 = $("<td></td>").html(c.comm_cont);
					var td2 = $("<td></td>").html( moment(c.comm_date).format('YYYY년 MM월 DD일 HH:mm:ss')	);
					var td3 = $("<td></td>").html(c.user_id);
					var delBtn = $("<button></button>").text("댓글삭제").attr("comm_num",c.comm_num);
					var td4 = $("<td></td>");
					td4.append(delBtn);
					tr.append(td1, td2, td3, td4);
					$("#comm_list").append(tr);

					//댓글 삭제
					$(delBtn).click(function(){
			 				//alert("버튼 누름");
							var delCheck = confirm("댓글을 삭제하시겠습니까?");
							if(delCheck == true){
								self.location = "/comment/commDeleteSubmit?comm_num="+c.comm_num;
								alert("댓글을 삭제했습니다!");
								location.reload();
							}
					})
				})
			}})



		});

</script>
</head>
<body>
	<h2>자유게시판 상세보기</h2>
	<hr>
	<a href="list">게시글 목록</a><br><br>
	<form id="f">
	<input type="hidden" id="photo_no" value="${photo_no }">
	<table border="1" width="70%">
<!-- 		<tr> -->
<!-- 			<td>글 제목</td> -->
<%-- 			<td><input type="text" value="${detail.board_title }" name="board_title" readonly="readonly"></td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>등록일</td>	 -->
<%-- 			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${detail.board_date }"/></td> --%>
<!-- 		</tr> -->
		<tr>
			<td>사진</td>
			<td>${photo_no}</td>
		</tr>
		<tr>
			<td>글 내용</td>
			<td><div>${photo_detail }</div></td>
		</tr>
	</table>
	</form>
	<button id="btnUpdate">글 수정</button>
	<button id="btnDelete">글 삭제</button>
	<hr>
	<!-- 댓글입력 -->
	<form name="commentForm" method="post">
		<input type="hidden" id="photo_no" name="photo_no" value="${photo_detail}">
		댓글 작성자 : <input type="text" name="user_id" required="required"><br>
		댓글 내용 : <textarea name="comm_cont" rows="5" cols="20"></textarea><br>
	</form>
	<button type="submit" id="comment">댓글 등록</button>
	<hr>
	<!-- 댓글 목록-->
	<table id="comm_list" border="1">
	</table>
</body>
</html>
