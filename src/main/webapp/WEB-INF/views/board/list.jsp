<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<%@include file="../header.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 민아) 5/31, 자유게시판 부트스트랩적용 -->
<script type="text/javascript">
	$(function() {

		// 		// 게시판 자동정렬기능 디폴트가 어센딩이라, 글번호 기준으로 디센딩으로 변경	
		// 		$("#free").DataTable({
		// 			order : [ [ 0, "desc" ] ]
		// 		})

		// 글 쓰기 버튼을 누르면
		$("#insertBtn").click(function() {
			window.location.href = "/board/insert";
		});

		$('#searchBtn').click(function(e){
			e.preventDefault();
			self.location = 'list'+'${pageMaker.makeQuery(1)}'+'&searchType='+$('.form-group select option:selected').val()
			+'&keyword='+encodeURIComponent($('#keywordInput').val());
		});

	})
</script>
<!-- 민아) 5/10, 자유게시판 목록 -->
<body>

	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/board/list">자유게시판 | 목록</a></li>
				<li class="breadcrumb-item active"><a href="/MainPage">메인</a></li>
			</ol>
		</div>
	</div>
	<!-- row -->
          <div class="col-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title mb-5 ml-3 mt-3">
					<h4>자유게시판</h4>
				</div>


				<div class="col-lg-12">
    <div class="row d-flex align-items-center mb-5">
					<div class="form-group col-lg-1 mr-4">
						<select class="form-control input-default h-75" name="searchType" style="width: 110px;">
							<option value="n"
								<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
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

					<div class="basic-form col-lg-5">
						<form class="d-flex">
							<div class="form-group mr-2 w-100">
								<input type="text" class="form-control input-default h-75" name="keyword" id="keywordInput" value="${scri.keyword}">
							</div>
                                                            <button class="btn btn-primary h-75 px-4" type="submit" id="searchBtn">검색</button>
                                                            </form>
					</div>
        
    
    
    
    </div>


					<div class="table-responsive mb-5">
						
						<table class="table table-hover" id="free" style="text-align: center;">
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
							<tbody>
								<c:forEach var="board" items="${listBoard }">
									<tr>
										<td><c:out value="${board.board_no }" /></td>
										<td><c:out value="${board.category }" /></td>
										<td><a href="/board/get?board_no=${board.board_no}">
											<c:out value="${board.board_title }" />&nbsp;<span class="text-danger">(${board.cnt_bc })</span> 
											</a>
										</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.board_date }" /></td>
										<td><c:out value="${board.board_hit }" /></td>
										<td><c:out value="${board.user_id }" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

                   </div>
                                                  

					<div class="bootstrap-pagination mb-5">
                                                            
                                                            <nav>
							<ul class="pagination justify-content-center">
								<c:if test="${pageMaker.prev}">
									<li class="page-item disabled">
										<a class="page-link" href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
									</li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
									<li class="page-item">
										<a class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item">
										<a class="page-link" href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
									</li>
								</c:if>

							</ul>
						</nav>



					</div>

				</div>
				<button class="btn mb-1 btn-primary" id="insertBtn" type="button" style="float: right">글쓰기</button>	
			</div>
					
		</div>
		
          </div>
	
</body>
<%@include file="../footer.jsp"%>
</html>
