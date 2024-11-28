<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>oowoo 관리자</title>
</head>

<body>
	<div>
		<!-- leftMenu.jsp 삽입 -->
		<c:import url="/WEB-INF/view/admin/leftMenu.jsp"></c:import>
	</div>
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="header">
				<h1 class="page-header">Dashboard</h1>
			</div>
			<div id="page-inner">

				<div class="dashboard-cards">
					<div class="row">
						<div class="col-xs-12 col-sm-6 col-md-6">

							<div class="card horizontal cardIcon waves-effect waves-dark">
								<div class="card-image red">
									<i class="material-icons dp48">import_export</i>
								</div>
								<div class="card-stacked red">
									<div class="card-content">
										<h3>${summary.newOrders}</h3>
									</div>
									<div class="card-action">
										<strong>신규 주문</strong>
									</div>
								</div>
							</div>

						</div>
						<div class="col-xs-12 col-sm-6 col-md-6">

							<div class="card horizontal cardIcon waves-effect waves-dark">
								<div class="card-image orange">
									<i class="material-icons dp48">shopping_cart</i>
								</div>
								<div class="card-stacked orange">
									<div class="card-content">
										<h3>${summary.canceledOrders}</h3>
									</div>
									<div class="card-action">
										<strong>취소 주문</strong>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6">

							<div class="card horizontal cardIcon waves-effect waves-dark">
								<div class="card-image blue">
									<i class="material-icons dp48">shopping_cart</i>
								</div>
								<div class="card-stacked blue">
									<div class="card-content">
										<h3>${summary.newReviews}</h3>
									</div>
									<div class="card-action">
										<strong>신규 후기</strong>
									</div>
								</div>
							</div>

						</div>
						<div class="col-xs-12 col-sm-6 col-md-6">

							<div class="card horizontal cardIcon waves-effect waves-dark">
								<div class="card-image green">
									<i class="material-icons dp48">shopping_cart</i>
								</div>
								<div class="card-stacked green">
									<div class="card-content">
										<h3>${summary.newUsers}</h3>
									</div>
									<div class="card-action">
										<strong>신규 회원</strong>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>