<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../header.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.25.0/moment.min.js"></script>
<script type="text/javascript">
   $(function(){
 
      // 민아) 5/17, 좋아요기능 추가, user_id 는 임의로 멤버인포에 추가한 user1으로 해둠 
      var photo_no = $("#photo_no").val();
      var user_id = "${login_id}";
      $("#clickLike").hide();
      
      //이 사진에 좋아요를 눌렀는지 체크 
      var okLike = function(user_id, photo_no){
         $.ajax("/pic_board/okLike",{data: {user_id:user_id, photo_no:photo_no}, success:function(re){
            if( re == 1 ){            //좋아요를 눌렀다면
               $("#clickLike").show();   //좋아요 눌러서 바뀐 사진을 보여주고
               $("#like").hide();      //안눌린상태의 좋아요사진은 숨겨줘 
            }
         }})
      }
      okLike(user_id, photo_no);
      // 좋아요 insert
      $(document).on("click","#like",function(){   // 좋아요를 클릭했을때
         $.ajax("/pic_board/insertLike",{data: {user_id:user_id, photo_no:photo_no}, success:function(re){
            if(re == 1){
               $("#clickLike").show();      //좋아요 눌러서 바뀐 사진을 보여주고
               $("#like").hide();         //안눌린상태의 좋아요사진은 숨겨줘 
               $("#cntLike").html(eval($("#cntLike").html())+1);   // 좋아요 수가 보이는 창의 데이터에 + 1 해줘
            }
         }})
         window.location.reload(true);
      })
      
      // 좋아요 delete 좋아요를 한번 더 누르면 취소 
      $(document).on("click","#clickLike",function(){
         $.ajax("/pic_board/deleteLike",{data: {user_id:user_id, photo_no:photo_no},success: function(re){
            if( re == 1 ){
               $("#clickLike").hide();      //좋아요 눌러서 바뀐 사진을 숨기고
               $("#like").show();         //안눌린상태의 좋아요사진을 보여줘
               $("#cntLike").html(eval($("#cntLike").html())-1);   // 좋아요 수가 보이는 창의 데이터에 - 1 해줘
            }
         }})
         window.location.reload(true);
      })
      
      
      // 여기까지 좋아요 처리 완료 
      //수정
      $("#btnUpdate").click(function(){
            self.location ="/pic_board/update?photo_no=${file.photo_no}";   
            });
         
         //삭제   
      $("#btnDelete").click(function(){
         var check = confirm("게시글을 삭제하시겠습니까?")
         if(check == true){
            self.location = "/pic_board/delete?photo_no=${file.photo_no}";
//             alert("게시글이 삭제되었습니다.")
            }
         });
         
         // 댓글작성버튼을 누르면!
         $("#pcomment").click(function(){
            var commCheck = confirm("한번 등록하면 수정할 수 없습니다. 이대로 등록하시겠습니까?");
            if(commCheck == true){
               var pcommSubmit = $("form[name='pcommentForm']");            
               pcommSubmit.attr("action","/pcomment/pinsertComment");
               pcommSubmit.submit();
            }
         });   
               
         //댓글 목록
         $.ajax("/pcomment/plistComment",{type:"GET",data:{photo_no:'${file.photo_no}'},success:function(comm){
            comm = JSON.parse(comm);
            $.each(comm, function(idx,c){                  
               var tr = $("<tr></tr>");
               var td1 = $("<td></td>").html(c.photo_comm_cont);
               var td2 = $("<td></td>").html( moment(c.photo_comm_date).format('YYYY년 MM월 DD일')   );
               var td3 = $("<td></td>").html(c.user_id);
               if(c.user_id === "${login_id}"){
                  var delBtn = $("<button class='btn btn-sm btn-danger'></button>").text("댓글삭제").attr("photo_comm_no",c.photo_comm_no);
               }
               var td4 = $("<td></td>");
               td4.append(delBtn);
               tr.append(td1, td2, td3, td4);
               $("#pcomm_list").append(tr);
         
          //댓글 삭제
               $(delBtn).click(function(){
                      alert("버튼 누름");
                     var delCheck = confirm("댓글을 삭제하시겠습니까?");
                     if(delCheck == true){
                        self.location = "/pcomment/pcommDeleteSubmit?photo_comm_no="+c.photo_comm_no;
                        alert("댓글을 삭제했습니다!");
                        location.reload();
                     }
               })
            })
         }});
      //팔로우하기
      $("#follow").click(function(){
         var follow_user_id = $("#follow_user_id").val();
         var follow_in_user_id = $("#follow_in_user_id").val();
         $.ajax("/follow/insert_follow",{data:{user_id2:follow_user_id,in_user_id:'${login_id}'},success:function(re){
            alert(re);
            window.location.reload(true);
            }});
         });
      
      //팔로우취소하기
      $("#delete_follow").click(function(){
         var follow_user_id = $("#follow_user_id").val();
         var user_id2 = "${login_id}";
         $.ajax("/follow/delete_follow",{data:{user_id:follow_user_id,user_id2:user_id2},success:function(re){
            alert(re);
            window.location.reload(true);
            }});
         });
      
      });
