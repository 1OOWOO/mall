<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <h2>장바구니</h2>
        <div class="cart-items">
            <!-- 장바구니 항목 반복문 -->
            <c:forEach var="c" items="${carts}">
                <div class="cart-item">
                    <input type="checkbox" >
                    <img src="" alt="상품 이미지">
                    <div class="item-details">
                        <p>${c.goodsTitle}</p>
                        <p>재고: ${c.cartAmount}</p>
                        <p>금액: ${c.goodsPrice}원</p>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="order-summary">
            <h3>주문 예상금액</h3>
            <p>상품 가격: <span id="total-price">${totalPrice}원</span></p>
            <p>총 배송비: <span id="shipping-fee">2,500원</span></p>
            <p>총 결제금액: <span id="total-amount">${totalAmount}원</span></p>
            <button onclick="location.href='/checkout'">구매</button>
        </div>
</body>
</html>