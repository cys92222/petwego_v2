<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<%-- <%@include file="../head.jsp"%> --%>
<%@include file="../header.jsp"%>
<%@include file="../head.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<!-- 민아) 5/10, 자유게시판 목록 -->
<body>
	<div class="main-panel">
		<div class="content">
			<div class="page-inner">
				<div class="page-header">
					<h4 class="page-title">자유게시판</h4>
					<ul class="breadcrumbs">
						<li class="nav-home"><a href="/MainPage"> <i class="flaticon-home"></i></a></li>
						<li class="separator"><i class="flaticon-right-arrow"></i></li>
						<li class="nav-item"><a href="/board/list">자유게시판</a></li>
					</ul>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">자유게시판 목록</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="basic-datatables" class="display table table-striped table-hover">
										<thead>
											<tr>
												<th>글번호</th>
												<th>카테고리</th>
												<th>제목</th>
												<th>등록일</th>
												<th>조회수</th>
												<th>작성자</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th>글번호</th>
												<th>카테고리</th>
												<th>제목</th>
												<th>등록일</th>
												<th>조회수</th>
												<th>작성자</th>
											</tr>
										</tfoot>
										<tbody>
											<c:forEach var="board" items="${listBoard }">
												<tr>
													<td><c:out value="${board.board_no }" /></td>
													<td><c:out value="${board.category }" /></td>
													<td><a href="/board/get?board_no=${board.board_no}"><c:out value="${board.board_title }" /></a></td>
													<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.board_date }" /></td>
													<td><c:out value="${board.board_hit }" /></td>
													<td><c:out value="${board.user_id }" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../footer.jsp"%>

	</div>
</body>
</html>