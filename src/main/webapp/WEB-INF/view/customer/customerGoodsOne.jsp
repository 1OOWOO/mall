<%@page import="com.example.mall.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>OOWOO | GoodsOne</title>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<!-- Author : 오아림 -->
<body class="single single-product woocommerce woocommerce-page">
	<div id="page">
		<div class="container">
			<!-- <header id="masthead" class="site-header"> -->
			<header>
				<!-- 로그인  -->
				<div style="float: right;">
					<%
					Customer loggedInCustomer = (Customer) session.getAttribute("loggedInCustomer");
					if (loggedInCustomer == null) {
					%>
					<span> <a href="${pageContext.request.contextPath}/login"> 로그인 </a> | <a href="${pageContext.request.contextPath}/signUp">
							회원가입 </a>
					</span>
					<%
					} else {
					%>
					<span> <a
						href="${pageContext.request.contextPath}/customer/myPage">
							${loggedInCustomer.customerMail} 님 </a> |<a href="logout"> 로그아웃 </a></span>
					<%
					}
					%>
					<%--        <span> <a href="login"> 로그인 </a> | <a href="signUp"> 회원가입 </a> </span>
	         <span> ${customerMail} 님 </span>  --%>
				</div>
				<div class="site-branding">
					<!-- <h1 class="site-title"><a href="index.html" rel="home">OOWOO</a></h1> -->
					<h1 class="site-title">
						<a href="${pageContext.request.contextPath}/hello" rel="home"><img
							src="${pageContext.request.contextPath}/images/logo.png"></a>
					</h1>
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
									<li>봄</li>
									<li>여름</li>
									<li>가을</li>
									<li>겨울</li>
								</ul></li>

							<li><a
								href="${pageContext.request.contextPath}/customer/searchGoods?categoryNo=2">액세서리</a>
								<ul class="sub-menu">
									<li>모자</li>
									<li>넥&레그 워머</li>
									<li>목걸이</li>
								</ul></li>
							<li><a
								href="${pageContext.request.contextPath}/customer/searchGoods?categoryNo=3">장난감</a>
								<ul class="sub-menu">
									<li>노즈워크</li>
									<li>오뚜기</li>
									<li>터그</li>
									<li>인형</li>
								</ul></li>
							<li><a
								href="${pageContext.request.contextPath}/customer/searchGoods?categoryNo=4">산책용품</a>
								<ul class="sub-menu">
									<li>목줄</li>
									<li>입마개</li>
									<li>리드줄</li>
									<li>하네스</li>
								</ul></li>
							<li><a
								href="${pageContext.request.contextPath}/customer/searchGoods?categoryNo=5">간식&영양제</a>
								<ul class="sub-menu">
									<li>육포</li>
									<li>비스킷</li>
									<li>비타민</li>
								</ul></li>
						</ul>
					</div>
				</nav>
			</header>
			<!-- #masthead -->
			<div id="content" class="site-content">
				<div id="primary" class="content-area column full">
					<main id="main" class="site-main" role="main">
						<div id="container">
							<div id="content" role="main">
								<nav class="woocommerce-breadcrumb" itemprop="breadcrumb">
									<a href="${pageContext.request.contextPath}/hello">Home</a> / <a
										href="#">${category.categoryTitle}</a>
								</nav>
								<div itemscope itemtype="http://schema.org/Product"
									class="product">
									<div class="images">
										<c:forEach var="file" items="${goodsFileList}">
											<img
												src="${pageContext.request.contextPath}/upload/${file.goodsFileName}.${file.goodsFileExt}"></img>
											</a>
										</c:forEach>
									</div>
									<div class="summary entry-summary">
										<h1 itemprop="name" class="product_title entry-title">${goods.goodsTitle}</h1>
										<div class="woocommerce-product-rating">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
											<c:if test="${boardCount == 0}"> (0 customer review)</c:if>
											<c:if test="${boardCount == 1}"> (1 customer review)</c:if>
											<c:if test="${boardCount > 1}">
												(<span itemprop="reviewCount" class="count"> ${boardCount}</span> customer reviews)
											</c:if>
										</div>
										<div itemprop="offers" itemscope
											itemtype="http://schema.org/Offer">
											<p class="price">
												<span class="amount"> &#8361; ${goods.goodsPrice}</span>
											</p>
											<meta itemprop="price" content="35" />
											<meta itemprop="priceCurrency" content="USD" />
											<link itemprop="availability"
												href="https://schema.org/InStock" />
										</div>
										<div itemprop="description">
											<p>${goods.goodsMemo}</p>
										</div>
										<form class="formCart" method="post"
											action="${pageContext.request.contextPath}/customer/addCart"
											enctype='multipart/form-data'>
											<div class="quantity">
												<span> 수량 </span><input type="number" step="1" min="1" max=""
													name="cartAmount" value="1" title="Qty"
													class="input-text qty text" size="4" />
												<button type="submit"
													class="single_add_to_cart_button button alt">Add to Cart</button>
											</div>
											<input type="hidden" name="customerMail"
												value="${loggedInCustomer.customerMail}"> <input
												type="hidden" name="goodsNo" value="${goods.goodsNo}">

										</form>
										<br>
										<button type="submit"
											class="single_add_to_cart_button button alt">Wish</button>
									</div>
									<!-- .summary -->
									<div class="woocommerce-tabs wc-tabs-wrapper">
										<div class="panel entry-content wc-tab" id="tab-reviews">
											<div id="reviews">
												<div id="comments">
													<h2>Reviews</h2>
													
													<c:forEach var="board" items="${boards}">
														<ol class="commentlist">
															<li itemprop="review" itemscope
																itemtype="http://schema.org/Review" class="comment">
																<div id="comment-3" class="comment_container">
																	<div class="comment-text">
																		<p class="meta">
																			<strong itemprop="author">${board.customerMail}</strong>
																			&ndash; <span>${board.createDate}</span> :
																		</p>
																		<div itemprop="description" class="description">
																			<p>${board.boardContent}</p>
																		</div>
																	</div>
																</div>
															</li>
														</ol>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
					</main>
					<!-- #main -->
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
	<script src='js/jquery.js'></script>
	<script src='js/plugins.js'></script>
	<script src='js/scripts.js'></script>
	<script src='js/masonry.pkgd.min.js'></script>
</body>
</html>