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
					<span> <a href="login"> 로그인 </a> | <a href="signUp">
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
										<div class="woocommerce-product-rating"
											itemprop="aggregateRating" itemscope
											itemtype="http://schema.org/AggregateRating">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <a href="#reviews"
												class="woocommerce-review-link" rel="nofollow">(<span
												itemprop="reviewCount" class="count">2</span> customer
												reviews)
											</a>
											<!-- 리뷰개수 -->
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
												<input type="number" step="1" min="1" max=""
													name="cartAmount" value="1" title="Qty"
													class="input-text qty text" size="4" />
											</div>
											<input type="hidden" name="customerMail"
												value="${loggedInCustomer.customerMail}"> <input
												type="hidden" name="goodsNo" value="${goods.goodsNo}">
											<button type="submit"
												class="single_add_to_cart_button button alt">Add to
												Cart</button>
										</form>

										<!-- 재고 없으면 Buy버튼 비활성화 -->
										${goods.goodsState}<br>
										<c:if test="${goods.goodsState == '재고없음'}">
											<button type="submit"
												class="single_add_to_cart_button button alt" disabled>Buy</button>
										</c:if>
										<c:if test="${goods.goodsState != '재고없음'}">
											<button type="submit"
												class="single_add_to_cart_button button alt">Buy</button>
										</c:if>

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
																			&ndash; <span>${board.createDate}</span>
																			:
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
						style="font-family: 'Herr Von Muellerhoff'; color: #ccc; font-weight: 300; text-align: center; margin-bottom: 0; margin-top: 0; line-height: 1.4; font-size: 46px;">Moschino</h1>
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