<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file="../management/header.jsp"%>
<!-- 민아) 5/24, 관리자페이지 꾸미기 및 정리  -->
<html>
<body>
	<br>
	<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">관리자 | 메인</h1>
		</div>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h4 class="m-0 font-weight-bold text-primary">NEW</h4>
			</div>
			<div class="card-body">
				<!-- Content Row -->
				<div class="row">

					<!-- Earnings (Monthly) Card Example //  새로 가입한 회원수 -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-primary shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="text-s font-weight-bold text-primary text-uppercase mb-1">신규회원 수(일주일)</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">${newM }명</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-user-plus fa-3x text-gray-300"></i>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Earnings (Monthly) Card Example //  결제된 금액 -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-primary shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="text-s font-weight-bold text-primary text-uppercase mb-1">결제된 금액(일주일)</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">${newP }원</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-won-sign fa-3x text-gray-300"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- Earnings (Monthly) Card Example //  예약 건수 -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-primary shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="text-s font-weight-bold text-primary text-uppercase mb-1">예약 건수(일주일)</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">${newReservation }개</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-receipt fa-3x text-gray-300"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- Earnings (Monthly) Card Example // 관리중인 숙소 수 -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-primary shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="text-s font-weight-bold text-primary text-uppercase mb-1">관리중인 숙소</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">총 ${allfacility }개</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-hotel fa-3x text-gray-300"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- Earnings (Monthly) Card Example // 오늘 등록된 게시물(자유게시판) -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-info shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="text-s font-weight-bold text-info text-uppercase mb-1">커뮤니티 새글(일주일)</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">${newBoard }개</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-clipboard-list fa-3x text-gray-300"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- Earnings (Monthly) Card Example // 오늘 등록된 게시물 (마이펫) -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-info shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="text-s font-weight-bold text-info text-uppercase mb-1">마이펫 새글(일주일)</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">${newPic }개</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-images fa-3x text-gray-300"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- Earnings (Monthly) Card Example // 오늘 등록된 게시물 (문의사항) -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-info shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="text-s font-weight-bold text-info text-uppercase mb-1">QnA 새글(일주일)</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">${newQnA }개</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-question fa-3x text-gray-300"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- Pending Requests Card Example // 오늘 개설된 모임수 -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-info shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="text-s font-weight-bold text-info text-uppercase mb-1">개설된모임(일주일)</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">${newT }개</div>
									</div>
									<div class="col-auto">
										<i class="far fa-handshake fa-3x text-gray-300"></i>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- 프로젝트 진행률 -->
		 <!-- Project Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Pet We Go 프로젝트 진행률</h6>
                </div>
                <div class="card-body">
                  <h4 class="small font-weight-bold">ERD <span class="float-right">99%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 99%" aria-valuenow="99" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">EXAMPLE DATA <span class="float-right">10%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-warning" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">BootStrap <span class="float-right">80%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">ManagerPage <span class="float-right">90%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-info" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">Payment System <span class="float-right">Complete!</span></h4>
                  <div class="progress">
                    <div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
		<!-- 빈공간 -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h4 class="m-0 font-weight-bold text-primary">Blank Page...뭘넣지?</h4>
			</div>
			<div class="card-body"></div>
		</div>
	</div>
</body>
<%@include file="../management/footer.jsp"%>
</html>