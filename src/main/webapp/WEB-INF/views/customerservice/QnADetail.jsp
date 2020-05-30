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
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">${detail.inq_title }</h4>
				<div class="basic-form">
					<form>
						<div class="form-group">
							<label>
								<img alt="사진이 없습니다" src="../img/peopleImg/${member.fname }" width=25 height=25>  ${detail.user_id } / ${detail.inq_date }</label>
							<div class="form-control h-150px" rows="6" id="comment">${detail.inq_content }</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	



<%@ include file="../footer.jsp"%>
</body>
</html>