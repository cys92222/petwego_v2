<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/customerservice/allNotice">공지사항게시판 | 상세보기</a></li>
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
								<div class="media-body">
								<h5 class="m-b-3">
								<c:if test="${detail.cs_no == 1}">
									홈페이지 이용 관련
								</c:if>	
								<c:if test="${detail.cs_no == 2}">
									계정 관련
								</c:if>	
								<c:if test="${detail.cs_no == 3}">
									결제 관련
								</c:if>	
								</h5>
									<p class="m-b-2">${detail.notice_date }</p>
								</div>

							</div>
							<hr>
							<div class="media mb-4 mt-1">
								<div class="media-body">
									<h4 class="m-0 text-primary">${detail.notice_title }</h4>

								</div>
							</div>
							<div>${detail.notice_content }</div>

							<hr>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="../footer.jsp"%>
</body>
</html>