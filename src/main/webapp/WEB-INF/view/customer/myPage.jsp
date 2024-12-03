<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@page import="com.example.mall.vo.Customer"%>
<html lang="en-US">
<head>
<%@ page pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>OOWOO</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/customer/customercss/woocommerce-layout.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/customer/customercss/woocommerce-smallscreen.css'
	type='text/css' media='only screen and (max-width: 768px)' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/customer/customercss/woocommerce.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/customer/customercss/font-awesome.min.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/style.css' type='text/css'
	media='all' />
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/customer/customercss/easy-responsive-shortcodes.css'
	type='text/css' media='all' />
</head>

<body
	class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">

	<!--  확인용 주석  -->
	<div id="page">
		<div class="container">
			<header>
				<!-- 로그인  -->
				<div style="float: right;">
					<%
					Customer loggedInCustomer = (Customer) session.getAttribute("loggedInCustomer");
					if (loggedInCustomer == null) {
					%>
					<span> <a href="login"> 로그인 </a> | <a href="signUp">
							회원가입 </a>
					</span>
					<%
					} else {
					%>
					<span> ${loggedInCustomer.customerMail} 님 |<a
						href="${pageContext.request.contextPath}/logout"> 로그아웃 </a></span>

					<%
					}
					%>

					<%--        <span> <a href="login"> 로그인 </a> | <a href="signUp"> 회원가입 </a> </span>
	         <span> ${customerMail} 님 </span>  --%>
				</div>
				<div class="site-branding">
					<!-- <h1 class="site-title"><a href="index.html" rel="home">OOWOO</a></h1> -->
					<h1 class="site-title">
						<a href="index.html" rel="home"><img src="images/logo.png"></a>
					</h1>
					<h2 class="site-description">모방은 창조의 어머니이다.</h2>
				</div>
				<nav id="site-navigation" class="main-navigation">
					<button class="menu-toggle">Menu</button>
					<a class="skip-link screen-reader-text" href="#content">Skip to
						content</a>
					<div class="menu-menu-1-container">
						<ul id="menu-menu-1" class="menu">
							<li><a
								href="${pageContext.request.contextPath}/customer/searchGoods?categoryNo=1">계절별의류</a>
								<ul class="sub-menu">
									<li><a href="portfolio-item.html">봄</a></li>
									<li><a href="blog-single.html">여름</a></li>
									<li><a href="shop-single.html">가을</a></li>
									<li><a href="shop-single.html">겨울</a></li>
								</ul></li>

							<li><a
								href="${pageContext.request.contextPath}/customer/searchGoods?categoryNo=2">액세서리</a>
								<ul class="sub-menu">
									<li><a href="portfolio-item.html">모자</a></li>
									<li><a href="blog-single.html">넥&레그 워머</a></li>
									<li><a href="shop-single.html">목걸이</a></li>
								</ul></li>
							<li><a
								href="${pageContext.request.contextPath}/customer/searchGoods?categoryNo=3">장난감</a>
								<ul class="sub-menu">
									<li><a href="portfolio-item.html">노즈워크</a></li>
									<li><a href="blog-single.html">오뚜기</a></li>
									<li><a href="shop-single.html">터그</a></li>
									<li><a href="shop-single.html">인형</a></li>
								</ul></li>
							<li><a
								href="${pageContext.request.contextPath}/customer/searchGoods?categoryNo=4">산책용품</a>
								<ul class="sub-menu">
									<li><a href="portfolio-item.html">목줄</a></li>
									<li><a href="blog-single.html">입마개</a></li>
									<li><a href="shop-single.html">리드줄</a></li>
									<li><a href="shop-single.html">하네스</a></li>
								</ul></li>
							<li><a
								href="${pageContext.request.contextPath}/customer/searchGoods?categoryNo=5">간식&영양제</a>
								<ul class="sub-menu">
									<li><a href="portfolio-item.html">육포</a></li>
									<li><a href="blog-single.html">비스킷</a></li>
									<li><a href="shop-single.html">비타민</a></li>
								</ul></li>
						</ul>
					</div>
				</nav>
			</header>
			<!-- #masthead -->
			<div id="content" class="site-content">
				<div id="primary" class="content-area column full">
					<main id="main" class="site-main" role="main">
						<h3 style="text-align: center;">마이페이지</h3>
						<h4>개인정보</h4>
						<table>
							<tr>
								<td>이메일</td>
								<td><input type="text" value="${customer.customerMail}" /></td>
							</tr>
							<tr>
								<td>pw</td>
								<td><input type="text" value="${customer.customerPw}"></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input type="text" value="${customer.addressDetail}"></td>
							</tr>

						</table>

						<h4>주문조회</h4>
						<div class="col-sm-10">
							<table
								class="table table-striped table-bordered table-hover dataTable no-footer">
								<tr role="row">
									<th>주문 번호</th>
									<th>상품</th>
									<th>수량</th>
									<th>금액</th>
									<th>주문 상태</th>
									<th>리뷰</th>
								</tr>
								<c:forEach var="o" items="${ordersList}">
									<input type="hidden" name="ordersNo" value="${o.ordersNo}">
									<tr>
										<td style="text-align: center;">${o.ordersNo}</td>
										<td>${o.goodsTitle}</td>
										<td style="text-align: center;">${o.ordersAmount}</td>
										<td>${o.goodsPrice}</td>
										<td style="text-align: center;"><input type="text"
											name="paymentState" id="paymentState${o.ordersNo}"
											value="${o.paymentState}" style="text-align: center;" readonly/></td>
										<td><button> 리뷰 쓰기 </button></td>

									</tr>
								</c:forEach>
							</table>
						</div>

						<!-- 페이징
		            <nav class="woocommerce-pagination">
			            <ul class="page-numbers">
			               <li><span class="page-numbers current">1</span></li>
			               <li><a class="page-numbers" href="#">2</a></li>
			               <li><a class="next page-numbers" href="#">→</a></li>
			            </ul>
		            </nav> -->
					</main>
				</div>
				<!-- #primary -->
			</div>
			<!-- #content -->
		</div>
		<!-- .container -->
		<footer id="colophon" class="site-footer">
			<div class="container">
				<div class="site-info">
					<h1
						style="font-family: 'Herr Von Muellerhoff'; color: #ccc; font-weight: 300; text-align: center; margin-bottom: 0; margin-top: 0; line-height: 1.4; font-size: 46px;">OOWOO</h1>
					Shared by <i class="fa fa-love"></i><a
						href="https://bootstrapthemes.co">BootstrapThemes</a>

				</div>
			</div>
		</footer>
		<a href="#top" class="smoothup" title="Back to top"><span
			class="genericon genericon-collapse"></span></a>
	</div>
	<!-- #page -->
	<script src='customer/customerjs/jquery.js'></script>
	<script src='customer/customerjs/plugins.js'></script>
	<script src='customer/customerjs/scripts.js'></script>
	<script src='customer/customerjs/masonry.pkgd.min.js'></script>
	<script>
		
	</script>
</body>
</html>