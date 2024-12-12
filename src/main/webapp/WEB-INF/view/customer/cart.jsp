<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.example.mall.vo.Customer" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OOWOO | GoodsOne</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/customer/customercss/woocommerce-layout.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/customer/customercss/woocommerce-smallscreen.css" type="text/css" media="only screen and (max-width: 768px)"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/customer/customercss/woocommerce.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/customer/customercss/font-awesome.min.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700" type="text/css" media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/customer/customercss/easy-responsive-shortcodes.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }
        #page {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .container {
            flex: 1;
            display: flex;
            flex-direction: column;
            padding: 20px;
        }
    </style>
</head>
<body class="single single-product woocommerce woocommerce-page">
<div id="page">
    <div class="container">
        <!-- Header -->
        <header id="masthead" class="site-header">
            <!-- 로그인 -->
            <div style="float: right;">
                <% 
                Customer loggedInCustomer = (Customer) session.getAttribute("loggedInCustomer");
                if (loggedInCustomer == null) { 
                %>
                <span>
                    <a href="login">로그인</a> | <a href="signUp">회원가입</a>
                </span>
                <% } else { %>
                <span>
                    <a href="${pageContext.request.contextPath}/customer/myPage">${loggedInCustomer.customerMail} 님</a> | 
                    <a href="logout">로그아웃</a>
                </span>
                <% } %>
            </div>
            <div class="site-branding">
                <h1 class="site-title">
                    <a href="${pageContext.request.contextPath}/hello" rel="home">
                        <img src="${pageContext.request.contextPath}/images/logo.png">
                    </a>
                </h1>
            </div>
            <nav id="site-navigation" class="main-navigation">
                <button class="menu-toggle">Menu</button>
                <a class="skip-link screen-reader-text" href="#content">Skip to content</a>
                <div class="menu-menu-1-container">
                    <ul id="menu-menu-1" class="menu">
                        <li>
                            <a href="${pageContext.request.contextPath}/customer/searchGoods?categoryNo=1">계절별의류</a>
                            <ul class="sub-menu">
                                <li>봄</li>
                                <li>여름</li>
                                <li>가을</li>
                                <li>겨울</li>
                            </ul>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/customer/searchGoods?categoryNo=2">액세서리</a>
                            <ul class="sub-menu">
                                <li>모자</li>
                                <li>넥&레그 워머</li>
                                <li>목걸이</li>
                            </ul>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/customer/searchGoods?categoryNo=3">장난감</a>
                            <ul class="sub-menu">
                                <li>노즈워크</li>
                                <li>오뚜기</li>
                                <li>터그</li>
                                <li>인형</li>
                            </ul>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/customer/searchGoods?categoryNo=4">산책용품</a>
                            <ul class="sub-menu">
                                <li>목줄</li>
                                <li>입마개</li>
                                <li>리드줄</li>
                                <li>하네스</li>
                            </ul>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/customer/searchGoods?categoryNo=5">간식&영양제</a>
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

        <!-- Main Content -->
        <h3>장바구니</h3>
        <div id="content" class="site-content">
            <div id="primary" class="content-area column full">
                <main id="main" class="site-main" role="main">
                    <div id="container" class="bg-light">
                        <form action="${pageContext.request.contextPath}/customer/addPayment" method="post">
                            <label for="addressNo">주소 선택:</label>
                            <select name="addressNo" id="addressNo" required>
                                <c:forEach var="address" items="${addressList}">
                                    <option value="${address.addressNo}">${address.addressDetail}</option>
                                </c:forEach>
                            </select>
                              <div>
		                        <label>결제 방법:</label>
		                        <input type="radio" id="paymentCard" name="paymentMethod" value="카드" required>
		                        <label for="paymentCard">카드</label>
		                        <input type="radio" id="paymentPay" name="paymentMethod" value="페이" required>
		                        <label for="paymentPay">페이</label>
		                     </div>
                            <table class="table">
                                <tr>
                                    <th></th>
                                    <th>상품명</th>
                                    <th>수량</th>
                                    <th>금액</th>
                                    <th>총 가격</th>
                                    <th>삭제</th>
                                </tr>
                                <c:forEach var="c" items="${cartList}">
                          		  <input type="hidden" name="cartNo" value="${c.cartNo}"/>
                                    <tr>
                                        <td><img src="${pageContext.request.contextPath}/upload/${c.goodsFileName}.${c.goodsFileExt}" style="width:150px; height:150px;"></td>
                                        <td>${c.goodsTitle}</td>
                                        <td>${c.cartAmount}개</td>
                                        <td>${c.goodsPrice}원</td>
                                        <td>${c.goodsTotalPrice}원</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/customer/deleteCart?cartNo=${c.cartNo}" class="btn btn-main w-100">삭제</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <div class="col-3">
							    <table class="table table-bordered mr-3 bg-light">
							        <tr>
							            <th class="text-center">총 합계</th>
							        </tr>
							        <c:if test="${cartList.isEmpty()}">
							            <tr>
							                <td>0원</td>
							            </tr>
							        </c:if>
							        <c:if test="${!cartList.isEmpty()}">
							            <tr>
							                <td>${cartList[0].totalPrice}원</td>
							                <input type="hidden" name="paymentPrice" value="${cartList[0].totalPrice}"/> <!--Payment 값으로 넘기기 -->
							            </tr>
							        </c:if>
							    </table>
							    <button type="submit">결제</button>
							</div>
                            </table>
                        </form>
                    </div>
                </main>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer id="colophon" class="site-footer">
        <div class="container">
            <div class="site-info">
                <h1 style="font-family: 'Herr Von Muellerhoff'; color: #ccc; font-weight: 300; text-align: center; margin: 0; line-height: 1.4; font-size: 46px;">Moschino</h1>
                Shared by <i class="fa fa-love"></i> <a href="https://bootstrapthemes.co">BootstrapThemes</a>
            </div>
        </div>
    </footer>
</div>

<script src="js/jquery.js"></script>
<script src="js/plugins.js"></script>
<script src="js/scripts.js"></script>
<script src="js/masonry.pkgd.min.js"></script>
<script>
    $('#cartButton').click(function() {
        if ($('input[name="goodsChoice"]:checked').length === 0) {
            alert('상품을 선택해주세요.');
        } else {
            $('#cartForm').submit();
        }
    });
</script>
</body>
</html>
