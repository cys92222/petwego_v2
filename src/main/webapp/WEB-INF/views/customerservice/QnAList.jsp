<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
$(function(){
	var arr = ${list};

	$.each(arr,function(idx,qna){

		var category = qna.cs_no;
		var cs_no = $("<td></td>");
		if(category == 1){
			cs_no.append("홈페이지 이용 관련");
			}
		else if(category == 2){
			cs_no.append("계정 관련");
			}
		else if(category ==3 ){
			cs_no.append("결제 관련 문의");
			}
		var user_id = $("<td></td>").append(qna.user_id);

		var a = qna.inq_title;

		var reimg = $("<img src='../adminImg/re4.png'>");
		if(qna.ref_level > 0){
			var inq_title = $("<td></td>");
			//들여쓰기
			for(var g = 0; g<=qna.ref_level; g++){
					inq_title.append("&nbsp;","&nbsp;");
				}
			inq_title.append(reimg,a);
			var user_id = $("<td></td>").append("관리자");
			}else {
				var inq_title = $("<td></td>").append(a);
				var user_id = $("<td></td>").append(qna.user_id);
				}

		var inq_date = $("<td></td>").append(qna.inq_date);
		
		var tr = $("<tr></tr>").append(cs_no,user_id,inq_title,inq_date);
		$("#QnA_list").append(tr);

		$(tr).on("click",function(){
			window.location.href="/customerservice/QnADetail?inq_no="+qna.inq_no+"&user_id="+qna.user_id;
			});
		});

	//문의하기 버튼
	$("#insert_qna").click(function(){
		window.location.href="/customerservice/insertQnAForm";
		});
});
</script>
</head>
<body>
<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">QnA게시판</a></li>
					<li class="breadcrumb-item active"><a
						href="javascript:void(0)">메인</a></li>
				</ol>
			</div>
		</div>
		<!-- row -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">QnA게시판</h4>
							<div class="table-responsive">
								<table
									class="table table-striped table-bordered zero-configuration">
									<thead>
										<tr><th>카테고리</th><th>작성자</th><th>제목</th><th>작성일자</th></tr>
									</thead>
									
									<tbody id="QnA_list">
									</tbody>
									
									<tfoot>
										<tr><th>카테고리</th><th>작성자</th><th>제목</th><th>작성일자</th></tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<button class="btn btn-primary" id="insert_qna">문의하기</button>
		</div>
<%@ include file="../footer.jsp"%>
</body>
</html>