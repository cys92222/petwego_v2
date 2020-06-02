<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>SNS게시판</title>
<style type="text/css">
#snsImg{height:300px !important;}
/* #pageMaker li{list-style:none; float:left; padding: 6px; position: fixed; bottom: 0; width: 100%;}  */

/* #insertbutton{
	color: #6fd96f;
    background-color: transparent;
    background-image: none;
    border-color: #02B5C2;
} */

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$(function() {
   temp(); 
})
   var in_user_id = "${login_id}";

var temp = function(){
   var arr_file = ${file};
   var arr_board = ${board};
/*    $.each(arr_file,function(idx,data){
     var id = $("<div></div>").append(arr_board[idx].user_id + "님의 사진");
      var a = $("<a href=/pic_board/detail?photo_no="+data.photo_no+"&user_id="+arr_board[idx].user_id+"&in_user_id="+in_user_id+"></a>");
      var img = $("<img/>").attr({"src":"/img/"+data.photo_file_name,"photo_no":data.photo_no});
      a.append(img); */
//           a.css({"float":"left","margin":"10px"});
//       $("#sns").append(a,id);
   });
}
</script>

</head>

<body> 
<%@include file="../header.jsp"%>
<!-- <a href="/MainPage">메인화면</a> -->



<!-- 사진 -->
        
        <!-- container-fluid start -->
       <div class="container-fluid">
       
       <div class="row">
                    <div class="col-12 m-b-30">
                        
                        <div class="d-flex justify-content-between">
                        	<h4 class="d-inline mb-4">마이펫</h4>
                        	<a class="btn btn-primary align-self-center" id="insertbutton" href="/pic_board/insertForm">게시글 등록</a>  
                        </div>
                        
                        <div class="row mt-5">
                        	<c:forEach var="sns" items="${board}" varStatus="status">
                            <div class="col-md-4 col-lg-4">
                                <div class="card p-3">
                                    <img id="snsImg" class="img-fluid" src="../img/${file[status.index].photo_file_name}"><!-- img-fluid   /card-img -->
                                    <div class="card-body">
                                        <h5 class="card-title text-center">${sns.user_id}</h5>
                                        
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            
                           
                        </div>
                    </div>
                </div>
                 <!-- PAGINATION  -->
						       <div class="bootstrap-pagination">
						           <nav>
						               <ul id="pageMaker" class="pagination justify-content-center">
						               <c:if test="${pageMaker.prev}">
						                   <li class="page-item disabled">
						                   		<a class="page-link" href="#" tabindex="-1">Previous</a>
						                   </li>
						                </c:if>
						                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						                   <li class="page-item"><a class="page-link" href="list${pageMaker.makeQuery(idx)}">${idx}</a>
						                   </li>
						                </c:forEach>
						                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						                   <li class="page-item">
						                   		<a class="page-link" href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
						                   </li>
						                </c:if> 
						               </ul>
						           </nav>
						        </div>                            
                            
                            <!-- PAGINATION END -->
                </div>
       
       
       

       

        <!-- container-fluid end -->
        
        
        
        

        
        <!-- paging start -->
 <%--        <ul id="pageMaker" style="text-cneter">
          <c:if test="${pageMaker.prev}">
             <li><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
          </c:if> 
          <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
             <li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
          </c:forEach>
          <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
             <li><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
          </c:if> 
        </ul>
   </div>
      </div>   --%> 
        

        <!-- 사진끝 -->



   

<%@include file="../footer.jsp"%> 
</body>
</html>
    