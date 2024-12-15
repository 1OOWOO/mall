<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>관리자 대시보드</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
				<a class="navbar-brand waves-effect waves-dark" href="${pageContext.request.contextPath}/admin/dashBoard"><i
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
						class="active-menu waves-effect waves-dark"><i class="fa fa-desktop"></i>
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
			<div class="alert">
				<i class="fa-solid fa-house" style="color:darkgrey;"></i>
				<a href="${pageContext.request.contextPath}/hello" style="color:darkgrey;">
				<strong>OOWOO 바로가기</strong></a>
			</div>
		</nav>

		<div id="page-wrapper">
			<div class="header">
				<h1 class="page-header">회원관리</h1>
			</div>
			<div id="page-inner">
				<div class="dashboard-cards">
					<div class="row">
						<!-- 이메일 검색 폼 / AJAX 사용 -->
						<form id="searchForm" method="get">
							<div class="input-group" style=" display: flex;">
								<input type="text" id="searchEmail" name="searchEmail" class="form-control" placeholder="이메일 검색"
									value="${searchEmail}" style="width: 250px;">
								<button type="button" id="searchButton" class="btn">검색</button>
								<div id="customerResult"></div>
							</div>		
						</form>
						
						<table class="table">
							<thead>
								<tr>
									<th>이메일</th>
									<th>생년월일</th>
									<th>가입날짜</th>
								</tr>
							</thead>
							<tbody id="customerResults">
								<c:forEach var="c" items="${customerList}">
									<tr>
										<td>
											<a href="${pageContext.request.contextPath}/admin/customerOne?customerMail=${c.customerMail}">${c.customerMail}</a>
										</td>
										<td>${c.customerBirth}</td>
										<td>${c.createDate}</td>
									</tr>
								</c:forEach>
								<c:if test="${empty customerList}">
									<tr>
										<td colspan="3" class="text-center">검색된 결과가 없습니다.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
						<!-- 페이징 -->
							<div class="text-center mb-3">
								<c:if test="${currentPage > numPerPage}">
									<a href="${pageContext.request.contextPath}/admin/customerList?currentPage=${beginPagingNum - numPerPage}">이전</a>
								</c:if>
								<c:forEach var="num" begin="${beginPageNum}" end="${endPageNum}">
									<c:if test="${num==currentPage}">
										${num}&nbsp;
									</c:if>
									<c:if test="${num!=currentPage}">
										<a href="${pageContext.request.contextPath}/admin/customerList?currentPage=${num}">${num}</a>
										&nbsp;
									</c:if>
								</c:forEach>
								<c:if test="${currentPage < lastPage - numPerPage }">
									<a href="${pageContext.request.contextPath}/admin/customerList?currentPage=${beginPagingNum + numPerPage}">다음</a>
								</c:if>
							</div>
				</div>
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	<!-- JS Scripts-->
	<!-- jQuery Js -->
	<script src="assets/js/jquery-1.10.2.js"></script>

	<!-- Bootstrap Js -->
	<script src="assets/js/bootstrap.min.js"></script>

	<script src="assets/materialize/js/materialize.min.js"></script>

	<!-- Metis Menu Js -->
	<script src="assets/js/jquery.metisMenu.js"></script>
	<!-- Morris Chart Js -->
	<script src="assets/js/morris/raphael-2.1.0.min.js"></script>
	<script src="assets/js/morris/morris.js"></script>


	<script src="assets/js/easypiechart.js"></script>
	<script src="assets/js/easypiechart-data.js"></script>

	<script src="assets/js/Lightweight-Chart/jquery.chart.js"></script>

	<!-- Custom Js -->
	<script src="assets/js/custom-scripts.js"></script>


</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script> // 고객 검색기능
    $(document).ready(function() { // 문서 완전히 로드시 실행
        $('#searchButton').on('click', function() { //
            var searchEmail = $('#searchEmail').val(); // 입력된 이메일 값 가져옴

            $.ajax({
                url: '${pageContext.request.contextPath}/admin/customerList/search', // 검색 요청 URL
                method: 'GET',
                data: { searchEmail: searchEmail }, // 서버로 전송할 데이터 (검색 이메일)
                success: function(response) {
                    var customerList = response.customerList; // 고객 리스트
                    var tbody = $('#customerResults');
                    tbody.empty(); // 기존 결과 비우기

                    if (customerList.length > 0) { // 고객 리스트에 결과 있는 확인
                        customerList.forEach(function(customer) {
                            tbody.append(
                                '<tr>' +
                                '<td><a href="${pageContext.request.contextPath}/admin/customerOne?customerMail=' + customer.customerMail + '">' + customer.customerMail + '</a></td>' +
                                '<td>' + customer.customerBirth + '</td>' +
                                '<td>' + customer.createDate + '</td>' +
                                '</tr>'
                            );
                        });
                    } else { // 고객 리스트 비어있는 경우
                        tbody.append('<tr><td colspan="3" class="text-center">검색된 결과가 없습니다.</td></tr>');
                    }
                },
                error: function() { // 요처이 실패했을 때 호출
                    alert('검색 중 오류가 발생했습니다.');
                }
            });
        });
    });
</script>

</html>