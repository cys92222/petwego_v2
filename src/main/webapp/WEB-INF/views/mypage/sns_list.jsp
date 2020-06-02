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
   <div class="container-fluid">
   <h4>SNS 작성글</h4>
      <div class="row">
         <div class="col-lg-6">
            <c:forEach var="sns" items="${mysns }" varStatus="status">
               <a href="/pic_board/detail?photo_no=${sns.photo_no }&user_id=${sns.user_id }&in_user_id=${login_id }">
                  <div class="card">
                     <div class="card-body">
                     <h4 class="card-title">${sns.photo_no }</h4>
                        <div class="bootstrap-carousel">
                           <div class="carousel slide" data-ride="carousel">
                              <div class="carousel-inner">
                                 <div class="carousel-item active">
                                    <img class="d-block w-100" width="200" height="200"
                                       src="/img/${mysnspic[status.index].photo_file_name}" />
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </a>
            </c:forEach>
         </div>

      </div>
   </div>   
      <%@ include file="../footer.jsp"%>
</body>
</html>