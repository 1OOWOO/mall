<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<link rel='stylesheet' href='css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
    <meta charset="UTF-8">
<title>회원관리 상세정보</title>
</head>
<body>
    <div class="container">
        <h1>회원 관리</h1>
        
        <div class="customer-info">
            <h2>회원 상세 정보</h2>
            <p><strong>이메일:</strong> ${customer.customerMail}</p>
            <p><strong>비밀번호:</strong> ${customer.customerPw}</p>
            <p><strong>생년월일:</strong> ${customer.customerBirth}</p>
            <p><strong>성별:</strong> ${customer.customerGender}</p>
            <p><strong>가입날짜:</strong> ${customer.createDate}</p>
            <p><strong>Last Update:</strong> ${customer.updateDate}</p>
        </div>

        <form action="/admin/deleteCustomer" method="post">
            <input type="hidden" name="customerMail" value="${customer.customerMail}"/>
            <button type="submit" class="btn btn-danger">회원탈퇴</button>
        </form>

        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <a href="/admin/customerList" class="btn btn-secondary">목록으로 돌아가기</a>
    </div>
</body>
</html>