</script>
</head>
<body>
   <sec:authorize access="isAuthenticated()">
   <div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">sns | 상세보기</a></li>
				<li class="breadcrumb-item"><a href="/pic_board/list">sns 목록</a></li>
				<li class="breadcrumb-item active"><a href="/MainPage">메인</a></li>
			</ol>
		</div>
	</div>
	<!-- row -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6">
				<div class="card">
				   <div class="card-body">
					 <h4 class="card-title">사진 상세보기</h4>
						<a href="/pic_board/list"><button style="float: left;" class="btn mb-1 btn-primary">목록</button></a>
						 <br><div class="basic-form">
							<form id="f">
								<input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<input type="hidden" id="photo_no" value="${Board.photo_no }">
								<div class="table-responsive">
									<table class="table header-border">
										
											
							<tr>
								
								<td><b>${Board.user_id}</b> &nbsp;|&nbsp; 팔로워수 : ${search_follow_count } 명</td>
								<input type="hidden" value="${Board.user_id}" id="follow_user_id" readonly="readonly"/>
								<td>
								<c:if test="${follow_chk ==0 }">
						          <input type="button" class="btn btn-outline-dark btn-sm" value="팔로우하기" id="follow"><br>
						        </c:if>
						        <c:if test="${follow_chk !=0 }">
						          
						         	팔로워:
						         <c:forEach items="${search_follow }" var="search_follow" begin="0" end="5">
						            ${search_follow.user_id2 }님 
						         </c:forEach>
										        
					<div class="bootstrap-modal">
                    
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#basicModal">더보기</button>
                    
                    <!-- Modal -->
                    <div class="modal fade" id="basicModal" style="display: none;" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                         <div class="modal-content p-4 pb-5">
                            <div class="modal-header">
                               <h5 class="modal-title font-weight-light">${followList[0].user_id }님의 팔로워</h5>
                                  <button type="button" class="close" data-dismiss="modal"><span>×</span></button>
                                    </div>
                                      <c:forEach items="${followList }" var="followList">
                                        <div class="modal-body border-bottom">
										   <div class="row align-items-center justify-content-between d-flex">
                                              <div class="align-items-center d-flex">
                                                 <i class="fa fa-user-circle text-primary fa-3x ml-3 mr-2"></i>
													
													<sec:authentication property="principal.fname" var="fname" />
                                                   <div class="d-flex flex-column">
                                                     <span class="text-dark">${followList.user_id2 }</span>
                                                       <span class="text-muted small">dobby is free</span>
                                                         </div>
                                                           </div>
                                                            <button type="button" class="btn-sm mb-1 btn-danger small mr-2" id="delete_follow">
                                                            <i class="fa fa-times mr-1"></i>언팔로우</button>
                                                            </div>
		                                                   </div>
														  </c:forEach>
					                                     </div>
					                              		</div>
					                    			  </div>
					          						</div>
											      </c:if>
										      </td>
										      <td></td>
											</tr>
											<tr>
												<td class="text-center"><img width="200" height="200" src="/img/${file.photo_file_name}"/></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												

												<td>
											            <img id="like" src="/img/like.png" width="30" height="30">
											            <img id="clickLike" src="/img/clickLike.png" width="30" height="30">
											             <c:out value="<p id='cntLike'>좋아요&nbsp;${Board.cntLike }개</p>" escapeXml="false"/> 
											     </td>
												 <td></td>
												 <td></td>
											</tr>
											<tr>
												<td><div>${Board.photo_detail }</div></td>
												<td></td>
												<td></td>
											</tr>
										
										
									</table>
								</div>
							</form>
							 <hr>
							<c:if test="${Board.user_id eq login_id}" >
						   		<button type="button" id="btnDelete" style="float: left" class="btn mb-1 btn-danger">글 삭제</button>
								<button type="button" id="btnUpdate" style="float: right;" class="btn mb-1 btn-primary">글 수정</button>
						  		
						   </c:if>
						</div>
					</div>
				</div>
			</div>
  			 <br>
			<div class="col-lg-6">
			<div class="card">
				<div class="card-body">
					<div class="basic-form">
						<!-- 댓글입력 -->
						<form name="pcommentForm" method="post">
							<input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
							<input type="hidden" id="photo_no" name="photo_no" value="${Board.photo_no}">
<!-- 							<div class="col-lg-3"> -->
							댓글 작성자 : 
							<input type="text" name="user_id" readonly="readonly" value="${login_id }" class="form-control input-default"><br>
<!-- 							</div> -->
							댓글 내용 : <br>
							<textarea name="photo_comm_cont" class="form-control h-150px" rows="6"></textarea>
							<br>
							
						</form>
						<button type="submit" id="pcomment" class="btn mb-1 btn-primary">댓글 등록</button>
					</div>
				</div>
			</div>
			<!-- 댓글 목록-->
			<div class="card">
				<div class="card-body">
				댓글 목록<br>
				<div class="table-responsive">
					<table id="pcomm_list" class="table table-striped">
					</table>
				</div>
				</div>
			</div>
		</div>
		</div>
	</div>
   
   
   </sec:authorize>
</body>
<%@include file="../footer.jsp"%> 
</html>