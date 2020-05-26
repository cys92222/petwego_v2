<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<%@include file="../header.jsp"%>
<head>
<!-- 민아) 5/19, 관리자페이지_회원관리 -->
<!-- 민아) 5/24, 관리자페이지 꾸미기 및 정리 중  -->
<meta charset="UTF-8">
<script type="text/javascript">
	$(function(){
		var user_id = $("#user_id").val();
		
		//회원 강퇴를 누르면
		$("#btnDelete").click(function(){
			var check = confirm("회원을 강퇴시키시겠습니까?")
			if(check == true){
				var check2 = confirm("돌이킬 수 없습니다. 정말 강퇴하시겠습니까?")
				if(check2 == true){
					self.location = "/management/member/member_delete?user_id="+user_id;
					alert("회원을 강퇴시켰습니다!");
				}
			}
		});
	})

</script>
</head>
<body>
<br>
<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">회원</h1>
	<p class="mb-4">회원관리 | 관리자접속중</p>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
    	<div class="card-header py-3">
        	<h6 class="m-0 font-weight-bold text-primary">회원정보 상세보기</h6>
        </div>
        <div class="card-body">
	
	<!-- 원래내가 쓴 부분  -->
	<a href="/management/member/member_list">회원 목록</a><br><br>

	<input type="hidden" id="user_id" value="${detail_Info.user_id }">
	<table class="table table-bordered" border="1" width="80%"  style="text-align: center;">
		<tr>
			<td>아이디</td>
			<td>${detail_Info.user_id }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${detail_Info.name }</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>${detail_Info.nick_name }</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${detail_Info.tel }</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${detail_Info.birth }</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${detail_Info.address }</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>${detail_Info.gender }</td>
		</tr>
		<tr>
			<td>프로필 사진</td>
			<td>굳이 봐야하나?? </td>
		</tr>
		<tr>
			<td>자기소개</td>
			<td>${detail_Info.intro }</td>
		</tr>
		<tr>
			<td>가입일</td>
			<td>${detail_Info.info_create_date }</td>
		</tr>
		<tr>
			<td>정보수정일</td>
			<td>${detail_Info.info_update_date }</td>
		</tr>
	</table>
	<!-- 회원 강퇴 버튼 -->
		<a href="#" class="btn btn-danger btn-icon-split" id="btnDelete">
       	 <span class="icon text-white-50">
        	<i class="fas fa-trash"></i>
         </span>
        	<span class="text">회원 강퇴</span>
        </a>
	</div>
	</div>
	</div>
	
</body>
<%@include file="../footer.jsp"%>
</html>