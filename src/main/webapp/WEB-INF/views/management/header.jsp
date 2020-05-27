<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 민아) 5/24, 관리자페이지 꾸미기 및 정리 중  -->
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <meta name="_csrf" content="${_csrf.token}"/>
  <meta name="_csrf_header" content="${_csrf.headerName}"/>

  <title>Pet We Go | 관리자페이지</title>

  <!-- Custom fonts for this template -->
  <link href="/resources/manager/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/resources/manager/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="/resources/manager/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	
   <!-- Bootstrap core JavaScript-->
  <script src="/resources/manager/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/manager/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/resources/manager/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugins -->
  <script src="/resources/manager/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="/resources/manager/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="/resources/manager/js/demo/datatables-demo.js"></script>
  

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/management/manager_main">
        <div class="sidebar-brand-text mx-2"><i class="fas fa-users-cog"></i>관리자 페이지</div>
      </a>
      
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/MainPage">
        <div class="sidebar-brand-text mx-2"><i class="fas fa-home"></i>메인 페이지</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard // 관리자 메인페이지 -->
      <li class="nav-item">
        <a class="nav-link" href="/management/manager_main">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>관리자 메인</span></a>
      </li>
      
      <!-- Nav Item - Charts // 로그페이지 -->
      <li class="nav-item">
        <a class="nav-link" href="/management/listLog">
          <i class="fas fa-chart-line"></i>
          <span>통계</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">
      
       <!-- Nav Item - Pages Collapse Menu // 왼쪽메뉴 바 - 게시판 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-chalkboard-teacher"></i>
          <span>게시판</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">게시판 관리</h6>
            <a class="collapse-item" href="/management/notice/listNotice">공지사항</a>
            <a class="collapse-item" href="/management/qna/listQnA">문의사항</a>
            <a class="collapse-item" href="/management/freeBoard/listBoard">자유게시판</a>
            <a class="collapse-item" href="#">SNS게시판</a>
            <a class="collapse-item" href="#">함께가요</a>
          </div>
        </div>
      </li>
      
      <!-- Nav Item - Utilities Collapse Menu // 왼쪽메뉴 바 - 회원 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-users"></i>
          <span>회원</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">회원관리</h6>
            <a class="collapse-item" href="/management/member/member_list">회원목록</a>
            <a class="collapse-item" href="/management/member/listPay">결제목록</a>
            <a class="collapse-item" href="#">Animations</a>
            <a class="collapse-item" href="#">Other</a>
          </div>
        </div>
      </li>
      
         <!-- Nav Item - Pages Collapse Menu // 왼쪽 메뉴 바 - 숙소 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-dog"></i>
          <span>숙소</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
           <h6 class="collapse-header">숙소관리</h6>
            <a class="collapse-item" href="#">숙소등록</a>
            <a class="collapse-item" href="#">숙소 목록</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">Other Pages:</h6>
            <a class="collapse-item" href="#">404 Page</a>
            <a class="collapse-item" href="#">Blank Page</a>
          </div>
        </div>
      </li>
      
      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>  
    </ul>
    
    <!-- End of Sidebar -->
	
	<!-- 이건 위에 있으면 사이드바 토글이 동작안하길래 여기에 뒀음  -->
	<!-- Custom scripts for all pages-->
	<script src="/resources/manager/js/sb-admin-2.min.js"></script>
	
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">
</html>