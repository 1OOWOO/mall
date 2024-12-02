<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>상품 관리</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="assets/materialize/css/materialize.min.css"
	media="screen,projection" />
<!-- Bootstrap Styles-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- Morris Chart Styles-->
<link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- Custom Styles-->
<link href="assets/css/custom-styles.css" rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">
</head>

<body>
	<div id="wrapper">
		<nav class="navbar navbar-default top-navbar" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle waves-effect waves-dark"
					data-toggle="collapse" data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand waves-effect waves-dark" href="index.html"><i
					class="large material-icons">track_changes</i> <strong>OOWOO</strong></a>

				<div id="sideNav" href="">
					<i class="material-icons dp48">toc</i>
				</div>
			</div>

			<ul class="nav navbar-top-links navbar-right">
				<li><a class="dropdown-button waves-effect waves-dark"
					href="#!" data-activates="dropdown1"><i
						class="fa fa-user fa-fw"></i> <b>${loggedInStaff.staffId}님</b> <i
						class="material-icons right">arrow_drop_down</i></a></li>
			</ul>
		</nav>
		<!-- staff Menu -->
		<ul id="dropdown1" class="dropdown-content">
			<li><a
				href="${pageContext.request.contextPath}/admin/staffLogout"><i
					class="fa fa-sign-out fa-fw"></i> Logout</a></li>
		</ul>
		<!-- Left Menu  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li><a class="active-menu waves-effect waves-dark"
						href="${pageContext.request.contextPath}/admin/dashBoard"><i
							class="fa fa-dashboard"></i> 대시보드</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/customerList"
						class="waves-effect waves-dark"><i class="fa fa-desktop"></i>
							회원관리 </a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/goodsList"
						class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i>
							상품관리</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/ordersList"
						class="waves-effect waves-dark"><i class="fa fa-qrcode"></i>
							주문관리</a></li>
				</ul>
			</div>
		</nav>
		<!-- /. NAV SIDE  -->

		<div id="page-wrapper">
			<div class="header">
				<h1 class="page-header">주문 관리</h1>
			</div>
			<div id="page-inner">
				<div class="dashboard-cards">
					<div class="row">
				    	<div class="col-sm-10">
							<table>
								<tr>
									<td>No</td>
									<td>상품명</td>
									<td>가격</td>
								</tr>
								<c:forEach var="g" items="${goodsList}">
									<tr>
										<td>${g.goodsNo}</td>
										<td>
											<a href="${pageContext.request.contextPath}/admin/goodsOne?goodsNo=${g.goodsNo}">
											${g.goodsTitle}</a>
										</td>
										<td>${g.goodsPrice}</td>
									</tr>
								</c:forEach>
							</table>
							
							<!-- 페이징 -->
							<div >
								<nav style="text-align: center;">
									<ul class="flex-control-paging pagination justify-content-start">
										<c:if test="${currentPage > 10}">
											<li class="page-item"> <!-- 이전 10 페이지 -->
												<a class="page-link" href="${pageContext.request.contextPath}/admin/goodsList?goodsNo=${goodsNo}&urrentPage=${currentPage-10}"> 
												<span aria-hidden="true">&laquo;</span></a>
											</li>
										</c:if>
										<c:if test="${currentPage <= 10}"> <!-- 이전 10 페이지가 없으면 비활성화-->
											<li class="page-item disabled"> 
										      <span class="page-link">&laquo;</span>
										    </li>
										</c:if>
										
										<c:forEach var="num" begin="${startPagingNum}" end="${endPagingNum}">
											<c:if test="${num == currentPage}">
												<li class="page-item"><span class="page-link" style="font-weight:bold;">${num}</span></li>
											</c:if>
											<c:if test="${num != currentPage}">
												<li class="page-item">
													<a class="page-link" href="${pageContext.request.contextPath}/admin/goodsList?goodsNo=${goodsNo}&currentPage=${num}">${num}</a>
												</li>
											</c:if>
										</c:forEach>
										
										<c:if test="${currentPage + 10 <= lastPage}">
										    <li class="page-item"> <!-- 다음 10 페이지 -->
										        <a class="page-link" href="${pageContext.request.contextPath}/admin/goodsList?goodsNo=${goodsNo}&currentPage=${currentPage + 10}" aria-label="Next">
										            <span aria-hidden="true">&raquo;</span>
										        </a>
										    </li>
										</c:if>
										<c:if test="${currentPage + 10 > lastPage}"> <!-- 다음 10 페이지가 없으면 비활성화-->
										    <li class="page-item disabled">
										        <span class="page-link">&raquo;</span>
										    </li>
										</c:if>
									</ul>
								</nav>
							</div>
							<a href="${pageContext.request.contextPath}/admin/addGoods">상품 등록</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>