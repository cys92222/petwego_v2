<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
	$(function() {

		//사람 정보 수정
		$("#people_info_up_btn")
				.click(
						function() {
							window.location.href = "/mypage/people_info_up_form?user_id=${myinfo.user_id }";
						});

		//동물 정보 수정
		$("#animal_info_up_btn")
				.click(
						function() {
							window.location.href = "/mypage/animal_info_up_form?user_id=${myinfo.user_id }";
						});

		//더보기
		$("#more").click(function(){
			window.location.href = "/mypage/animal_info_up_form?user_id=${myinfo.user_id }";
			});


		//회원탈퇴
		$("#widthdraw_btn").click(function() {
			var ck = confirm("탈퇴하시겠습니까?");
			if (ck == true) {
				var data = {
					user_id : '${login_id }'
				};
				$.ajax("/mypage/delete_member", {
					data : data,
					success : function(re) {
						window.location.href = "/login/logout";
					}
				});
			} else {

			}
		});

		//영구정지 , 휴면계정
		$("#break_btn").click(function() {
			var ck = confirm("계정을 휴면처리 하시겠습니까?");
			if (ck == true) {
				var data = {
					user_id : '${login_id }'
				};
				$.ajax("/mypage/update_enabled", {
					data : data,
					success : function(re) {
						window.location.href = "/login/logout";
					}
				});
			} else {

			}
		});




		//등록 폼
		$("#form_btn").click(function(){
				$("#animal_insert").css({"display":"block"});
				location.href="#animal_insert";
//	 			$("#animail_list").css({"display":"none"});
			});


		
	});
</script>
</head>
<body>
<!-- breadcrumb start -->
<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/mypage/mypage">마이페이지 | 메인</a></li>
				<li class="breadcrumb-item active"><a href="/MainPage">메인</a></li>
			</ol>
		</div>
</div>
<!-- breadcrumb end -->
<!-- container start -->
<div class="container-fluid mt-1">
<!-- profile start -->
<div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body d-flex">
                                
    <div class="col-3 border-right pr-5 py-4 text-center">
                                    <img class="rounded-circle mt-4" src="/img/peopleImg/${myinfo.fname }" width="135" height="135">
                                    <h4 class="card-widget__title text-dark mt-3">마카롱</h4>
                                    <p class="text-muted font-weight-light">
	                                    <c:set var="role" value = "${myinfo.user_role}"/>
										<c:choose>
											<c:when test="${role eq 'ROLE_ADMIN'}">
		    									<c:out value="관리자" />
											</c:when>
											<c:when test="${role eq 'ROLE_USER'}">
		    									<c:out value="일반유저" />
											</c:when>
										</c:choose>
                                    </p>
                                    <a id="people_info_up_btn" class="btn gradient-4  btn-md border-0 btn-rounded px-5" href="javascript:void()">정보수정</a>
                                </div><div class="col-9 row pl-5 py-4 align-items-center">
    <div class="row col-12 mb-0 pb-4 border-bottom">
    <div class="col-4 d-flex align-items-baseline">
    <h6 class="text-muted mr-3 font-weight-light">성별</h6><h6 class="text-info">${myinfo.gender}</h6>
    </div>
    <div class="col-4 d-flex align-items-baseline">
    <h6 class="text-muted mr-3 font-weight-light">생년월일</h6><h6 class="font-weight-light text-info">${myinfo.birth}</h6>
    </div>    
    <div class="col-4 d-flex align-items-baseline">
    <h6 class="text-muted mr-3 font-weight-light">전화번호</h6><h6 class="font-weight-light text-info">${myinfo.tel}</h6>
    </div>    
    </div>
    <div class="row col-12 mb-0 pb-4 border-bottom">
    <div class="col-4 d-flex align-items-baseline">
    <h6 class="text-muted mr-3 font-weight-light">닉네임</h6><h6 class="text-info">${myinfo.nick_name}</h6>
    </div>
    <div class="col-4 d-flex align-items-baseline">
    <h6 class="text-muted mr-3 font-weight-light">이메일</h6><h6 class="font-weight-light text-info">${myinfo.email}</h6>
    </div>    
    <div class="col-4 d-flex align-items-baseline">
    <h6 class="text-muted mr-3 font-weight-light">가입일</h6><h6 class="font-weight-light text-info">${myinfo.info_create_date}</h6>
    </div>    
    </div>
        
    <div class="row col-12 mb-0 pb-4 border-bottom">
    <div class="col-4 d-flex align-items-baseline">
    <h6 class="text-muted mr-3 font-weight-light">우편번호</h6><h6 class="font-weight-light text-info">${myinfo.address}</h6>
    </div>
    <div class="col-8 d-flex align-items-baseline">
    <h6 class="text-muted font-weight-light mr-3">주소</h6><h6 class="text-info">${myinfo.address2}</h6>
    </div>    
        
    </div><div class="row col-12">
    <div class="col-4 d-flex flex-column">
    <h6 class="text-muted mb-4 font-weight-light">자기소개</h6><h6 class="text-info">${myinfo.intro}</h6>
    
    </div>
        
        
    </div>
