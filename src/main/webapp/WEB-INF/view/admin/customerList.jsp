<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원 관리</title>
</head>
<body>
      <div>
         <!-- leftMenu.jsp 삽입 -->
         <c:import url="/WEB-INF/view/admin/leftMenu.jsp"></c:import>
      </div>
      <div id="wrapper">
    <div id="page-inner">
    	<div id="page-wrapper">
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
		</div>
    </div>
</body>
</html>