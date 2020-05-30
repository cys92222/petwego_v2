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
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../footer.jsp"%>
</body>
</html>