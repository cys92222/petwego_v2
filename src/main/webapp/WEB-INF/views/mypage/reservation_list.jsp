<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
// 부트스트랩 정렬기준
$(function(){
	$('#list').DataTable( {
        "order": [[ 0, "desc" ]]
    } );

	
})


 </script>
 <div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/mypage/mypage">마이페이지 | 예약 내역</a></li>
				<li class="breadcrumb-item active"><a href="/MainPage">메인</a></li>
			</ol>
		</div>
	</div>
 <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">예약 내역</h4>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered zero-configuration" id="list">
                                        <thead>
                                            <tr>
                                                <th>예약번호</th>
                                                <th>아이디</th>
                                                <th>가격</th>
                                                <th>예약일</th>
                                                <th>체크인</th>
                                                <th>체크아웃</th>
                                                <th>사람수</th>
                                                <th>동물수</th>
                                                <th>방번호</th>
                                                <th>결제상태</th>
                                                <th>이름</th>
                                                <th>전화번호</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${reservation_list }" var="rl">
                                            <tr>
                                                <td>${rl.rsv_no }</td>
                                                <td>${rl.user_id }</td>
                                                <td>${rl.rsv_price }</td>
                                                <td>${rl.rsv_date }</td>
                                                <td> <fmt:parseDate var="check_in" value="${rl.check_in }" pattern="yyyy-MM-dd"/> 
											<fmt:formatDate value="${check_in }" pattern="yyyy-MM-dd" />
										</td>
                            				   <td> <fmt:parseDate var="check_out" value="${rl.check_out }" pattern="yyyy-MM-dd"/> 
											<fmt:formatDate value="${check_out }" pattern="yyyy-MM-dd" />
										</td>   
                                                <td>${rl.human_num }</td>
                                                <td>${rl.pet_num }</td>
                                                <td>${rl.rm_no }</td>
                                                <td>${rl.rsv_paid }</td>
                                                <td>${rl.guest_name }</td>
                                                <td>${rl.guest_tel }</td>
                                            </tr>
                                        </c:forEach> 
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>예약번호</th>
                                                <th>아이디</th>
                                                <th>가격</th>
                                                <th>예약일</th>
                                                <th>체크인</th>
                                                <th>체크아웃</th>
                                                <th>사람수</th>
                                                <th>동물수</th>
                                                <th>방번호</th>
                                                <th>결제상태</th>
                                                <th>이름</th>
                                                <th>전화번호</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

<%@ include file="../footer.jsp" %>
</body>
</html>