</div>
                            </div>
                            
                        </div>
                    </div>

                    

                    
                </div>


<!-- profile end -->
<!-- tab start  -->
<div class="row">
         <div class="col-md-12">
                    <div class="card">
                              <div class="card-body">

                                        <!-- Nav tabs -->
                                        <ul class="nav nav-tabs mb-3" role="tablist">
                                                  

                                                  <li class="nav-item align-items-center"><a
                                                                      class="nav-link d-flex align-items-center active"
                                                                      data-toggle="tab"
                                                                      href="#message"><span>알림</span><span
                                                                                class="badge badge-warning badge-sm float-right ml-2 text-white align-self-center">${search_insert_board_alarm_count+search_insert_together_count+search_cancle_together_count}</span></a>
                                                  </li>
                                                  <li class="nav-item"><a class="nav-link" data-toggle="tab"
                                                                      href="#booking"><span>나의 예약내역</span></a>
                                                  </li>
                                                  <li class="nav-item"><a class="nav-link" data-toggle="tab"
                                                                      href="#pay"><span>나의 결제내역</span></a>
                                                  </li>
                                                  <!-- <li class="nav-item"><a class="nav-link" data-toggle="tab"
                                                                      href="#inq"><span>나의 문의내역</span></a>
                                                  </li> -->
                                                  <!-- <li class="nav-item"><a class="nav-link" data-toggle="tab"
                                                                      href="#pet"><span>댕냥이 정보관리</span></a>
                                                  </li> -->
                                                  <li class="nav-item"><a class="nav-link" data-toggle="tab"
                                                                      href="#myboard"><span>자유게시판 내가쓴글</span></a>
                                                  </li>
                                                  <li class="nav-item"><a class="nav-link" data-toggle="tab"
                                                                      href="#mytogether"><span>함께가요 내가쓴글</span></a>
                                                  </li>
                                                  <!-- <li class="nav-item"><a class="nav-link" data-toggle="tab"
                                                                      href="#mysns"><span>SNS 내가쓴글</span></a>
                                                  </li> -->
                                                  <sec:authorize access="hasRole('ROLE_USER')"> 
                                                  <li class="nav-item"><a class="nav-link" data-toggle="tab"
                                                                      href="#withdraw"><span>회원 탈퇴</span></a>
                                                  </li>
                                                  </sec:authorize>
                                        </ul>
                                        <!-- Tab panes -->
                                        <div class="tab-content tabcontent-border">
                                                  
                                                  <div class="tab-pane fade active show" id="message" role="tabpanel">
                                                            <div class="p-t-15">
                                                                      <!--msg start -->
                                                                      <c:if test="${search_insert_board_alarm_count>0 or search_insert_together_count>0 or search_cancle_together_count>0}">
                                                                                <div class="card-body">
                                                                                          <h4 class="card-title"><span class="label label-success">신규알림</span></h4>
                                                                                
                                                                                
                                                                                          <div id="accordion-three" class="accordion">
                                                                      
                                                                                          <c:if test="${search_insert_board_alarm_count>0 }">
                                                                                                    <div class="card">
                                                                                                              <div class="card-header">
                                                                                                                        <h5 class="mb-0" data-toggle="collapse" data-target="#boardaa"
                                                                                                                                  aria-expanded="true" aria-controls="boardaa">
                                                                                                                                  <i class="fa" aria-hidden="true"></i> 자유게시판 신규 댓글 수 : ${search_insert_board_alarm_count } 개 입니다<br>
                                                                                                                        </h5>
                                                                                                              </div>
                                                                                                              <div id="boardaa" class="collapse"
                                                                                                                        data-parent="#accordion-three">
                                                                                                                        <div class="card-body">
                                                                                                                                  <c:forEach items="${search_insert_board_alarm }" var="search_insert_board_alarm">
                                                                                                                                            ${search_insert_board_alarm.in_user_id } 님이 댓글을 등록했습니다 
                                                                                                                                            <a href="/board/get?board_no=${search_insert_board_alarm.t_num }">/ 게시물로 이동</a> <br>
                                                                                                                                  </c:forEach>
                                                                                                                                  <br>
                                                                                                                        </div>
                                                                                                              </div>
                                                                                                    </div>
                                                                                          </c:if>
                                                                      
                                                                                          <c:if test="${search_insert_together_count>0 }">
                                                                                                    <div class="card">
                                                                                                              <div class="card-header">
                                                                                                                        <h5 class="mb-0 collapsed" data-toggle="collapse"
                                                                                                                                  data-target="#together_in" aria-expanded="false"
                                                                                                                                  aria-controls="together_in">
                                                                                                                                  <i class="fa" aria-hidden="true"></i> 함께가요 신규 신청자 수 : ${search_insert_together_count } 명 입니다<br>
                                                                                                                        </h5>
                                                                                                              </div>
                                                                                                              <div id="together_in" class="collapse"
                                                                                                                        data-parent="#accordion-three">
                                                                                                                        <div class="card-body">
                                                                                                                        <c:forEach items="${search_insert_together_alarm }" var="search_insert_together_alarm">
                                                                                                                                  ${search_insert_together_alarm.in_user_id } 님
                                                                                                                                   <a href="/mypage/check_alarm_in?user_id=${search_insert_together_alarm.user_id }&in_user_id=${search_insert_together_alarm.in_user_id }">확인</a>
                                                                                                                                   <br>
                                                                                                                        </c:forEach>
                                                                                                                        <br>
                                                                                                                        </div>
                                                                                                              </div>
                                                                                                    </div>
                                                                                          </c:if>
                                                                      
                                                                                          <c:if test="${search_cancle_together_count>0 }">
                                                                                                    <div class="card">
                                                                                                              <div class="card-header">
                                                                                                                        <h5 class="mb-0 collapsed" data-toggle="collapse"
                                                                                                                                  data-target="#together_out" aria-expanded="false"
                                                                                                                                  aria-controls="together_out">
                                                                                                                                  <i class="fa" aria-hidden="true"></i> 함께가요 신규 취소자 수 : ${search_cancle_together_count } 명 입니다<br>
                                                                                                                        </h5>
                                                                                                              </div>
                                                                                                              <div id="together_out" class="collapse"
                                                                                                                        data-parent="#accordion-three">
                                                                                                                        <div class="card-body">
                                                                                                                        <c:forEach items="${search_cancle_together_alarm }" var="cancle_together_alarm">
                                                                                                                                  ${cancle_together_alarm.in_user_id } 님
                                                                                                                                   <a href="/mypage/check_alarm_cancle?user_id=${cancle_together_alarm.user_id }&in_user_id=${cancle_together_alarm.in_user_id }">확인</a>
                                                                                                                                   <br>
                                                                                                                        </c:forEach>
                                                                                                                        <br>
                                                                                                                        </div>
                                                                                                              </div>
                                                                                                    </div>
                                                                                          </c:if>
                                                                                                    
                                                                                          </div>
                                                                                </div>
                                                                                </c:if>		
                                                                      <!--msg end-->
                                                            </div>
                                                  </div>





                                                  <div class="tab-pane fade" id="booking" role="tabpanel">

                                                            <div class="table-responsive mt-4">
                                                                      <table class="table header-border">
                                                                                <thead>
                                                                                          <tr>
                                                                                                    <th>예약번호</th>
                                                                                                    <th>체크인</th>
                                                                                                    <th>체크아웃</th>
                                                                                                    <th>사람수</th>
                                                                                                    <th>동물수</th>
                                                                                                    <th>예약상태</th>
                                                                                                    <th>예약자이름</th>
                                                                                                    <th>전화번호</th>
                                                                                          </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                          <c:forEach items="${reservation }" var="rs" begin="0" end="4">
                                                                                          <tr>
                                                                                                    <td><a href="javascript:void(0)"># ${rs.rsv_no }</a>
                                                                                                    </td>
                                                                                                    <td><fmt:parseDate var="check_in" value="${rs.check_in }" pattern="yyyy-MM-dd"/> 
                                                                                                              <fmt:formatDate value="${check_in }" pattern="yyyy-MM-dd" /></td>
                                                                                                    <td><fmt:parseDate var="check_out" value="${rs.check_out }" pattern="yyyy-MM-dd"/> 
                                                                                                              <fmt:formatDate value="${check_out }" pattern="yyyy-MM-dd" />
                                                                                                    </td>
                                                                                                    <td>${rs.human_num }</td>
                                                                                                    <td>${rs.pet_num }
                                                                                                    </td>
                                                                                                    <td><span class="label gradient-2 rounded">${rs.rsv_paid }</span>
                                                                                                    </td>
                                                                                                    <td>${rs.guest_name }</td>
                                                                                                    <td>${rs.guest_tel }
                                                                                                    </td>
                                                                                          </tr>
                                                                                          </c:forEach>
                                                                                         



                                                                                </tbody>
                                                                      </table>
                                                            </div>


                                                  </div>
                                                  <div class="tab-pane fade" id="pay" role="tabpanel">

                                                            <div class="table-responsive mt-4">
                                                                      <table class="table header-border">
                                                                                <thead>
                                                                                          <tr>
                                                                                                    <th>고유결제번호</th>
                                                                                                    <th>결제상태</th>
                                                                                                    <th>결제수단</th>
                                                                                                    <th>결제금액</th>
                                                                                                    <th>결제승인일시</th>
                                                                                                    <th>예약번호</th>
                                                                                                    <th>상점거래ID</th>
                                                                                                    <th>카드승인번호</th>
                                                                                          </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                          <c:forEach items="${search_pay }" var="search_pay" begin="0" end="4">         
                                                                                          <tr>
                                                                                                    <td><a href="javascript:void(0)"># ${search_pay.imp_uid }</a>
                                                                                                    </td>
                                                                                                    <td><span class="label gradient-2 rounded">${search_pay.status }</span>
                                                                                                    </td>
                                                                                                    <td>${search_pay.pay_method }
                                                                                                    </td>
                                                                                                    <td>${search_pay.paid_amount }</td>
                                                                                                    <td><fmt:formatDate value="${search_pay.paid_time }" pattern="yyyy-MM-dd HH:mm:ss" />
                                                                                                    </td>
                                                                                                    <td>${search_pay.rsv_no }
                                                                                                    </td>
                                                                                                    <td>${search_pay.merchant_uid }</td>
                                                                                                    <td>${search_pay.apply_num }
                                                                                                    </td>
                                                                                          </tr>
                                                                                           </c:forEach>
                                                                                </tbody>
                                                                      </table>
                                                            </div>


                                                  </div>
                                
                                                  
                                                  <div class="tab-pane fade" id="myboard" role="tabpanel">
                                                            
                                                            <div class="table-responsive mt-4">
                                                                      <table class="table header-border">
                                                                                <thead>
                                                                                          <tr>
                                                                                                    <th>번호</th>
                                                                                                    <th>카테고리</th>
                                                                                                    <th>제목</th>
                                                                                                    <th>날짜</th>
                                                                                                    <th>조회수</th>

                                                                                          </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                <c:forEach var="b" items="${myboard }" begin="0" end="4">
                                                                                          <tr>
                                                                                                    <td><a href="javascript:void(0)"># ${board_no}</a>
                                                                                                    </td>
                                                                                                    <td><span class="label gradient-2 rounded">${b.category}</span>
                                                                                                    </td>
                                                                                                    <td><a href="/board/get?board_no=${b.board_no}">$(b.board_title }</a></td>
                                                                                                    <td><fmt:formatDate value="${b.board_date}" pattern="yyyy-MM-dd" /></td>
                                                                                                    <td>${b.board_hit}</td>
                                                                                          </tr>
                                                                                </c:forEach>
                                                                                </tbody>
                                                                      </table>
                                                            </div>


                                                  </div>
                                                  <div class="tab-pane fade" id="mytogether" role="tabpanel">

                                                            <div class="table-responsive mt-4">
                                                                      <table class="table header-border">
                                                                                <thead>
                                                                                          <tr>
                                                                                                    <th>번호</th>
                                                                                                    <th>제목</th>
                                                                                                    <th>날짜</th>
                                                                                                    <th>소개</th>
                                                                                                    <th>장소</th>

                                                                                          </tr>
                                                                                </thead>
                                                                                <tbody>									
                                                                                <c:forEach var="to" items="${mytogether }" begin="0" end="4">
                                                                                          <tr>
                                                                                                    <td><a href="javascript:void(0)"># ${to.t_num}</a>
                                                                                                    </td>
                                                                                                    <td><a href="/together/detailTogether?t_num=${to.t_num}">${to.t_title }</a></td>
                                                                                                    <td><fmt:formatDate value="${to.t_date}" pattern="yyyy-MM-dd" />
                                                                                                    </td>
                                                                                                    <td>${to.t_intro}</td>
                                                                                                    <td>${to.t_place}</td>

                                                                                          </tr>
                                                                                </c:forEach>
                                                                                </tbody>
                                                                      </table>
                                                            </div>


                                                  </div>
                                                  <%-- <div class="tab-pane fade" id="mysns" role="tabpanel">

                                                            <div class="table-responsive mt-4">
                                                                      <table class="table header-border">
                                                                                <thead>
                                                                                          <tr>
                                                                                                    <th>번호</th>
                                                                                                    <th>이미지</th>
                                                                                                    <th>날짜</th>
                                                                                                    <th>좋아요수</th>

                                                                                          </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                          
	
                                                                                          <c:forEach items="${mysnspic }" var="sns" begin="0" end="6">
                                                                                          <tr>
                                                                                                    <td><a href="javascript:void(0)"># ${sns.photo_no}</a>
                                                                                                    </td>
                                                                                                    <td><img width="50" height="30" src="../img/snsImg/${sns.photo_file_name}" /></td>
                                                                                                    <td><fmt:formatDate value="${sns.photo_date}" pattern="yyyy-MM-dd" /></td>
                                                                                                    <td>${sns.cntlike}</td>
                                                                                          </tr>
                                                                                          </c:forEach>
                                                                                </tbody>
                                                                      </table>
                                                            </div>


                                                  </div> --%>
                                                  <sec:authorize access="hasRole('ROLE_USER')"> 
                                                  <div class="tab-pane fade" id="withdraw" role="tabpanel">
                                                            <div class="read-content">
                                                                      <div class="media pt-3">

                                                                                <div class="media-body">
                                                                                          
                                                                                          <h5 class="mb-4 ml-3">탈퇴안내</h5>

                                                                                </div>

                                                                      </div>

                                                                      <div class="card px-3 pt-4 pb-3 mb-4">
                                                                                <div class="media-body">
                                                                                          <h6
                                                                                                    class="mb-1 text-danger font-weight-light">
                                                                                                    회원탈퇴 시 개인정보 및
                                                                                                    PETWEGO에서 만들어진 모든
                                                                                                    데이터는 삭제됩니다.</h6>

                                                                                          <h6
                                                                                                    class="mb-3 text-danger font-weight-light">
                                                                                                    (단, 아래 항목은 표기된 법률에
                                                                                                    따라 특정 기간 동안 보관됩니다.)
                                                                                          </h6>

                                                                                          <small
                                                                                                    class="d-block mb-1 text-muted font-weight-light">1.
                                                                                                    계약 또는 청약철회 등에 관한 기록
                                                                                                    보존 이유 : 전자상거래 등에서의
                                                                                                    소비자보호에 관한 법률 / 보존 기간
                                                                                                    : 5년</small>
                                                                                          <small
                                                                                                    class="d-block mb-1 text-muted font-weight-light">2.
                                                                                                    대금결제 및 재화 등의 공급에 관한
                                                                                                    기록 보존 이유 : 전자상거래
                                                                                                    등에서의 소비자 보호에 관한 법률 /
                                                                                                    보존기간 : 5년</small>
                                                                                          <small
                                                                                                    class="d-block mb-1 text-muted font-weight-light">3.
                                                                                                    전자금융 거래에 관한 기록 보존 이유
                                                                                                    : 전자금융거래법 보존 기간 /
                                                                                                    5년</small>
                                                                                          <small
                                                                                                    class="d-block mb-1 text-muted font-weight-light">4.
                                                                                                    소비자의 불만 또는 분쟁처리에 관한
                                                                                                    기록 보존 이유 : 전자상거래
                                                                                                    등에서의 소비자보호에 관한 법률
                                                                                                    보존기간 / 보존 기간 :
                                                                                                    3년</small>
                                                                                </div>
                                                                      </div>











                                                            </div>
                                                            <div class="read-content mb-5">
                                                                      <div class="media pt-3">

                                                                                <div class="media-body">
                                                                                          <h6 class="p-t-15 mb-3 ml-3">
                                                                                                    유의사항</h6>
                                                                                </div>

                                                                      </div>

                                                                      <div class="card px-3 py-3 mb-4">
                                                                                <div class="media-body">




                                                                                          <small
                                                                                                    class="d-block mb-1 text-muted font-weight-light">회원탈퇴
                                                                                                    처리 후에는 회원님의 개인정보를
                                                                                                    복원할 수 없으며, 회원탈퇴 진행 시
                                                                                                    해당 아이디는 영구적으로 삭제되어
                                                                                                    재가입이 불가합니다.</small>



                                                                                </div>
                                                                      </div>











                                                            </div>
                                                            <div class="d-flex justify-content-end align-items-baseline">
                                                                      <div>
                                                                                <input class="mr-2" type="checkbox"
                                                                                          name="finalConfirm">
                                                                                <label for="finalConfirm"> 해당 내용을 모두
                                                                                          확인하였으며, 회원탈퇴에 동의합니다.</label>
                                                                      </div>
                                                                      <div>
                                                                                <button type="button" class="btn mb-1 ml-3 btn-danger" id="widthdraw_btn">회원탈퇴</button>
                                                                      </div>
                                                            </div>
                                                  </div>
                                                  </sec:authorize>
                                        </div>
                              </div>
                    </div>
          </div>
          </div>
