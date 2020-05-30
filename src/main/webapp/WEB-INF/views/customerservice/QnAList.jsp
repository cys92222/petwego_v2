<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp"%>
<%@ include file="../head.jsp" %>
<!-- //영수) 5월12일 QnAjsp  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#AddQnA,#DetailQnA,#UpdateQnA,#AddRe{
	display: none;
	
} 

li {
	list-style: none; float: left; padding: 6px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<!-- 썸머노트 설정 -->
<script src="../summernote/js/summernote-lite.js"></script>
<script src="../summernote/js/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../summernote/css/summernote-lite.css">

<script type="text/javascript">
$(function(){

	
	//썸머노트
	$('#summernote').summernote({
		height: 300,                 // 에디터 높이
		minHeight: null,             // 최소 높이
		maxHeight: null,             // 최대 높이
		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
		callbacks: {	//여기 부분이 이미지를 첨부하는 부분
			onImageUpload : function(files) {
				uploadSummernoteImageFile(files[0],this);
			}
		}
	});


	/**
	* 이미지 파일 업로드 , qna 등록할때
	*/
	function uploadSummernoteImageFile(file, editor) {
	data = new FormData();
	data.append("inq_file", file);
	console.log(file); //파일 정보
	$.ajax({
		data : data,
		type : "POST",
		url : "/uploadSummernoteImageFile",
		beforeSend: function(xhr){
			xhr.setRequestHeader(header, token);
		},
		contentType : false,
		processData : false,
		success : function(data) {
	    	//항상 업로드된 파일의 url이 있어야 한다.
			$(editor).summernote('insertImage', data.url);
			console.log(data.url);
// 			alert(data.url);
// 			alert(data);
			var data_url = data.url;
			var n = data_url.split('/');
			$("#inq_file").val(n[2]);
			}
		});
	}


	/**
	* 이미지 파일 업로드 , qna 수정할때
	*/
	function uploadSummernoteImageFile2(file, editor) {
	data = new FormData();
	data.append("up_inq_file", file);
	console.log(file); //파일 정보
	$.ajax({
		data : data,
		type : "POST",
		url : "/uploadSummernoteImageFile2",
		beforeSend: function(xhr){
			xhr.setRequestHeader(header, token);
		},
		contentType : false,
		processData : false,
		success : function(data) {
	    	//항상 업로드된 파일의 url이 있어야 한다.
			$(editor).summernote('insertImage', data.url);
// 			alert(data.url);
			alert(data);
			var data_url = data.url;
			var n = data_url.split('/');
			$("#up_inq_file").val(n[2]);
			}
		});
	}
	
	var arr = ${list };
// 	console.log(arr);
	
	All();

	//리스트
	function All(){
		$.each(arr,function(idx,qna){
				var inq_no = $("<td></td>").append(qna.inq_no);
				
				var category = qna.cs_no;

				
				var cs_no = $("<td></td>");
				if(category == 1){
					cs_no.append("홈페이지 이용 관련");
					}
				else if(category == 2){
					cs_no.append("계정 관련");
					}
				else if(category ==3 ){
					cs_no.append("결제 관련 문의");
					}
				var user_id = $("<td></td>").append(qna.user_id);

				var a = qna.inq_title;
				
// 				var reimg = $("<img src='../adminImg/re.jpg'>");
//  			var reimg = $("<img src='../adminImg/re2.png'>");
	  			var reimg = $("<img src='../adminImg/re4.png'>");
				if(qna.ref_level > 0){
					var inq_title = $("<td></td>");
					//들여쓰기
					for(var g = 0; g<=qna.ref_level; g++){
							inq_title.append("&nbsp;","&nbsp;");
						}
					inq_title.append(reimg,a);
					var user_id = $("<td></td>").append("관리자");
					}else {
						var inq_title = $("<td></td>").append(a);
						var user_id = $("<td></td>").append(qna.user_id);
						}
				
				
				var inq_date = $("<td></td>").append(moment(qna.inq_date).format('YYYY년 MM월 DD일 HH시 mm분'));
// 				var inq_date = $("<td></td>").append(qna.inq_date);
				
 				var tr = $("<tr></tr>").append(inq_no,cs_no,user_id,inq_title,inq_date);
// 				var tr = $("<tr></tr>").append(cs_no,user_id,inq_title,inq_date); //글번호 지움
				
				$("#list").append(tr);

				//상세보기
				$(tr).on("click",function(){
					$("#ListQnA").css("display","none");
					$("#DetailQnA").css("display","block");
					var d_no = {inq_no:qna.inq_no};
					$.ajax("/customerservice/detailQnA",{data:d_no,success:function(detail){
						$("#detail_inq_no").val(detail.inq_no);

						if(detail.cs_no == 1){
							$("#detail_cs_no").val("홈페이지 이용관련");
							}else if (detaiil.cs_no == 2){
								$("#detail_cs_no").val("계정 관련");
								}else if (detail.cs_no == 3){
									$("#detail_cs_no").val("결제 관련 문의");
									}

						
						if(qna.ref_level > 0){
							$("#detail_user_id").val("관리자");
							}else {
								$("#detail_user_id").val(detail.user_id);
								}
						
						$("#detail_inq_title").val(detail.inq_title);
						
						
						
						//로그인한 id가 작성자라면
						if('${login_id}' === detail.user_id){
							var up_btn = $("<button id='up'>수정하기</button><br>");
							var del_btn = $("<button id='del'>삭제하기</button><br>");
							$("#rebutton").append(up_btn,del_btn);
							}
						
	/*	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	
						var dit = detail.inq_title;			
						//답변 이면 답변 버튼 지움
						if(dit === "답변 입니다"){
							$("#re").css({"display":"none"});
						}
	*/  // 	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa									
						$('#detail_inq_content').append(detail.inq_content).css({"border":"1px solid"});
						$("#detail_inq_date").val(moment(detail.inq_date).format('YYYY년 MM월 DD일 HH시 mm분'));
// 						$("#detail_inq_date").val(detail.inq_date);
						
						
						//수정하기 폼 셋팅
						$("#up").on("click",function(){
							$("#DetailQnA").css("display","none");
							$("#UpdateQnA").css("display","block");
							$("#up_inq_no").val(detail.inq_no);
							$("#up_cs_no").val(detail.inq_cs_no);	
							$("#up_user_id").val(detail.user_id);					
							$("#up_inq_title").val(detail.inq_title);	
							
							$('#up_inq_content').summernote({
								height: 300,                 // 에디터 높이
								minHeight: null,             // 최소 높이
								maxHeight: null,             // 최대 높이
								focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
								lang: "ko-KR",					// 한글 설정
								placeholder: "",	//placeholder 설정
								callbacks: {	//여기 부분이 이미지를 첨부하는 부분
									onImageUpload : function(files) {
										uploadSummernoteImageFile2(files[0],this);
									}
								}
							});

							//썸머노트에서 append 기능
							$('#up_inq_content').summernote('code', detail.inq_content);
											
							$("#up_inq_date").val(detail.inq_date);
							$("#up_ref").val(detail.ref);							
							$("#up_ref_step").val(detail.ref_step);							
							$("#up_ref_level").val(detail.ref_level);
							
							$("#up_btn_go").click(function(){
								var u = $("#upQnA").serialize();
								$.ajax("/customerservice/updateQnA",{data:u,success:function(){
									window.location.reload(true);
									$("#ListQnA").css("display","block");
									$("#UpdateQnA").css("display","none");
									}});
								}) //수정 ajax end
							});


						//관리자 삭제 버튼
						$("#admin_del_btn").click(function(){
							var con = confirm("삭제할까요?");

							if(con == true){
								var dd_no = {inq_no:detail.inq_no,ref:detail.ref}
								console.log(dd_no);
								
								//답변 있는지 확인
								$.ajax("/customerservice/checkQnA",{data:dd_no,success:function(r){
//											alert(r);
										console.log(typeof r);
										if(r === "o"){
											alert("답변이 있는 문의글은 수정,삭제 불가능합니다");
												window.location.href="/customerservice/List";
												$("#ListQnA").css("display","block");
												$("#DetailQnA").css("display","none");
											}else{
												//답변 없으면 삭제
												$.ajax("/customerservice/deleteQnA",{data:d_no,success:function(){
													window.location.reload(true);
													$("#ListQnA").css("display","block");
													$("#DetailQnA").css("display","none");
													}});							
											}
									}}); //checkQnA end
								}
							}); //관리자 삭제 버튼

						
							//삭제
							$("#del").click(function(){
//		 						alert(qna.inq_no);
								var con = confirm("삭제할까요?");

								if(con == true){
									var dd_no = {inq_no:detail.inq_no,ref:detail.ref}
									console.log(dd_no);
									
									//답변 있는지 확인
									$.ajax("/customerservice/checkQnA",{data:dd_no,success:function(r){
// 											alert(r);
											console.log(typeof r);
											if(r === "o"){
												alert("답변이 있는 문의글은 수정,삭제 불가능합니다");
													window.location.href="/customerservice/List";
													$("#ListQnA").css("display","block");
													$("#DetailQnA").css("display","none");
												}else{
													//답변 없으면 삭제
													$.ajax("/customerservice/deleteQnA",{data:d_no,success:function(){
														window.location.reload(true);
														$("#ListQnA").css("display","block");
														$("#DetailQnA").css("display","none");
														}});							
												}
										}}); //checkQnA end
									}					
								}); //삭제 end

						}}); //상세보기 ajax end

					//답변 이면 답변 버튼 지움
					var dit = qna.inq_title;
					if(dit === "답변 입니다"){
// 						$("#re").css({"display":"none"});
						var df = qna.inq_ref;
// 						console.log(df);
// 						alert(typeof df);
						var rdf = df -1;
						console.log("ref"+rdf);
						$("#re_inq_ref").val(rdf);
						
					}else{
						$("#re_inq_ref").val(qna.ref);
						
					}
					
					//답변등록 폼
					$("#re").click(function(){
// 						alert(qna.inq_no + "번글에 답변등록");
						$("#rebutton").css("display","none");
						$("#AddRe").css({"display":"block","border":"1px solid"});
						$("#ListQnA").css("display","none");
						$("#re_inq_no").val(qna.inq_no);
						$("#re_user_id").val(qna.user_id);
						$("#re_inq_title").val(qna.inq_title+"의 답변입니다");
						$("#re_inq_ref_step").val(qna.ref_step);
						$("#re_inq_ref_level").val(qna.ref_level);
						//답변등록
						$("#submitRe").click(function(){
							var r = $("#insertRe").serialize();
							
							$.ajax("/customerservice/insertRe",{data:r,success:function(){
								window.location.reload(true);
								$("#ListQnA").css("display","block");
								$("#AddRe").css("display","none");
								}});//insertRe ajax end
							
							}); //답변등록 end
						
						}); //답변등록폼 end

						
					
					}); //상세보기 end
		
			}) //each end
			
	}//list end
	//등록폼
	$("#add").click(function(){
		$("#ListQnA").css("display","none");
		$("#AddQnA").css("display","block");
		});

	//버트 누르면 등록
	$("#btn").click(function(){	
		var i = $("#insertQnA").serialize();	
		$.ajax("/customerservice/insertQnA",{data:i,success:function(){
			window.location.reload(true);
			$("#ListQnA").css("display","block");
			$("#AddQnA").css("display","none");
			}});
		});
	
	
	
})
</script>

</head>
<body>
<a href="/MainPage">메인페이지</a>

<section id="ListQnA">
<h2>QnA리스트</h2>
<sec:authorize access="isAnonymous()">
   <a href="/login/login">로그인</a>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
   <p><sec:authentication property="principal.user_id"/>님, 반갑습니다.</p>
   <a href="/login/logout">로그아웃</a>
</sec:authorize>
<hr>
<sec:authorize access="hasRole('ADMIN')"> 
<li><a href="<c:url value='/management/manager_main' />">관리자 메뉴</a></li> 
</sec:authorize>
<hr>

 <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Data Table</h4>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered zero-configuration">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Position</th>
                                                <th>Office</th>
                                                <th>Age</th>
                                                <th>Start date</th>
                                                <th>Salary</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Tiger Nixon</td>
                                                <td>System Architect</td>
                                                <td>Edinburgh</td>
                                                <td>61</td>
                                                <td>2011/04/25</td>
                                                <td>$320,800</td>
                                            </tr>
                                            <tr>
                                                <td>Garrett Winters</td>
                                                <td>Accountant</td>
                                                <td>Tokyo</td>
                                                <td>63</td>
                                                <td>2011/07/25</td>
                                                <td>$170,750</td>
                                            </tr>
                                            <tr>
                                                <td>Ashton Cox</td>
                                                <td>Junior Technical Author</td>
                                                <td>San Francisco</td>
                                                <td>66</td>
                                                <td>2009/01/12</td>
                                                <td>$86,000</td>
                                            </tr>
                                            <tr>
                                                <td>Cedric Kelly</td>
                                                <td>Senior Javascript Developer</td>
                                                <td>Edinburgh</td>
                                                <td>22</td>
                                                <td>2012/03/29</td>
                                                <td>$433,060</td>
                                            </tr>
                                            <tr>
                                                <td>Airi Satou</td>
                                                <td>Accountant</td>
                                                <td>Tokyo</td>
                                                <td>33</td>
                                                <td>2008/11/28</td>
                                                <td>$162,700</td>
                                            </tr>
                                            <tr>
                                                <td>Brielle Williamson</td>
                                                <td>Integration Specialist</td>
                                                <td>New York</td>
                                                <td>61</td>
                                                <td>2012/12/02</td>
                                                <td>$372,000</td>
                                            </tr>
                                            <tr>
                                                <td>Herrod Chandler</td>
                                                <td>Sales Assistant</td>
                                                <td>San Francisco</td>
                                                <td>59</td>
                                                <td>2012/08/06</td>
                                                <td>$137,500</td>
                                            </tr>
                                            <tr>
                                                <td>Rhona Davidson</td>
                                                <td>Integration Specialist</td>
                                                <td>Tokyo</td>
                                                <td>55</td>
                                                <td>2010/10/14</td>
                                                <td>$327,900</td>
                                            </tr>
                                            <tr>
                                                <td>Colleen Hurst</td>
                                                <td>Javascript Developer</td>
                                                <td>San Francisco</td>
                                                <td>39</td>
                                                <td>2009/09/15</td>
                                                <td>$205,500</td>
                                            </tr>
                                            <tr>
                                                <td>Sonya Frost</td>
                                                <td>Software Engineer</td>
                                                <td>Edinburgh</td>
                                                <td>23</td>
                                                <td>2008/12/13</td>
                                                <td>$103,600</td>
                                            </tr>
                                            <tr>
                                                <td>Jena Gaines</td>
                                                <td>Office Manager</td>
                                                <td>London</td>
                                                <td>30</td>
                                                <td>2008/12/19</td>
                                                <td>$90,560</td>
                                            </tr>
                                            <tr>
                                                <td>Quinn Flynn</td>
                                                <td>Support Lead</td>
                                                <td>Edinburgh</td>
                                                <td>22</td>
                                                <td>2013/03/03</td>
                                                <td>$342,000</td>
                                            </tr>
                                            <tr>
                                                <td>Charde Marshall</td>
                                                <td>Regional Director</td>
                                                <td>San Francisco</td>
                                                <td>36</td>
                                                <td>2008/10/16</td>
                                                <td>$470,600</td>
                                            </tr>
                                            <tr>
                                                <td>Haley Kennedy</td>
                                                <td>Senior Marketing Designer</td>
                                                <td>London</td>
                                                <td>43</td>
                                                <td>2012/12/18</td>
                                                <td>$313,500</td>
                                            </tr>
                                            <tr>
                                                <td>Tatyana Fitzpatrick</td>
                                                <td>Regional Director</td>
                                                <td>London</td>
                                                <td>19</td>
                                                <td>2010/03/17</td>
                                                <td>$385,750</td>
                                            </tr>
                                            <tr>
                                                <td>Michael Silva</td>
                                                <td>Marketing Designer</td>
                                                <td>London</td>
                                                <td>66</td>
                                                <td>2012/11/27</td>
                                                <td>$198,500</td>
                                            </tr>
                                            <tr>
                                                <td>Paul Byrd</td>
                                                <td>Chief Financial Officer (CFO)</td>
                                                <td>New York</td>
                                                <td>64</td>
                                                <td>2010/06/09</td>
                                                <td>$725,000</td>
                                            </tr>
                                            <tr>
                                                <td>Gloria Little</td>
                                                <td>Systems Administrator</td>
                                                <td>New York</td>
                                                <td>59</td>
                                                <td>2009/04/10</td>
                                                <td>$237,500</td>
                                            </tr>
                                            <tr>
                                                <td>Bradley Greer</td>
                                                <td>Software Engineer</td>
                                                <td>London</td>
                                                <td>41</td>
                                                <td>2012/10/13</td>
                                                <td>$132,000</td>
                                            </tr>
                                            <tr>
                                                <td>Dai Rios</td>
                                                <td>Personnel Lead</td>
                                                <td>Edinburgh</td>
                                                <td>35</td>
                                                <td>2012/09/26</td>
                                                <td>$217,500</td>
                                            </tr>
                                            <tr>
                                                <td>Jenette Caldwell</td>
                                                <td>Development Lead</td>
                                                <td>New York</td>
                                                <td>30</td>
                                                <td>2011/09/03</td>
                                                <td>$345,000</td>
                                            </tr>
                                            <tr>
                                                <td>Yuri Berry</td>
                                                <td>Chief Marketing Officer (CMO)</td>
                                                <td>New York</td>
                                                <td>40</td>
                                                <td>2009/06/25</td>
                                                <td>$675,000</td>
                                            </tr>
                                            <tr>
                                                <td>Caesar Vance</td>
                                                <td>Pre-Sales Support</td>
                                                <td>New York</td>
                                                <td>21</td>
                                                <td>2011/12/12</td>
                                                <td>$106,450</td>
                                            </tr>
                                            <tr>
                                                <td>Doris Wilder</td>
                                                <td>Sales Assistant</td>
                                                <td>Sidney</td>
                                                <td>23</td>
                                                <td>2010/09/20</td>
                                                <td>$85,600</td>
                                            </tr>
                                            <tr>
                                                <td>Angelica Ramos</td>
                                                <td>Chief Executive Officer (CEO)</td>
                                                <td>London</td>
                                                <td>47</td>
                                                <td>2009/10/09</td>
                                                <td>$1,200,000</td>
                                            </tr>
                                            <tr>
                                                <td>Gavin Joyce</td>
                                                <td>Developer</td>
                                                <td>Edinburgh</td>
                                                <td>42</td>
                                                <td>2010/12/22</td>
                                                <td>$92,575</td>
                                            </tr>
                                            <tr>
                                                <td>Jennifer Chang</td>
                                                <td>Regional Director</td>
                                                <td>Singapore</td>
                                                <td>28</td>
                                                <td>2010/11/14</td>
                                                <td>$357,650</td>
                                            </tr>
                                            <tr>
                                                <td>Brenden Wagner</td>
                                                <td>Software Engineer</td>
                                                <td>San Francisco</td>
                                                <td>28</td>
                                                <td>2011/06/07</td>
                                                <td>$206,850</td>
                                            </tr>
                                            <tr>
                                                <td>Fiona Green</td>
                                                <td>Chief Operating Officer (COO)</td>
                                                <td>San Francisco</td>
                                                <td>48</td>
                                                <td>2010/03/11</td>
                                                <td>$850,000</td>
                                            </tr>
                                            <tr>
                                                <td>Shou Itou</td>
                                                <td>Regional Marketing</td>
                                                <td>Tokyo</td>
                                                <td>20</td>
                                                <td>2011/08/14</td>
                                                <td>$163,000</td>
                                            </tr>
                                            <tr>
                                                <td>Michelle House</td>
                                                <td>Integration Specialist</td>
                                                <td>Sidney</td>
                                                <td>37</td>
                                                <td>2011/06/02</td>
                                                <td>$95,400</td>
                                            </tr>
                                            <tr>
                                                <td>Suki Burks</td>
                                                <td>Developer</td>
                                                <td>London</td>
                                                <td>53</td>
                                                <td>2009/10/22</td>
                                                <td>$114,500</td>
                                            </tr>
                                            <tr>
                                                <td>Prescott Bartlett</td>
                                                <td>Technical Author</td>
                                                <td>London</td>
                                                <td>27</td>
                                                <td>2011/05/07</td>
                                                <td>$145,000</td>
                                            </tr>
                                            <tr>
                                                <td>Gavin Cortez</td>
                                                <td>Team Leader</td>
                                                <td>San Francisco</td>
                                                <td>22</td>
                                                <td>2008/10/26</td>
                                                <td>$235,500</td>
                                            </tr>
                                            <tr>
                                                <td>Martena Mccray</td>
                                                <td>Post-Sales support</td>
                                                <td>Edinburgh</td>
                                                <td>46</td>
                                                <td>2011/03/09</td>
                                                <td>$324,050</td>
                                            </tr>
                                            <tr>
                                                <td>Unity Butler</td>
                                                <td>Marketing Designer</td>
                                                <td>San Francisco</td>
                                                <td>47</td>
                                                <td>2009/12/09</td>
                                                <td>$85,675</td>
                                            </tr>
                                            <tr>
                                                <td>Howard Hatfield</td>
                                                <td>Office Manager</td>
                                                <td>San Francisco</td>
                                                <td>51</td>
                                                <td>2008/12/16</td>
                                                <td>$164,500</td>
                                            </tr>
                                            <tr>
                                                <td>Hope Fuentes</td>
                                                <td>Secretary</td>
                                                <td>San Francisco</td>
                                                <td>41</td>
                                                <td>2010/02/12</td>
                                                <td>$109,850</td>
                                            </tr>
                                            <tr>
                                                <td>Vivian Harrell</td>
                                                <td>Financial Controller</td>
                                                <td>San Francisco</td>
                                                <td>62</td>
                                                <td>2009/02/14</td>
                                                <td>$452,500</td>
                                            </tr>
                                            <tr>
                                                <td>Timothy Mooney</td>
                                                <td>Office Manager</td>
                                                <td>London</td>
                                                <td>37</td>
                                                <td>2008/12/11</td>
                                                <td>$136,200</td>
                                            </tr>
                                            <tr>
                                                <td>Jackson Bradshaw</td>
                                                <td>Director</td>
                                                <td>New York</td>
                                                <td>65</td>
                                                <td>2008/09/26</td>
                                                <td>$645,750</td>
                                            </tr>
                                            <tr>
                                                <td>Olivia Liang</td>
                                                <td>Support Engineer</td>
                                                <td>Singapore</td>
                                                <td>64</td>
                                                <td>2011/02/03</td>
                                                <td>$234,500</td>
                                            </tr>
                                            <tr>
                                                <td>Bruno Nash</td>
                                                <td>Software Engineer</td>
                                                <td>London</td>
                                                <td>38</td>
                                                <td>2011/05/03</td>
                                                <td>$163,500</td>
                                            </tr>
                                            <tr>
                                                <td>Sakura Yamamoto</td>
                                                <td>Support Engineer</td>
                                                <td>Tokyo</td>
                                                <td>37</td>
                                                <td>2009/08/19</td>
                                                <td>$139,575</td>
                                            </tr>
                                            <tr>
                                                <td>Thor Walton</td>
                                                <td>Developer</td>
                                                <td>New York</td>
                                                <td>61</td>
                                                <td>2013/08/11</td>
                                                <td>$98,540</td>
                                            </tr>
                                            <tr>
                                                <td>Finn Camacho</td>
                                                <td>Support Engineer</td>
                                                <td>San Francisco</td>
                                                <td>47</td>
                                                <td>2009/07/07</td>
                                                <td>$87,500</td>
                                            </tr>
                                            <tr>
                                                <td>Serge Baldwin</td>
                                                <td>Data Coordinator</td>
                                                <td>Singapore</td>
                                                <td>64</td>
                                                <td>2012/04/09</td>
                                                <td>$138,575</td>
                                            </tr>
                                            <tr>
                                                <td>Zenaida Frank</td>
                                                <td>Software Engineer</td>
                                                <td>New York</td>
                                                <td>63</td>
                                                <td>2010/01/04</td>
                                                <td>$125,250</td>
                                            </tr>
                                            <tr>
                                                <td>Zorita Serrano</td>
                                                <td>Software Engineer</td>
                                                <td>San Francisco</td>
                                                <td>56</td>
                                                <td>2012/06/01</td>
                                                <td>$115,000</td>
                                            </tr>
                                            <tr>
                                                <td>Jennifer Acosta</td>
                                                <td>Junior Javascript Developer</td>
                                                <td>Edinburgh</td>
                                                <td>43</td>
                                                <td>2013/02/01</td>
                                                <td>$75,650</td>
                                            </tr>
                                            <tr>
                                                <td>Cara Stevens</td>
                                                <td>Sales Assistant</td>
                                                <td>New York</td>
                                                <td>46</td>
                                                <td>2011/12/06</td>
                                                <td>$145,600</td>
                                            </tr>
                                            <tr>
                                                <td>Hermione Butler</td>
                                                <td>Regional Director</td>
                                                <td>London</td>
                                                <td>47</td>
                                                <td>2011/03/21</td>
                                                <td>$356,250</td>
                                            </tr>
                                            <tr>
                                                <td>Lael Greer</td>
                                                <td>Systems Administrator</td>
                                                <td>London</td>
                                                <td>21</td>
                                                <td>2009/02/27</td>
                                                <td>$103,500</td>
                                            </tr>
                                            <tr>
                                                <td>Jonas Alexander</td>
                                                <td>Developer</td>
                                                <td>San Francisco</td>
                                                <td>30</td>
                                                <td>2010/07/14</td>
                                                <td>$86,500</td>
                                            </tr>
                                            <tr>
                                                <td>Shad Decker</td>
                                                <td>Regional Director</td>
                                                <td>Edinburgh</td>
                                                <td>51</td>
                                                <td>2008/11/13</td>
                                                <td>$183,000</td>
                                            </tr>
                                            <tr>
                                                <td>Michael Bruce</td>
                                                <td>Javascript Developer</td>
                                                <td>Singapore</td>
                                                <td>29</td>
                                                <td>2011/06/27</td>
                                                <td>$183,000</td>
                                            </tr>
                                            <tr>
                                                <td>Donna Snider</td>
                                                <td>Customer Support</td>
                                                <td>New York</td>
                                                <td>27</td>
                                                <td>2011/01/25</td>
                                                <td>$112,000</td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Name</th>
                                                <th>Position</th>
                                                <th>Office</th>
                                                <th>Age</th>
                                                <th>Start date</th>
                                                <th>Salary</th>
                                            </tr>
                                        </tfoot>
                                    </table>
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


<form role="form" method="get">
  <div class="search">
    <select name="searchType">
      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
    </select>

    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

    <button id="searchBtn" type="button">검색</button>
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "/customerservice/List" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
  </div>
</form>
<table id="list" border="1" width="60%">
	<tr><th>카테고리</th><th>작성자</th><th>제목</th><th>작성일자</th></tr>
</table>

<button id="add">QnA등록하기</button><br>
<div>
  <ul>
    <c:if test="${pageMaker.prev}">
    	<li><a href="/customerservice/List${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="/customerservice/List${pageMaker.makeSearch(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="/customerservice/List${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>
</section>


<section id="AddQnA">
<h2>QnA등록</h2>
<hr>
<form id="insertQnA">
카테고리<br>
<select name="cs_no" required="required">
	<option value="1">홈페이지 이용 관련</option>
	<option value="2">계정 관련</option>
	<option value="3">결제 관련 문의</option>
</select><br>
작성자<br>
<input type="text" name="user_id" required="required" value="${login_id }"><br>
제목<br>
<input type="text" name="inq_title" required="required"><br>
내용<br>
<textarea rows="8" cols="100" id="summernote" name="inq_content"></textarea><br>
<a href="/customerservice/List">뒤로가기</a>
<input type="hidden" name="inq_file" id="inq_file"><br>
</form>
<input type="button" id="btn" value="문의등록"><br>
<a href="/customerservice/List">QnA리스트 돌아가기</a>
</section>

<section id="DetailQnA">
<h2>QnA상세보기</h2>
<hr>
글번호 	<input type="text" id="detail_inq_no" readonly="readonly"><br>
카테고리	<input type="text" id="detail_cs_no" readonly="readonly"><br>
작성자	<input type="text" id="detail_user_id" readonly="readonly"><br>
제목		<input type="text" id="detail_inq_title" readonly="readonly"><br>
내용		<div id="detail_inq_content"></div><br>
작성일	<input type="text" id="detail_inq_date" readonly="readonly"><br>

	<section id="rebutton">
		
<!-- 		관리자만 답변 버튼 보임 -->
<%-- 		<sec:authorize access="hasRole('ROLE_ADMIN')">  --%>
<!-- 			<button id="re">답변달기</button><br> -->
<!-- 			<button id="admin_del_btn">삭제하기</button> -->
<%-- 		</sec:authorize> --%>
		
		
			
	</section>
	<a href="/customerservice/List">QnA리스트 돌아가기</a>
</section>
<section id="AddRe">
	<h3>답변등록</h3>
	<hr>
	<form id="insertRe">
	<!-- 원본글 번호 저장 -->
	<input type="text" id="re_inq_no" name="inq_no"><br>
		카테고리<br>
		<select name="cs_no">
			<option value="1">홈페이지 이용 관련</option>
			<option value="2">계정 관련</option>
			<option value="3">결제 관련 관련</option>
		</select><br>
		작성자 아이디<br>
		<input type="text" id="re_user_id" name="user_id"><br>
		제목<br>
		<input type="text" id="re_inq_title" name="re_inq_title"><br>
		내용<br>
		<textarea rows="8" cols="100" id="re_inq_content" name="re_inq_content" required="required"></textarea><br>
		<input type="text" id="re_inq_ref" name="re_ref">
		<input type="text" id="re_inq_ref_step" name="re_ref_setp">
		<input type="text" id="re_inq_ref_level" name="re_ref_level">
	</form>
	<button id="submitRe">답변등록</button><br>
	<a href="/customerservice/List">QnA리스트 돌아가기</a>
</section>

<section id="UpdateQnA">
	<h2>QnA수정</h2>
	<hr>
	<form id="upQnA">
		<input type="text" id="up_inq_no" name="up_inq_no"><br>
		카테고리<br>
		<select id="up_cs_no" name="up_cs_no"><br>
			<option value="1">홈페이지 이용 관련</option>
			<option value="2">계정 관련</option>
			<option value="3">결제 관련 문의</option>
		</select><br>
		작성자<br>
		<input type="text" id="up_user_id" name="up_user_id" readonly="readonly"><br>
		제목<br>
		<input type="text" id="up_inq_title" name="up_inq_title"><br>
		
		내용<br>
		<div id="up_content">
		
		</div>
		<textarea rows="8" cols="100" id="up_inq_content" name="up_inq_content"></textarea><br>
		작성일<br>
		<input type="hidden" id="up_inq_date" name="up_inq_date" readonly="readonly"><br>
		<input type="hidden" id="up_ref" name="up_ref"><br>
		<input type="hidden" id="up_ref_step" name="up_ref_step"><br>
		<input type="hidden" id="up_ref_level" name="up_ref_level"><br>
		<input type="hidden" name="up_inq_file" id="up_inq_file"><br>
	</form>
	<button id="up_btn_go">수정</button><br>

<a href="/customerservice/List">QnA리스트 돌아가기</a>
</section>

<%@ include file="../footer.jsp"%>
</body>
</html>