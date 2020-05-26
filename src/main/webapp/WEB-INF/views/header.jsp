<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>PET WE GO</title>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script type="text/javascript">
  $(function(){
	  var user_id="admin";
		if(user_id==="admin"){
			$("#adminPage").show();
		}else{
			$("#adminPage").hide();
		}
  })
  	
  </script>

  <!-- Bootstrap core CSS -->
  <link href="resources/main/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="resources/main/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="resources/main/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="resources/main/css/scrolling-nav.css" rel="stylesheet">

</head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>PET WE GO</title>
  <style type="text/css">
  	#logoArea{
  		top:0;
  		text-align: center;
  	}
  </style>

  <!-- Bootstrap core CSS -->
  <link href="resources/main/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="resources/main/css/scrolling-nav.css" rel="stylesheet">

</head>

<body id="page-top">
	<div id="logoArea">
  		<a class="navbar-brand" href="petwego_main"><img src="resources/main/img/petwego_logo.jpg" width="450" height="300" id="logo"></a>
  	</div>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-info fixed-top" id="mainNav">
    <div class="container">
     <a class="navbar-brand js-scroll-trigger" href="#page-top">PET WE GO</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/pic_board/list">마이펫</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#services">숙소찾기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/board/list">커뮤니티</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/together/listTogether">함께가요</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/admin/index">고객지원</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/mypage/mypage">마이페이지</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="" id="adminPage">관리자페이지</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
  <!-- Bootstrap core JavaScript -->
  <script src="resources/main/vendor/jquery/jquery.min.js"></script>
  <script src="resources/main/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="resources/main/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom JavaScript for this theme -->
  <script src="resources/main/js/scrolling-nav.js"></script>

</body>

</html>
