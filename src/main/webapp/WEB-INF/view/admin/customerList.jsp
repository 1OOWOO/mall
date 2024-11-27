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
</head>
<body>
<!-- Author : 오자윤 -->
       <title>회원 관리</title>
</head>
<body>
    <div class="container">
        <h1>회원 관리</h1>
        
        <!-- 이메일 검색 폼 -->
        <form action="/admin/customerList" method="get">
            <div class="input-group">
                <input type="text" id="searchEmail" name="searchEmail" class="form-control" placeholder="이메일 검색" value="${searchEmail}">
                <button type="submit" class="btn btn-primary">검색</button>
            </div>
        </form>
        
        <table class="table table-bordered">
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
	                    <td>
	                        <a href="${pageContext.request.contextPath}/admin/customerOne?customerMail=${customer.customerMail}">${customer.customerMail}</a>
	                    </td>
                        <td>${customer.customerBirth}</td>
                        <td>${customer.createDate}</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty customers}">
                    <tr>
                        <td colspan="3" class="text-center">검색된 결과가 없습니다.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
        
        <!-- 페이징 UI -->
	     <nav>
            <ul class="pagination justify-content-center">
                <li class="page-item <c:if test="${currentPage == 0}">disabled</c:if>">
                    <a class="page-link" href="?page=${currentPage - 1}&size=${size}&searchEmail=${searchEmail}">이전</a>
                </li>
                <c:forEach var="i" begin="0" end="${totalPages - 1}">
                    <li class="page-item <c:if test="${i == currentPage}">active</c:if>">
                        <a class="page-link" href="?page=${i}&size=${size}&searchEmail=${searchEmail}">${i + 1}</a>
                    </li>
                </c:forEach>
                <li class="page-item <c:if test="${currentPage == totalPages - 1}">disabled</c:if>">
                    <a class="page-link" href="?page=${currentPage + 1}&size=${size}&searchEmail=${searchEmail}">다음</a>
                </li>

		    </ul>
	</nav>
    </div>
</body>
</html>