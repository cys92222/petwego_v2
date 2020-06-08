<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
	var arr = ${list};

	$.each(arr,function(idx,notice){
		var notice_no = $("<td></td>").append(notice.notice_no);
		var notice_title = $("<td></td>").append(notice.notice_title);
		var notice_content = $("<td></td>").append(notice.notice_content);
		var notice_hit = $("<td></td>").html(notice.notice_hit);
		var notice_date = $("<td></td>").append(notice.notice_date);

		var cs_no = $("<td></td>");
			
		if(notice.cs_no == 1){
			cs_no.html("홈페이지 이용 관련");
		}else if (notice.cs_no == 2){
			cs_no.html("계정 관련");
		}else if (notice.cs_no ==3){
			cs_no.html("결제 관련 문의");
			}
			

		var tr = $("<tr></tr>").append(notice_no,cs_no, notice_title, notice_hit, notice_date);

		$("#listNotie").append(tr);

		$(tr).on("click",function(){
			window.location.href="/customerservice/detailNotice?notice_no="+notice.notice_no;
			});
		});

// 	 $('#notice_list').DataTable( {
// 	        "order": [[ 0, "desc" ]]
// 	    } );
});
</script>
</head>
<body>
<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/customerservice/allNotice">공지사항게시판 | 목록</a></li>
				<li class="breadcrumb-item active"><a href="/MainPage">메인</a></li>
			</ol>
		</div>
	</div>
	<!-- row -->
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h4>공지사항게시판</h4>
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
						$(function() {
							$('#searchBtn').click(function() {
												self.location = "/customerservice/allNotice" + '${pageMaker.makeQuery(1)}' + "&searchType="
														+ $("select option:selected").val()
														+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
											});
							});
					</script>
					<div class="table-responsive">
						<table class="table table-hover" id="listNotie">
						<tr>
							<th>공지번호</th><th>카테고리</th><th>제목</th><th>조회수</th><th>작성일자</th>
						</tr>

						</table>
					</div>

					<div class="bootstrap-pagination">
						<nav>
							<ul class="pagination justify-content-center">
								<c:if test="${pageMaker.prev}">
									<li class="page-item disabled">
										<a class="page-link" href="/customerservice/allNotice${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
									</li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
									<li class="page-item">
										<a class="page-link" href="/customerservice/allNotice${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item">
										<a class="page-link" href="/customerservice/allNotice${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
									</li>
								</c:if>

							</ul>
						</nav>
					</div>

				</div>
<!-- 				<button class="btn mb-1 btn-primary" id="insertBtn" type="button" style="float: right">글쓰기</button>	 -->
			</div>
					
		</div>
		
	</div>
<%@ include file="../footer.jsp"%>
</body>
</html>