<!-- tab end -->
<div class="row">
<div class="col-lg-12">


					<div class="card">
						<div class="card-body">
							<h2 class="font-weight-light mb-4 ml-3">반려동물 정보</h2>

							<!-- 동물 정보 -->
							<div class="col-lg-4 media media-reply align-items-center justify-content-center" style="margin-bottom: 0px;">
								<c:forEach items="${animal_list }" var="a" begin="0" end="3">
									
									<div class="media-body align-items-center text-center d-flex flex-column justify-content-center mb-4" style="height: 350px" >
										<img class="mr-3 circle-rounded d-flex flex-column justify-content-center"src="/img/animalImg/${a.pet_pic }" width="100" height="100" alt="반려동물 사진"><br>
										<small class="text-muted ml-3"> (${a.pet_date })</small>
										<div class="d-sm-flex d-flex flex-column justify-content-center">
											<h5 class="mb-sm-0">
												${a.pet_name } 
											</h5>
										</div>
<!-- 									<p>}</p>  -->
										<textarea class="alert alert-secondary" cols="25" rows="10" readonly="readonly">${a.pet_intro}</textarea>	
										</div>
								</c:forEach>
							</div>
							<!-- 동물 정보 끝						 -->
							
							<button id="animal_info_up_btn" class="ml-3 btn gradient-4 btn-md border-0 btn-rounded">정보관리</button>
						</div>
					</div>





				</div>
			</div>

</div>
</div>
<!-- animal end -->

<!-- container end -->





</body>
</html>
<%@ include file="../footer.jsp"%>