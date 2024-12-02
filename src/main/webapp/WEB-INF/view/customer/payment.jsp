<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
    <title>결제 페이지</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/styles.css'/>">
</head>
<body>
	<h2>결제 정보 입력</h2>

<form action="<c:url value='/processPayment'/>" method="post">
    <div>
        <label for="customerMail">이메일:</label>
        <input type="email" id="customerMail" name="customerMail" required>
    </div>
    
	<div>
	    <label>결제 수단:</label>
	    <label>
	        <input type="radio" value="신용카드" name="paymentMethod" required> 신용카드
	    </label>
	    <label>
	        <input type="radio" value="체크카드" name="paymentMethod" required> 체크카드
	    </label>
	</div>
    
    <div>
        <label for="amount">결제 금액:</label>
        <input type="number" id="amount" name="amount">
    </div>

    <div>
        <label for="notes">배송 요청사항:</label>
        <textarea id="notes" name="notes"></textarea>
    </div>
    
    <div>
        <button type="submit">결제하기</button>
    </div>

    <c:if test="${not empty message}">
        <div class="alert">${message}</div>
    </c:if>
</form>

</body>
</html>
