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
<script type="text/javascript">
// 부트스트랩 정렬기준
$(function(){
	$('#list').DataTable( {
        "order": [[ 0, "desc" ]]
    } );

	
})


 </script>
 <body>         
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">결제 내역</h4>
                                <div class="alert alert-danger">카카오페이등의 간편결제를 이용할경우 승인번호는 보여지지 않습니다.</div>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered zero-configuration" id="list">
                                        <thead>
                                            <tr>
                                                <th>결제번호</th>
                                                <th>상점거래ID</th>
                                                <th>결제금액</th>
                                                <th>결제수단</th>
                                                <th>승인번호</th>
                                                <th>승인시간</th>
                                                <th>결제상태</th>
                                                <th>예약번호</th>
                                                <th>아이디</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                         <c:forEach items="${search_pay }" var="search_pay">
                                            <tr>
                                             <td>${search_pay.imp_uid }</td>
									<td>${search_pay.merchant_uid }</td>
									<td>${search_pay.paid_amount }</td>
									<td>${search_pay.pay_method }</td>
									<td>${search_pay.apply_num }</td>
									<td><fmt:formatDate value="${search_pay.paid_time }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td>${search_pay.status }</td>
									<td>${search_pay.rsv_no }</td>
									<td>${search_pay.user_id }</td>
                                            </tr>
                                        </c:forEach> 
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                               <th>결제번호</th>
                                                <th>상점거래ID</th>
                                                <th>결제금액</th>
                                                <th>결제수단</th>
                                                <th>승인번호</th>
                                                <th>승인시간</th>
                                                <th>결제상태</th>
                                                <th>예약번호</th>
                                                <th>아이디</th>
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