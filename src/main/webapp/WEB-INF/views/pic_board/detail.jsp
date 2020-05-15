<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.25.0/moment.min.js"></script>
<script type="text/javascript">
	$(function(){
		console.log = ${Board};
		console.log = ${file};
			var photo_no = $("#photo_no").val;
			
			//수정
		$("#btnUpdate").click(function(){
				self.location ="/pic_board/update?photo_no="+photo_no;	
				})
				
			//삭제	
		$("#btnDelete").click(function(){
			var check = confirm("게시글을 삭제하시겠습니까?")
			if(check == true){
				self.location = "/pic_board/delete?photo_no="+photo_no;
				alert("게시글이 삭제되었습니다.")
				}
			})	
			
			
			
			
			
			// 댓글작성버튼을 누르면!
			$("#comment").click(function(){

				var commCheck = confirm("한번 등록하면 수정할 수 없습니다. 이대로 등록하시겠습니까?");
				if(commCheck == true){
					var pcommSubmit = $("form[name='commentForm']");
					pcommSubmit.attr("action","/pcomment/pinsertComment");
					pcommSubmit.submit();
				}
			})
			
			// 댓글 목록
			$.ajax("/comment/listComment",{type:"GET",data:{photo_no:photo_no},success:function(comm){
				comm = JSON.parse(comm);
				$.each(comm, function(idx,c){						
					var tr = $("<tr></tr>");
					var td1 = $("<td></td>").html(c.photo_comm_cont);
					var td2 = $("<td></td>").html( moment(c.photo_comm_date).format('YYYY년 MM월 DD일 HH:mm:ss')	);
					var td3 = $("<td></td>").html(c.user_id);
					var delBtn = $("<button></button>").text("댓글삭제").attr(" photo_comm_no	",c. photo_comm_no);
					var td4 = $("<td></td>");
					td4.append(delBtn);
					tr.append(td1, td2, td3, td4);
					$("#comm_list").append(tr);

					//댓글 삭제
					$(delBtn).click(function(){
			 				//alert("버튼 누름");
							var delCheck = confirm("댓글을 삭제하시겠습니까?");
							if(delCheck == true){
								self.location = "/comment/commDeleteSubmit?photo_comm_no="+c.photo_comm_no;
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
	<h2>sns</h2>
	<hr>
	<a href="/pic_board/list">sns 메인</a><br><br>
	<form id="f">
	<input type="text" id="photo_no" value="${detail.photo_no }">
	<table border="1" width="80%">
		<tr>
			<td>사진</td>
			<td>${detail.photo_no}</td>
		</tr>
		<tr>
			<td>글 내용</td>
			<td><div>${detail.photo_detail }</div></td>
		</tr>
	</table>
	</form>
	<button id="btnUpdate">글 수정</button>
	<button id="btnDelete">글 삭제</button>
	<hr>
	
	<!--댓글입력-->
	<form name="commentForm" method="post">
		<input type="text" id="photo_no" name="photo_no" value="${detail.photo_no}">
		댓글 작성자 : <input type="text" name="user_id" required="required"><br>
		댓글 내용 : <textarea name="photo_comm_cont" rows="5" cols="20"></textarea><br>
	</form>
	<button type="submit" id="comment">댓글 등록</button>
	<hr>
		 댓글 목록
	<table id="comm_list" border="1">
	</table>
</body>
</html>
