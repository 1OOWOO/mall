<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@page import="com.example.mall.vo.Customer"%>
<html lang="en-US">
<head>
<%@ page pageEncoding="UTF-8" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>카테고리 검색 | ${category.categoryTitle}</title>
<link rel='stylesheet' href='${pageContext.request.contextPath}/customer/customercss/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/customer/customercss/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/customer/customercss/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/customer/customercss/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/customer/customercss/easy-responsive-shortcodes.css' type='text/css' media='all'/>
</head>

<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">

<!--  확인용 주석  -->
<div id="page">
   <div class="container">
	   <header>
	      <!-- 로그인  -->
	      <div style="float: right;">
	      <%
	      	Customer loggedInCustomer = (Customer) session.getAttribute("loggedInCustomer");
	      		if ( loggedInCustomer == null) {
	      	%>
	      			<span> <a href="${pageContext.request.contextPath}/login"> 로그인 </a> | <a href="${pageContext.request.contextPath}/signUp"> 회원가입 </a> </span>
	      	<%
	      		} else {
	      			
	      	%>
	      	<span> ${loggedInCustomer.customerMail} 님 |<a href="logout"> 로그아웃 </a></span>
	      	
	      	<%
	      		}
	      	%>
	      	
	<%--        <span> <a href="login"> 로그인 </a> | <a href="signUp"> 회원가입 </a> </span>
	         <span> ${customerMail} 님 </span>  --%>
	      </div>
	      <div class="site-branding">
	         <!-- <h1 class="site-title"><a href="index.html" rel="home">OOWOO</a></h1> -->
	         <h1 class="site-title"><a href="${pageContext.request.contextPath}/hello" rel="home"><img src="${pageContext.request.contextPath}/images/logo.png"></a></h1>
	         <h2 class="site-description">모방은 창조의 어머니이다.</h2>
	      </div>
	      <nav id="site-navigation" class="main-navigation">
		      <button class="menu-toggle">Menu</button>
		      <a class="skip-link screen-reader-text" href="#content">Skip to content</a>
		      <div class="menu-menu-1-container">
		         <ul id="menu-menu-1" class="menu">
		            <li><a href="${pageContext.request.contextPath}/customer/searchGoods?categoryNo=1">계절별의류</a>
		            <ul class="sub-menu">
		               <li>봄</li>
		               <li>여름</li>
		               <li>가을</li>
		               <li>겨울</li>
		            </ul>
		            </li>
		            
		            <li><a href="${pageContext.request.contextPath}/customer/searchGoods?categoryNo=2">액세서리</a>
		            <ul class="sub-menu">
		               <li>모자</li>
		               <li>넥&레그 워머</li>
		               <li>목걸이</li>
		            </ul>
		            </li>
		            <li><a href="${pageContext.request.contextPath}/customer/searchGoods?categoryNo=3">장난감</a>
		            <ul class="sub-menu">
		               <li>노즈워크</li>
		               <li>오뚜기</li>
		               <li>터그</li>
		               <li>인형</li>
		            </ul>
		            </li>
		            <li><a href="${pageContext.request.contextPath}/customer/searchGoods?categoryNo=4">산책용품</a>
		            <ul class="sub-menu">
		               <li>목줄</li>
		               <li>입마개</li>
		               <li>리드줄</li>
		               <li>하네스</li>
		            </ul>
		            </li>
		            <li><a href="${pageContext.request.contextPath}/customer/searchGoods?categoryNo=5">간식&영양제</a>
		            <ul class="sub-menu">
		               <li>육포</li>
		               <li>비스킷</li>
		               <li>비타민</li>
		            </ul>
		            </li>
		         </ul>
		      </div>
	      </nav>
      </header>
      <!-- #masthead -->
      <div id="content" class="site-content">
         <div id="primary" class="content-area column full">
            <main id="main" class="site-main" role="main">
	            <p class="woocommerce-result-count">
	                ${categoryTitle} | Showing ${goodsCount} results
	            </p>
	            <form class="woocommerce-ordering" method="get">
	               <select name="orderby" class="orderby">
	                  <option value="menu_order" selected="selected">Default sorting</option>
	                  <option value="popularity">Sort by popularity</option>
	                  <option value="rating">Sort by average rating</option>
	                  <option value="date">Sort by newness</option>
	                  <option value="price">Sort by price: low to high</option>
	                  <option value="price-desc">Sort by price: high to low</option>
	               </select>
	            </form>
	            <ul class="products">
	            	<c:forEach var="g" items="${goodsList}">
		               <li class="product">
			               <a href="${pageContext.request.contextPath}/customer/customerGoodsOne?goodsNo=${g.goodsNo}">
				               <img src="http://s3.amazonaws.com/caymandemo/wp-content/uploads/sites/10/2015/09/10175658/j4-520x520.jpg" alt="">
				               <h3>${g.goodsTitle}</h3>
				               <span class="price"><span class="amount">${g.goodsPrice}</span></span>
			               </a>
		               </li>
					</c:forEach>
	            </ul>
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
         <h1 style="font-family: 'Herr Von Muellerhoff';color: #ccc;font-weight:300;text-align: center;margin-bottom:0;margin-top:0;line-height:1.4;font-size: 46px;">Moschino</h1>
         Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>

      </div>
   </div>
   </footer>
   <a href="#top" class="smoothup" title="Back to top"><span class="genericon genericon-collapse"></span></a>
</div>
<!-- #page -->
<script src='${pageContext.request.contextPath}/customer/customerjs/jquery.js'></script>
<script src='${pageContext.request.contextPath}/customer/customerjs/plugins.js'></script>
<script src='${pageContext.request.contextPath}/customer/customerjs/scripts.js'></script>
<script src='${pageContext.request.contextPath}/customer/customerjs/masonry.pkgd.min.js'></script>
<script>
	
</script>
</body>
</html>