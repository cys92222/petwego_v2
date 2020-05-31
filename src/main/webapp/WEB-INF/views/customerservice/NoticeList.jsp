<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			

		var tr = $("<tr></tr>").append(cs_no, notice_title, notice_hit, notice_date);

		$("#listNotie").append(tr);

		$(tr).on("click",function(){
			window.location.href="/customerservice/detailNotice?notice_no="+notice.notice_no;
			});
		});
});
</script>
</head>
<body>
<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">공지사항</a></li>
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
							<h4 class="card-title">공지사항</h4>
							<div class="table-responsive">
								<table
									class="table table-striped table-bordered zero-configuration">
									<thead>
										<tr><th>카테고리</th><th>제목</th><th>조회수</th><th>작성일자</th></tr>
									</thead>
									
									<tbody id="listNotie">
									</tbody>
									
									<tfoot>
										<tr><th>카테고리</th><th>제목</th><th>조회수</th><th>작성일자</th></tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<%@ include file="../footer.jsp"%>
</body>
</html>