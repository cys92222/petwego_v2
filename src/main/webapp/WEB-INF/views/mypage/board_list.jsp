<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){

	var arr = ${myl};

	$.each(arr,function(idx,btn){
// 		console.log(btn.board_no);
		$("#"+btn.board_no).click(function(){
			data = {board_no:btn.board_no};
			$.ajax("/mypage/comment_list",{data:data,success:function(str){
// 				alert(str);
// 				console.log(str);
// 				console.log(s);
// 				var id = $("<div></div>").append(str.user_id);
// 				var cont = $("<div></div>").append(str.comm_cont);
// 				$("#comment_sec").append(id,cont);
				$.each(str,function(idx,co){
// 					console.log(co);
// 					alert(co.user_id);
					var comment = $("<div></div>").append(co.user_id +"님 : " +co.comm_cont);
	 				$("#comment_sec"+btn.board_no).append(comment);
					})
				}});
			});
		});
	
	
// 	$("#comment_see").click(function(){
// 		var bn = $("#bn").val();
// 		alert("댓글보기누름 글번호 " + bn);
// 		$.ajax("/mypage/comment_list",{data:{board_no:bn},success:function(){
// 			var comment = ${comment};
// 			alret(comment);
// 			}});
// 		});

});
</script>
</head>
<body>
<div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">자유게시판 작성글</h4>
                                <p class="text-muted"><code></code>
                                </p>
                                <div id="accordion-three" class="accordion">
                                    <div class="card">
                                    <c:forEach var="b" items="${myboard }" varStatus="status">
                                        <div class="card-header">
                                            <h5 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseOne${b.board_no }" aria-expanded="false" aria-controls="collapseOne${b.board_no }" ><i class="fa" aria-hidden="true"></i> ${b.board_title }</h5>
                                        </div>
                                        <div id="collapseOne${b.board_no }" class="collapse" data-parent="#accordion-three" style="">
                                            <div class="card-body">${b.board_content }</div>
                                            <hr>
                                            	<div id="${b.board_no }">
                                            		댓글보기
                                            	</div>
                                            	<section id="comment_sec${b.board_no }">
                                            	
                                            	</section>

                                         <hr>
                                        <a href="/board/get?board_no=${b.board_no }">이 게시물로 이동하기</a><br>
                                        </div>
                                	</c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<%@ include file="../footer.jsp"%>
</body>
</html>