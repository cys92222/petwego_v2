<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<html>
<head>

<!-- 민아) 5/19, 관리자페이지_회원관리 -->
<!-- 민아) 5/24, 관리자페이지 꾸미기 및 정리 중  -->
<meta charset="UTF-8">
<script type="text/javascript">
	$(function(){
		var user_id = $("#user_id").val();

		// 회원 진짜 강퇴, 글쓴게 있고 이래도 강퇴가 됨 
		$("#btnDelete").click(function(){
			var check = confirm("회원을 강제탈퇴 시키시겠습니까?")
			if(check == true){
				var check2 = confirm("정말 회원의 계정을 탈퇴처리 하시겠습니까?")
				if(check2 == true){
					self.location = "/management/member/member_delete?user_id="+user_id;
					alert("회원 강제탈퇴 완료!");
				}
			}
		});
		
		// 휴면계정으로 전환 
		$("#btnBreak").click(function(){
			var check = confirm("회원을 휴면계정으로 전환 시키시겠습니까?")
			if(check == true){
				var check2 = confirm("정말 회원의 계정을 휴면계정으로 바꾸시겠습니까?")
				if(check2 == true){
					self.location = "/management/member/update_enabled?user_id="+user_id;
					alert("휴면계정으로 전환 완료!");
				}
			}
		});

		// 휴면계정에서 일반계정으로 전환
		$("#btnRollback").click(function(){
			var check = confirm("휴면계정을 일반계정으로 전환하시겠습니까?")
			if(check == true){
				var check2 = confirm("일반계정으로 전환 합니다?")
				if(check2 == true){
					self.location = "/management/member/rollback_enabled?user_id="+user_id;
					alert("일반계정으로 전환 완료!");
				}
			}
		})
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
			<td>${detail_Info.address }) &nbsp; ${detail_Info.address2 }&nbsp; ${detail_Info.address3 }</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>${detail_Info.gender }</td>
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
	<c:if test="${detail_Info.enabled == 1 }">   
	<!-- 휴면계정으로 전환버튼 -->
		<a href="#" class="btn btn-warning btn-icon-split" id="btnBreak">
       	 <span class="icon text-white-50">
        	<i class="far fa-frown"></i>
         </span>
        	<span class="text">휴면계정전환 | 회원정지</span>
        </a>
        </c:if> 
  <c:if test="${detail_Info.enabled == 0 }">   
   <!-- 다시 회원으로 전환버튼 -->
		<a href="#" class="btn btn-success btn-icon-split" id="btnRollback">
       	 <span class="icon text-white-50">
        	<i class="fas fa-undo"></i>
         </span>
        	<span class="text">회원전환 | 휴면해제</span>
        </a>
   </c:if>  
   
   <!-- 회원강퇴 버튼 -->
	<a style="float: right;" href="#" class="btn btn-danger btn-icon-split" id="btnDelete">
      	 <span class="icon text-white-50">
       	<i class="fas fa-trash"></i>
        </span>
       	<span class="text">회원계정삭제 | 강제탈퇴</span>
       </a>
   <!-- 회원강퇴 버튼 끝-->
	</div>
</div>
</div>
</body>
<%@include file="../footer.jsp"%>
</html>