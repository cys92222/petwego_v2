<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$(function(){
	//사람 사진 수정
	$("#people_pic_up_btn").click(function(){
		window.location.href="/mypage/people_pic_up";
		});

	//사람 정보 수정
	$("#people_info_up_btn").click(function(){
		window.location.href="/mypage/people_info_up";
		});

	//동물 사진 수정
	$("#animal_pic_up_btn").click(function(){
		window.location.href="/mypage/animal_pic_up";
		});
	
	//동물 정보 수정
	$("#animal_info_up_btn").click(function(){
		window.location.href="/mypage/animal_info_up";
		});
	
	//회원탈퇴
	$("#widthdraw_btn").click(function(){
		var ck = confirm("탈퇴하시겠습니까?");
		if(ck == true){
			alert("탈퇴");
		}else{
			
			}
		});

	//반려동물 등록
	$("#insert_animal").click(function(){
		window.location.href="/mypage/insert_animal";
		});
});
</script>
</head>
<body>
	<h1>마이페이지</h1>
<hr>
<section id="info">
	<h2>${myinfo.user_id }님의 정보입니다</h2>
	<table>
		<tr>
			<td>
				<div>
					<img alt="사진이 없습니다" src="" width="100" height="100"><br>
					<button id="people_pic_up_btn">사진 수정</button>
				</div>
			</td>

			<td>
				<div>
					사람 정보<br>
					<button id="people_info_up_btn">정보 수정</button>
				</div>
			</td>
		</tr>
		
	<tr><td>동물 리스트</td></tr>
		<tr>
			<td><button id="insert_animal">반려동물 등록</button></td>
		</tr>
	
		<tr>
			<td>	
				<div>
					<img alt="사진이 없습니다" src="" width="100" height="100"><br>
					<button id="animal_pic_up_btn">사진 수정</button>
				</div>
			</td>

			<td>
				<div>
					동물 정보<br>
					<button id="animal_info_up_btn">정보 수정</button>
				</div>
			</td>
		</tr>
	</table>
</section>

<section id="board_list">	
	<h2>${myinfo.user_id }님이 작성한 글 입니다</h2>
	<a href="/mypage/board_list?user_id=${myinfo.user_id }">더보기</a><br>
	
	<ul>
		<c:forEach var="b" items="${myboard }" begin="0" end="5">
			<li>
				<a href="/board/get?board_no=${b.board_no}">${b.board_title }</a>
			</li>
		</c:forEach>
	</ul>
</section>	

<section id="together_list">
	<h2>${myinfo.user_id }님이 작성한 함께가요 글 입니다</h2> 
	<a href="/mypage/together_list?user_id=${myinfo.user_id }">더보기</a><br>
	<ul>
		<c:forEach var="to" items="${mytogether }" begin="0" end="5">
			<li>
				<a href="/together/detailTogether?t_num=${to.t_num}">${to.t_title }</a>
			</li>
		</c:forEach>
	</ul>
</section>

<section id="sns_list">
	<h2>${myinfo.user_id }님이 작성한 sns 글 입니다</h2> 
	<a href="/mypage/sns_list?user_id=${myinfo.user_id }">더보기</a><br>
	<ul>
		<c:forEach var="sns" items="${mysns }" begin="0" end="5">
			<li>
				${sns.photo_no }
			</li>
		</c:forEach>
	</ul>
</section>

<section id="pay_list">
	<h2>${myinfo.user_id }님의 결제내역입니다</h2>  
	<a href="/mypage/pay_list">더보기</a><br>
	<ul>
		<li>1</li>
		<li>2</li>
		<li>3</li>
		<li>4</li>
		<li>4</li>
	</ul>
</section>

<button id="widthdraw_btn">회원탈퇴</button>

</body>
</html>