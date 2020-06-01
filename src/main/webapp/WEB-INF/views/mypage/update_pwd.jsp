<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../header.jsp" %>
<meta charset="UTF-8">
<title>회원정보 수정</title>
   <style type="text/css">
      /* .help-block을 일단 보이지 않게 설정 */
      #updateForm .help-block{
         display: none;
      }
      /* glyphicon을 일단 보이지 않게 설정 */
      #updateForm . glyphicon{
         display: none;
      }
       
   </style>

</head>
<body data-theme-version="light" data-layout="vertical" data-nav-headerbg="color_1" data-headerbg="color_1" data-sidebar-style="full" data-sibebarbg="color_1" data-sidebar-position="static" data-header-position="static" data-container="wide" direction="ltr">


            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                         <li class="breadcrumb-item"><a href="javascript:void(0)">회원정보 수정</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">비밀번호 변경</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->
			
            <div class="container-fluid">
            <h4>회원정보 수정</h4>
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-validation">
                                    <form class="form-valide" action="/mypage/update_pwd" method="post" novalidate="novalidate" id="updateForm">
                                       <input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                                       <input type="hidden" name="o_user_id" value="${login_id }"><br>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="o_pwd">기존 비밀번호 <span class="text-danger">*</span>
                                            </label>    
                                            <div class="col-lg-6">
                                                <input type="password" class="form-control" name="o_pwd" id="o_pwd" required="required"/>
                                            </div>                     
                                         </div>  
                                         <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="pwd2">변경할 비밀번호 <span class="text-danger">*</span>
                                            </label>    
                                            <div class="col-lg-6">
                                                <input type="password" class="form-control" name="pwd2" id="pwd2" required="required"/>
                                            </div>                     
                                         </div> 
                                         
									 </form>
                                    <div class="form-group row">
                                        <div class="col-lg-8 ml-auto">
                                            <button class="btn btn-primary" id="up_btn">변경하기</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- #/ container -->
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="../resources/quixlab/plugins/common/common.min.js"></script>
    <script src="../resources/quixlab/js/custom.min.js"></script>
    <script src="../resources/quixlab/js/settings.js"></script>
    <script src="../resources/quixlab/js/gleek.js"></script>
    <script src="../resources/quixlab/js/styleSwitcher.js"></script>

    <script src="../resources/quixlab/plugins/validation/jquery.validate.min.js"></script>
    <script src="../resources/quixlab/plugins/validation/jquery.validate-init.js"></script>

</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">

$(function(){

	//비밀번호 변경 버튼
	$("#up_btn").click(function(){
		var data = $("#updateForm").serialize();
		$.ajax("/mypage/update_pwd",{data:data,success:function(re){
            if(re === "ok"){
                window.location.href="/mypage/mypage";
                alert("비밀번호가 변경됐습니다");
                }else{
                   alert("기존 비밀번호가 틀렸습니다");
                   window.location.reload(true);
                   }
			}});
	});
});




</script>
</html>