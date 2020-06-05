<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){

	//수정
	$("#up").on("click",function(){
		var con = confirm("수정할까요?");

		if(con == true){
			var dd_no = {inq_no:${detail.inq_no},ref:${detail.ref}};
			console.log(dd_no);
			
			//답변 있는지 확인
			$.ajax("/customerservice/checkQnA",{data:dd_no,success:function(r){
// 					alert(r);
// 					console.log(typeof r);
					if(r === "o"){
						alert("답변이 있는 문의글은 수정,삭제 불가능합니다");
							window.location.href="/customerservice/QnADetail?inq_no="+${detail.inq_no};
						}else{
							//답변 없으면 수정	
							window.location.href="/customerservice/updateQnAForm?inq_no="+${detail.inq_no};							
						}
				}}); //checkQnA end
			}	
		
		});


	
	//삭제
	$("#del").click(function(){
//			alert(qna.inq_no);
		var con = confirm("삭제할까요?");

		if(con == true){
			var dd_no = {inq_no:${detail.inq_no},ref:${detail.ref}}
			console.log(dd_no);
			
			//답변 있는지 확인
			$.ajax("/customerservice/checkQnA",{data:dd_no,success:function(r){
//						alert(r);
					console.log(typeof r);
					if(r === "o"){
						alert("답변이 있는 문의글은 수정,삭제 불가능합니다");
							window.location.href="/customerservice/List";
						}else{
							//답변 없으면 삭제
							$.ajax("/customerservice/deleteQnA",{data:{inq_no:${detail.inq_no}},success:function(){
								window.location.href="/customerservice/List";
								}});							
						}
				}}); //checkQnA end
			}					
		}); //삭제 end
});
</script>
</head>
<body>
<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/customerservice/List">QnA게시판 | 상세보기</a></li>
				<li class="breadcrumb-item active"><a href="/MainPage">메인</a></li>
			</ol>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="read-content">
							<div class="media pt-5">
								<img class="mr-3 rounded-circle"
									src="../img/peopleImg/${member.fname }" width=25 height=25>
								<div class="media-body">
									<h5 class="m-b-3">${detail.user_id }</h5>
									<small class="text-muted">${member.email }</small>
									<p class="m-b-2">${detail.inq_date }</p>
								</div>

							</div>
							<hr>
							<div class="media mb-4 mt-1">
								<div class="media-body">
									<h4 class="m-0 text-primary">${detail.inq_title }</h4>

								</div>
							</div>
							<div>${detail.inq_content }</div>

							<hr>
							<h6 class="p-t-15">
								<i class="fa fa-download mb-2"></i> 첨부파일
							</h6>
							<div class="row m-b-30">
								<div class="col-auto">
									<a href="#" class="text-muted">${detail.inq_file }</a>
								</div>
							</div>
							<hr>
						</div>
						<c:if test="${login_id eq detail.user_id}">
							<button class="btn btn-primary" id="up">수정하기</button>
							<button class="btn btn-primary" id="del">삭제하기</button>
						</c:if>	
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../footer.jsp"%>
</body>
</html>