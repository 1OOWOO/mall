<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.example.mall.vo.Customer" %>
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
<style>

    html, body {
        height: 100%; /* 전체 높이를 100%로 설정 */
        margin: 0; /* 기본 여백 제거 */
        display: flex;
        flex-direction: column; /* 수직 방향으로 정렬 */
    }

    #page {
        flex: 1; /* 페이지 내용이 남은 공간을 차지하도록 설정 */
        display: flex;
        flex-direction: column;
        justify-content: space-between; /* 내용과 footer 간의 공간을 분배 */
    }

    .container {
        flex: 1; /* 컨테이너가 전체 높이를 차지하도록 설정 */
        display: flex;
        flex-direction: column; /* 수직 방향으로 정렬 */
        padding: 20px; /* 패딩 추가 */
    }

</style>
</head>
<!-- Author : 오자윤 -->
<body class="single single-product woocommerce woocommerce-page">
<div id="page">
    <div class="container">
        <header id="masthead" class="site-header">
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
				</div>
            <div class="site-branding">
                <h1 class="site-title"><a href="${pageContext.request.contextPath}/hello" rel="home"><img src="${pageContext.request.contextPath}/images/logo.png"></a></h1>
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
            <style>
				 html, body {
				    height: 100%; /* 전체 높이를 100%로 설정 */
				    margin: 0; /* 기본 여백 제거 */
				    display: flex;
				    flex-direction: column; /* 수직 방향으로 정렬 */
				}
			
				#page {
				    flex: 1; /* 페이지 내용이 남은 공간을 차지하도록 설정 */
				}
            </style>
        </header>
        
		<h3>장바구니</h3>
		<!-- #masthead -->
		<div id="content" class="site-content">
			<div id="primary" class="content-area column full">
				<main id="main" class="site-main" role="main">
				<div id="container" class="bg-light">
					<div id="content" role="main"> 
						<table class="table">
					
						<c:if test="${carts.isEmpty()}">
			        		<tr>
			        			<td colspan="7" class="text-center">상품이 비었습니다.</td>
			        		</tr>
			        	</c:if>
							<tr>
								<th></th>
								<th>상품명</th>
								<th>수량</th>
								<th>금액</th>
								<th>총 가격</th>
								<th>삭제</th>
							</tr>
							<c:forEach var="c" items="${cartList}">
								<tr><!-- payment 에 cartNo 값 넘겨주기 -->
									<td><img src="${pageContext.request.contextPath}/upload/${c.goodsFileName}.${c.goodsFileExt}" style="width:200px; height:200px;"></td>
									<td>${c.goodsTitle}</td>
									<td>${c.cartAmount}개</td>
									<td>${c.goodsPrice}원</td>
									<td>${c.goodsTotalPrice}원</td>
									<td><a href="${pageContext.request.contextPath}/customer/deleteCart?cartNo=${c.cartNo}" class="btn btn-main w-100">삭제</a></td>
								</tr>
							
						    </c:forEach>
							</table>							
								<div class="col-3">
								    <table class="table table-bordered mr-3 bg-light">
								           <tr>
								            	<th class="text center">총 합계</th> 
								            </tr>
								            <c:if test="${cart.isEmpty()}">
								           <tr>
								            	<td>0원</td> <!-- cart가 비어있지 않은 경우에 대한 처리가 필요합니다 -->
								            </tr>
								            </c:if>
								            <c:if test="${!cart.isEmpty()}">
								           <tr>
								            	<td>${cartList[0].totalPrice}원</td> 
								            </tr>
								            </c:if>
								            <td><a href="${pageContext.request.contextPath}/customer/paymentList"class="btn btn-main w-100" >결제</a></td>
								        </tr>
								    </table>
								</div>
							</td>
							</tr>
						</table>
					</div>
				</div>
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
</div>

<a href="#top" class="smoothup" title="Back to top"><span class="genericon genericon-collapse"></span></a>
</body>
</html>


<!-- #page -->
<script src='js/jquery.js'></script>
<script src='js/plugins.js'></script>
<script src='js/scripts.js'></script>
<script src='js/masonry.pkgd.min.js'></script>
<script>
	// 체크박스 하나라도 안 했을 시 경고 메시지.
	$('#cartButton').click(function() {
		if ($('input[name="goodsChoice"]:checked').length === 0) {
			alert('상품을 선택해주세요.');
		} else {
			console.log(goodsChoice);
			$('#cartForm').submit();
		}
	});
</script>
</body>
</html>