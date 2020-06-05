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

		var inq_no = $("<td></td>").append(qna.inq_no);
		
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
		
		var tr = $("<tr></tr>").append(inq_no,cs_no,user_id,inq_title,inq_date);
		$("#QnA_list").append(tr);

		$(tr).on("click",function(){
			window.location.href="/customerservice/QnADetail?inq_no="+qna.inq_no+"&user_id="+qna.user_id;
			});
		});

	//문의하기 버튼
	$("#insertBtn").click(function(){
		window.location.href="/customerservice/insertQnAForm";
		});
});


// 	$('#list').DataTable({
// 		"order" : [ [ 0, "desc" ] ]
// 	});
</script>
</head>
<body>
<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/customerservice/List">QnA게시판 | 목록</a></li>
				<li class="breadcrumb-item active"><a href="/MainPage">메인</a></li>
			</ol>
		</div>
	</div>
	<!-- row -->
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h4>QnA게시판</h4>
				</div>


				<div class="col-lg-12" style="float: left; margin-top: 15px;">
					<div class="form-group" style="float: left;">
						<select class="form-control form-control-sm" name="searchType" style="width: 100px;">
							<option value="n"
								<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>카테고리</option>
							<option value="t"
								<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
							<option value="c"
								<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
							<option value="w"
								<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
							<option value="tc"
								<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						</select>
					</div>

					<div class="basic-form" style="float: left;">
						<form>
							<div class="form-group">
								<input type="text" class="form-control input-flat" name="keyword" id="keywordInput" value="${scri.keyword}"
								 	style="width: 300px; margin-left: 5px;" />
							</div>
						</form>
					</div>
					<button id="searchBtn" type="submit" class="btn btn-primary col-lg-1 col-md-12 col-sm-12 my-1 h-75">검색</button>

					<script>
						$(function() { -->
  							$('#searchBtn').click(function() {
 												self.location = "/customerservice/List" + '${pageMaker.makeQuery(1)}' + "&searchType="
 														+ $("select option:selected").val() 
  														+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
 											}); 
 							}); 
</script>
					<div class="table-responsive">
						<table class="table table-hover" id="QnA_list">
							<tr>
								<th>번호</th><th>카테고리</th><th>작성자</th><th>제목</th><th>작성일자</th>
							</tr>
						</table>
					</div>

					<div class="bootstrap-pagination">
						<nav>
							<ul class="pagination justify-content-center">
								<c:if test="${pageMaker.prev}">
									<li class="page-item disabled">
										<a class="page-link" href="/customerservice/List${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
									</li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
									<li class="page-item">
										<a class="page-link" href="/customerservice/List${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item">
										<a class="page-link" href="/customerservice/List${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
									</li>
								</c:if>

							</ul>
						</nav>
					</div>

				</div>
				<button class="btn mb-1 btn-primary" id="insertBtn" type="button" style="float: right">문의하기</button>	
			</div>
					
		</div>
		
	</div>

<!--  <div class="container-fluid"> -->
<!--                 <div class="row"> -->
<!--                     <div class="col-12"> -->
<!--                         <div class="card"> -->
<!--                             <div class="card-body"> -->
<!--                                 <h4 class="card-title">예약 내역</h4> -->
<!--                                 <div class="table-responsive"> -->
<!--                                     <table class="table table-striped table-bordered zero-configuration" id="list"> -->
<!--                                         <thead> -->
<!--                                             <tr> -->
<!--                                                 <th>번호</th><th>카테고리</th><th>작성자</th><th>제목</th><th>작성일자</th> -->
<!--                                             </tr> -->
<!--                                         </thead> -->
<!--                                         <tbody> -->
<%-- 									<c:forEach items="${list2}" var="qna"> --%>
<!-- 										<tr> -->
<%-- 											<td>${qna.inq_no }</td> --%>
<!-- 										</tr> -->
<%-- 									</c:forEach> --%>
<!--                                         </tbody> -->
<!--                                         <tfoot> -->
<!--                                             <tr> -->
<!--                                                <th>번호</th><th>카테고리</th><th>작성자</th><th>제목</th><th>작성일자</th> -->
<!--                                             </tr> -->
<!--                                         </tfoot> -->
<!--                                     </table> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<%@ include file="../footer.jsp"%>
</body>
</html>