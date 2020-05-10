<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께 가요</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='writeForm']");
	$(".write_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		}
		formObj.attr("action", "writeTogether");
		formObj.attr("method", "post");
		formObj.submit();
	});
})
function fn_valiChk(){
	var regForm = $("form[name='writeForm'] .chk").length;
	for(var i = 0; i<regForm; i++){
		if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
			alert($(".chk").eq(i).attr("title"));
			return true;
		}
	}
}
</script>
</head>
<body>
		<div id="root">
			<header>
				<h1> 함께가요 등록하기</h1>
			</header>
			<hr />
			 
			<nav>
			  홈 - 글 작성
			</nav>
			<hr />
			
			<section id="container">
				<form method="post" action="writeTogether" name="writeForm">
					<table>
						<tbody>
							
							<tr>
								<td>
									<label for="t_title">제목</label><input type="text" id="t_title" name="t_title" class="chk" title="제목을 입력하세요." />
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="t_intro">인트로</label><input type="text" id="t_intro" name="t_intro" class="chk" title="인트로를 입력하세요."/>
								</td>
							<tr>
							
							<tr>
								<td>
									<label for="t_detail">내용</label><textarea id="t_detail" name="t_detail" class="chk" title="내용을 입력하세요."></textarea>
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="t_place">모임장소</label><input type="text" id="t_place" name="t_place" class="chk" title="모임장소를 입력하세요."/>
								</td>
							<tr>
					
							<tr>
								<td>
									<label for="t_date">모임일</label><input type="text" id="t_date" name="t_date" class="chk" title="모임날짜를 입력하세요."/>
								</td>
							</tr>
							<tr>
								<td>						
									<button type="submit" class="write_btn">작성</button>
								</td>
							</tr>			
						</tbody>			
					</table>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>