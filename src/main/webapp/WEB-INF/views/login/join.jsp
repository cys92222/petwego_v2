<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../header.jsp" %>
<meta charset="UTF-8">
<title>회원가입</title>
   <style type="text/css">
      /* .help-block을 일단 보이지 않게 설정 */
      #myForm .help-block{
         display: none;
      }
      /* glyphicon을 일단 보이지 않게 설정 */
      #myForm . glyphicon{
         display: none;
      }
   </style>
 
</head>
<body data-theme-version="light" data-layout="vertical" data-nav-headerbg="color_1" data-headerbg="color_1" data-sidebar-style="full" data-sibebarbg="color_1" data-sidebar-position="static" data-header-position="static" data-container="wide" direction="ltr">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">회원가입</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
              <h4>회원가입</h4>
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-validation"> <!-- form의 action 주소만 복사했음 join.jsp가 고치고 있는 중 / join2 가 원본 / join boot 가 boot 양식만 있는 거 -->
                                    <form class="form-valide" action="/join/insert" method="post" novalidate="novalidate" id="myForm">
                                       <input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="user_id">아이디 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" name="user_id" id="user_id" placeholder="ID" required="required"/>
                                                <button type="button" id="idCheck">아이디 중복 확인</button>
                                                 <span id="overlapErr" class="help-block">사용할 수 없는 아이디 입니다.</span>
                                                 <span class="glyphicon glyphicon-ok form-control-feedback"></span>
                                            </div>                     
                                        </div>  
                                         <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="name">이름 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" name="name" id="name" placeholder="NAME" required="required"/>
                                            </div>                     
                                        </div>  
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="email">이메일 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="email" class="form-control" id="email" name="email" placeholder="user@petwego.com">
                                               <span id="emailErr" class="help-block">올바른 이메일 형식이 아닙니다. 다시 입력해 주세요.</span>
                                       <span class="form-control-feedback"></span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="password">비밀번호 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="password" class="form-control" id="pwd" name="pwd" placeholder="PASSWORD">
                                                 <span id="pwdRegErr" class="help-block">숫자와 글자 조합으로 6글자 이상 10글자 이하를 입력하세요</span>
                                        <span class="glyphicon glyphicon-ok form-control-feedback"></span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="rePwd">비밀번호 확인 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="password" class="form-control" id="rePwd" name="rePwd" placeholder="PASSWORD">
                                                 <span id="rePwdErr" class="help-block">비밀번호와 일치하지 않습니다. 다시 입력해 주세요.</span>
                                        <span class="glyphicon glyphicon-ok form-control-feedback"></span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="intro">소개글
                                            </label>
                                            <div class="col-lg-6">
                                                <textarea class="form-control" id="intro" name="intro" rows="5" placeholder="간단한 자기소개"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label">성별 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-8">
                                                <label class="css-control css-control-primary css-checkbox" for="gender">
                                                    <input type="radio" class="css-control-input" id="gender" name="gender" value="여자"> <span class="css-control-indicator"></span> 여자
                                                    <input type="radio" class="css-control-input" id="gender" name="gender" value="남자"> <span class="css-control-indicator"></span> 남자</label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="birth">생년월일 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="birth" name="birth" placeholder="2020-06-12">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="address">주소 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" style="width: 40%; display: inline;" id="address" name="address" placeholder="우편번호" readonly="readonly"/>
                                                <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="address"><span class="text-danger"></span>
                                            </label>
                                           <div class="col-lg-6">
                                                   <input type="text" class="form-control" style="top: 5px; display: inline;" placeholder="도로명 주소" name="address2" id="address2" readonly="readonly"/>
                                               </div>
                                        </div>
                                        <div class="form-group row">
                                         <label class="col-lg-4 col-form-label" for="address"><span class="text-danger"></span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" style="display: inline;" placeholder="상세주소" name="address3" id="address3" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="tel">전화번호 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="tel" name="tel" placeholder="01012345678">
                                                 <span id="emailErr" class="help-block">올바른 전화번호 형식이 아닙니다. 다시 입력해 주세요.</span>
                                        <span class="form-control-feedback"></span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="nick_name">닉네임 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="nick_name" name="nick_name" placeholder="NICKNAME">
                                                <button type="button" id="nickCheck">닉네임 중복 확인</button> 
                                       <span id="overlapNick" class="help-block">이미 존재하는 닉네임입니다.</span>
                                       <span class="glyphicon glyphicon-ok form-control-feedback"></span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="fname">프로필 사진 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="file" class="form-control" id="fname" name="fname" required="required"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label"><a href="#">약관동의</a>  <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-8">
                                                <label class="css-control css-control-primary css-checkbox" for="agree">
                                                    <input type="checkbox" class="css-control-input" id="agree" name="agree" value="1"> <span class="css-control-indicator"></span> 약관에 동의합니다</label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-lg-8 ml-auto">
                                                <button type="submit" class="btn btn-primary">가입</button>
                                                <button class="btn btn-danger" id="cancle">다시쓰기</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #/ container -->
        </div>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- <script src="/resources/js/addressapi.js"></script> -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){

   //비밀번호 변경창
   $("#update_pwd").click(function(){
      $("#u_p_form").css({"display":"block"});
      $("#o_from").css({"display":"none"});

      //비밀번호 변경 버튼
      $("#up_btn").click(function(){
         $("#u_p_form").css({"display":"none"});
         var data = $("#update_pwd_form").serialize();
         $.ajax("/mypage/update_pwd",{data:data,success:function(re){
               if(re === "ok"){
                   alert("비밀번호가 변경됐습니다");
                   $("#u_p_form").css({"display":"none"});
                   $("#o_from").css({"display":"block"});
                   }else{
                      alert("기본비밀번호가 틀렸습니다");
                      window.location.reload(true);
                      }
            }});
         });
      });
});



$(document).ready(function(){
      $("#submit").on("click", function(){
         $.ajax({
            url: "/join/passCheck",
            type: "POST",
            dataType: "json",
            data: $("#updateForm").serializeArray(),
            success: function(data) {
               if(data==true){
                  if(confirm("회원 수정하시겠습니까?")){
                     $("#updateForm").submit();
                     }
                  }else{
                     alert("비밀번호가 틀렸습니다.");
                     return false;

                     }
               }   
         })
      })
})



</script>
</html>