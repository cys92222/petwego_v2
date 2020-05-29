<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!-- 민아) 5/27, 관리자페이지 자유게시판 목록 -->
<%@include file="../header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	// 테이블 정렬 defalut가 asc라서 게시물번호(0) 기준으로 desc해달라고 함 
    $('#ok').DataTable( {
        "order": [[ 0, "desc" ]]
    } );
} );
</script>
</head>
<body>
<br>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">게시판 관리</h1>
		<p class="mb-4">게시판관리 | 자유게시판</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">자유게시판</h6>
			</div>

			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered table-hover" id="ok" width="100%" cellspacing="0" style="text-align: center;">
						<thead>
							<tr>
								<th>게시물번호</th>
								<th>카테고리</th>
								<th>제목</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>아이디</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>게시물번호</th>
								<th>카테고리</th>
								<th>제목</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>아이디</th>				
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="board" items="${listBoard }">
							<tr>
								<td><c:out value="${board.board_no }" /></td>
								<td><c:out value="${board.category }"/></td>
								<td>
								<a href="/management/freeBoard/detailBoard?board_no=${board.board_no}">
								<c:out value="${board.board_title }"/></a>
								</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.board_date }"/></td>
								<td><c:out value="${board.board_hit }"/></td>
								<td><c:out value="${board.user_id }"/></td>										
							</tr>
							</c:forEach>
						</tbody>
					</table>
	
				</div>
			</div>
		</div>
	</div>

</body>
<%@include file="../footer.jsp"%>
</html>