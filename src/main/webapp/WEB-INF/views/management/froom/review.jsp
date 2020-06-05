<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- 민아) 6/5, 관리자페이지 숙소 리뷰목록 -->
<%@include file="../header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {

		// 테이블 정렬 defalut가 asc라서 리뷰번호(0) 기준으로 desc해달라고 함 
	    $('#ok').DataTable( {
	        "order": [[ 0, "desc" ]]
	    } );


	     
		
	    // 리뷰 삭제 alert
// 	    $("#deleteR").click(function(){
// 	    	var check = confirm("사용자 리뷰를 삭제하시겠습니까?")
// 	    	var r_no = $("#r_no").val();
// 			if(check == true){
// 				self.location = "/management/froom/deleteReview?r_no="+r_no;
// 				alert("게시글을 삭제했습니다!");
// 			}
// 		 })
	})
</script>
</head>
<body>
	<br>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">숙소관리</h1>
		<p class="mb-4">숙소관리 | 관리자접속중</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">숙소 리뷰관리</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered table-hover" id="ok" width="100%" cellspacing="0" style="text-align: center;">
						<thead>
							<tr>
								<th>리뷰번호</th>
								<th>리뷰내용</th>
								<th>숙소번호</th>	
								<th>아이디</th>																							
								<th>비고</th>																							
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>리뷰번호</th>
								<th>리뷰내용</th>
								<th>숙소번호</th>	
								<th>아이디</th>								
								<th>비고</th>								
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="review" items="${reviewList }">
							<input type="hidden" id="r_no" value="${review.r_no }">
								<tr>
									<td><c:out value="${review.r_no }" /></td>
									<td><c:out value="${review.review_content }" /></td>
									<td><c:out value="${review.facility_no }" /></td>
									<td><c:out value="${review.user_id}" /></td>								
									<td>
										<a href="/management/froom/deleteReview?r_no=${review.r_no }" class="btn btn-danger btn-circle btn-sm"  onclick="return confirm('리뷰를 삭제할까요 ?');">
                   							<i class="fas fa-trash"></i>
                  						</a>
									</td>								
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
<!-- /management/froom/deleteReview?r_no=${review.r_no } -->
</body>
<%@include file="../footer.jsp"%>
</html>