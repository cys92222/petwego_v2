<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		window.location.href="/mypage/animal_indo_up";
		});
	
	//회원탈퇴
	$("#widthdraw_btn").click(function(){
		var ck = confirm("탈퇴하시겠습니까?");
		if(ck == true){
			alert("탈퇴");
		}else{
			
			}
		});
});
</script>
</head>
<body>
	<h1>마이페이지</h1>
<hr>
<section id="info">
	<h2>~~님의 정보입니다</h2>
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
			<td><button>반려동물 등록</button></td>
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
	<h2>~~님이 작성한 게시물 리스트</h2>  
	<a href="/mypage/board_list">더보기</a><br>
	<ul>
		<li>1</li>
		<li>2</li>
		<li>3</li>
		<li>4</li>
		<li>4</li>
	</ul>
</section>	

<section id="pay_list">
	<h2>~~님의 결제 내역</h2>  
	<a href="/mypage/pay_list">더보기</a><br>
	<ul>
		<li>1</li>
		<li>2</li>
		<li>3</li>
		<li>4</li>
		<li>4</li>
	</ul>
</section>

<section id="together_list">
	<h2>~~님의 함께가요 목록</h2>  
	<a href="/mypage/together_list">더보기</a><br>
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