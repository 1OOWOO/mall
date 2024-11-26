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
    <title>회원 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>회원 관리</h1>
        <table class="table">
            <thead>
                <tr>
                    <th>이메일</th>
                    <th>생년월일</th>
                    <th>가입날짜</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="customer" items="${customers}">
                    <tr>
                        <td>${customer.customerMail}</td>
                        <td>${customer.customerBirth}</td>
                        <td>${customer.createDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <!-- 페이징 작업. -->
          <nav>
            <ul class="page">
           		 	<!-- 페이지 번호를 생성하는 반복문 -->
                <c:forEach var="i" begin="0" end="${totalPages - 1}">
                	<!-- 현재 페이지와 반복되는 페이지 번호가 같으면, 'active'클래스 추가. -->
                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                    <!-- 페이지 링크 : 클릭 시 해당 페이지로 이동. -->
                        <a class="page-link" href="?page=${i}&size=${size}">${i + 1}</a>
                    </li>
                </c:forEach>
            </ul>
        </nav>
    </div>
</body>
</html>
