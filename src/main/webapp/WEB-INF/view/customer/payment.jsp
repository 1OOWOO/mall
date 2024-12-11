<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <header id="masthead" class="site-header">
            <a>
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
				</a>
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
            </header>

            <h2>결제 정보</h2>
            <form action="${pageContext.request.contextPath}/customer/addPayment" method="post">
                <table class="table">
					<c:if test="${not empty addressList}">
					    <c:if test="${not empty addressList[0].addressNo}">
					        <tr>
					            <th>상세 주소</th>
					            <td>${addressList[0].addressDetail}</td>
					            <!-- 주소값 addPayment 넘기기 -->
					          <td><input type="hidden" name="addressNo" value="${addressList[0].addressNo}"></td>
					        </tr>
					    </c:if>
					</c:if>
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
                    </tr>
                    <c:forEach var="c" items="${cartList}">
                        <tr>
                            <td><img src="${pageContext.request.contextPath}/upload/${c.goodsFileName}.${c.goodsFileExt}" style="width:200px; height:200px;"></td>
                            <td>${c.goodsTitle}</td>
                            <td>${c.cartAmount}개</td>
                            <td>${c.goodsPrice}원</td>
                            <!-- cartNo 값 addPayment 넘기기 -->
                            <td><input type="hidden" name="cartNo" value="${c.cartNo}"></td>
                        </tr>
                    </c:forEach>
                    <th>결제수단</th>
                    <td>
                        <input type="radio" name="paymentMethod" value="카드" id="payCard" checked>
                        <label for="payCard" class="ms-1">카드</label>
                        <div>
                            <input type="radio" name="paymentMethod" value="페이" id="payPay">
                            <label for="payPay" class="ms-1">페이</label>
                        </div>
                    </td>
                    <div class="col-3">
                        <table class="table table-bordered mr-3 bg-light">
                            <c:if test="${cart.isEmpty()}">
                                <tr>
                                    <td>0원</td>
                                </tr>
                            </c:if>
                            <c:if test="${!cart.isEmpty()}">
                                <tr>
                                    <td>총합계 : ${cartList[0].totalPrice}원</td>
                                    <!-- 결제금액 addPayment 값 넘기기 -->
                                   <td><input type="hidden" name="paymentPrice" value="${cartList[0].totalPrice}"></td>
                                </tr>
                            </c:if>
                            <td><a href="${pageContext.request.contextPath}/customer/myPage" class="btn btn-primary">결제</a></td>
                        </table>
                    </div>
                </form>
            </div>

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
