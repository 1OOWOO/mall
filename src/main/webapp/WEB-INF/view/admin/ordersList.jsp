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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
					<li><a class="waves-effect waves-dark"
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
						class="active-menu waves-effect waves-dark"><i class="fa fa-qrcode"></i>
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
							<form id="formModifyOrders${o.ordersNo}" action="${pageContext.request.contextPath}/admin/ordersList" method="post">
								<table class="table table-striped table-bordered table-hover dataTable no-footer">
									<tr role="row">
										<th>주문 번호</th>
										<th>상품</th>
										<th>수량</th>
										<th>금액</th>
										<th>주문 상태</th>
										<th>결제 방법</th>
										<th></th>
									</tr>
									<c:forEach var="o" items="${ordersList}">
									<input type="hidden" name="ordersNo" value="${o.ordersNo}">
										<tr>
											<td style=" text-align: center;">${o.ordersNo}</td>
											<td>${o.goodsTitle}</td>
											<td style="text-align: center;">${o.ordersAmount}</td>
											<td>${o.goodsPrice}</td>
											<td style="text-align: center;">
								                <select name="paymentState" id="paymentState${o.ordersNo}">
							                		<option value="">:${o.paymentState}:</option>
							                		<option value="결제완료">결제완료</option>
							                		<option value="배송중">배송중</option>
							                		<option value="배송완료">배송완료</option>
							                	</select>
							                </td>
							                <td>${o.paymentMethod}</td>
							                <td><button id="btnModifyOrders${o.ordersNo}" type="submit">수정</button></td>
										</tr>
									</c:forEach>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$('#btnModifyOrders${o.ordersNo}').click(function(){
		if($('#paymentState${o.ordersNo}').val() == '') {
			alert('주문 상태를 선택하세요')
		} else {
			$('#formModifyOrders${o.ordersNo}').submit();
		}
	});
</script>
</html>