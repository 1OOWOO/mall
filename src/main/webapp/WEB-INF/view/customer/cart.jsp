<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>OOWOO | GoodsOne</title>
<link rel='stylesheet' href='${pageContext.request.contextPath}/customer/customercss/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/customer/customercss/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/customer/customercss/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/customer/customercss/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/customer/customercss/easy-responsive-shortcodes.css' type='text/css' media='all'/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<!-- Author : 오아림 -->
<body class="single single-product woocommerce woocommerce-page">
<div id="page">
	<div class="container">
		<header id="masthead" class="site-header">
			<div class="site-branding">
				<h1 class="site-title"><a href="${pageContext.request.contextPath}/hello" rel="home"><img src="${pageContext.request.contextPath}/images/logo.png"></a></h1>
				<h2 class="site-description">모방은 창조의 어머니이다</h2>
			</div>
			<nav id="site-navigation" class="main-navigation">
				<button class="menu-toggle">Menu</button>
				<a class="skip-link screen-reader-text" href="#content">Skip to content</a>
				<div class="menu-menu-1-container">
					<ul id="menu-menu-1" class="menu">
						<li><a href="${pageContext.request.contextPath}/hello">Home</a></li>
						<li><a href="shop.html">Shop</a></li>
						<li><a href="blog.html">Blog</a></li>
						<li><a href="elements.html">Elements</a></li>
						<li><a href="#">Pages</a>
							<ul class="sub-menu">
								<li><a href="portfolio-item.html">Portfolio Item</a></li>
								<li><a href="blog-single.html">Blog Article</a></li>
								<li><a href="shop-single.html">Shop Item</a></li>
								<li><a href="portfolio-category.html">Portfolio Category</a></li>
							</ul>
						</li>
						<li><a href="contact.html">Contact</a></li>
					</ul>
				</div>
			</nav>
		</header>
		<h3>장바구니</h3>
		<!-- #masthead -->
		<div id="content" class="site-content">
			<div id="primary" class="content-area column full">
				<main id="main" class="site-main" role="main">
				<div id="container" class="bg-light">
					<div id="content" role="main">
						<table class="table">
						<c:forEach var="c" items="${carts}">
							<tr>
								<td>
									<div class="row" >
									<c:if test="${goodsFileList!=null}">
									<c:forEach var="file" items="${goodsFileList}">
								         <img src="${pageContext.request.contextPath}/upload/${file.goodsFileName}.${file.goodsFileExt}" 
									        alt="${file.goodsFileName}" style="width: 300px; height: auto;">
								    </c:forEach>
								 </c:if>  
							    <c:if test="${empty goodsFileList}">
									<img src="${pageContext.request.contextPath}/upload/NoImage.png" style="width: 300px; height: auto;">
								</c:if>
										<div>
											<div>${c.goodsTitle}</div>
											<div>${c.cartAmount}개</div>
											<div>${c.goodsPrice}원</div>
										</div>
									</div>
								   </td>
						        </tr>
						    </c:forEach>
						</table>
									
								<div class="col-3">
								    <table class="table table-bordered mr-3 bg-light">
								        <tr>
								            <th class="text-center">총 금액</th>
								        </tr>
								        <tr>
								            <td>${cart[0].totalPrice}원</td> <!-- cart가 비어있지 않은 경우에 대한 처리가 필요합니다 -->
								        </tr>
								        <tr>
								            <td><button class="btn btn-main w-100" type="button" id="cartButton">결제</button></td>
								        </tr>
								    </table>
								</div>
								</td>
							</tr>
						</table>
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
			<h1 style="font-family: 'Herr Von Muellerhoff';color: #ccc;font-weight:300;text-align: center;margin-bottom:0;margin-top:0;line-height:1.4;font-size: 46px;">Moschino</h1>
			Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>

		</div>
	</div>
	</footer>
	<a href="#top" class="smoothup" title="Back to top"><span class="genericon genericon-collapse"></span></a>
</div>
<!-- #page -->
<script src='js/jquery.js'></script>
<script src='js/plugins.js'></script>
<script src='js/scripts.js'></script>
<script src='js/masonry.pkgd.min.js'></script>
</body>
</html>