<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
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
				<li class="breadcrumb-item"><a href="/mypage/mypage">마이페이지 | 내가 쓴 SNS 글</a></li>
				<li class="breadcrumb-item active"><a href="/MainPage">메인</a></li>
			</ol>
		</div>
	</div>
<div class="container-fluid">
<h4>SNS 작성글</h4>

	<div class="row">
	<c:forEach var="sns" items="${mysns }" varStatus="status">
	                    <div class="col-lg-3">
	                        <div class="card">
	                            <div class="card-body">
	                                <h4 class="card-title">글번호 / ${sns.photo_no }</h4>
	                                <div class="bootstrap-carousel">
	                                    <div class="carousel slide" data-ride="carousel">
	                                        <div class="carousel-inner">
	                                            <div class="carousel-item active">
	                                            <a href="/pic_board/detail?photo_no=${sns.photo_no }&user_id=${sns.user_id }&in_user_id=${login_id }">
<%-- 	                                                <img class="d-block w-100" src="/img/${mysnspic[status.index].photo_file_name}" /> --%>
	                                                <img width="310" height="210" src="../img/snsImg/${mysnspic[status.index].photo_file_name}" />
	                                             </a>   
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
		</c:forEach>
	</div>
</div>
  
      <%@ include file="../footer.jsp"%>
</body>
</html>