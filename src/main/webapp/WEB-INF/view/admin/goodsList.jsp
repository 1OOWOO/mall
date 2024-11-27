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
<title>Goods List</title>
</head>
<!-- Author : 오아림 -->
<body>
	<h1>상품 목록</h1>
	<table>
		<tr>
			<td>No</td>
			<td>사진</td>
			<td>상품명</td>
			<td>가격</td>
		</tr>
		<c:forEach var="g" items="${goodsList}">
			<tr>
				<td>${g.goodsNo}</td>
				<td>
					<c:forEach var="gf" items="${goodsFileList}">
						<img src="${pageContext.request.contextPath}/upload/${gf.goodsFileName}.${gf.goodsFileExt}">
					</c:forEach>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/admin/goodsOne?goodsNo=${g.goodsNo}">
					${g.goodsTitle}</a>
				</td>
				<td>${g.goodsPrice}</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 페이징 -->
	<nav style="width: 100%; text-align: center;">
		<ul class="pagination justify-content-start" style="margin-right: 20%;">
			<c:if test="${currentPage > 10}">
				<li class="page-item"> <!-- 이전 10 페이지 -->
					<a class="page-link" href="${pageContext.request.contextPath}/admin/goodsList?goodsNo=${goodsNo}&urrentPage=${currentPage-10}"> 
					<span aria-hidden="true">&laquo;</span></a>
				</li>
			</c:if>
			<c:if test="${currentPage <= 10}"> <!-- 이전 10 페이지가 없으면 비활성화-->
				<li class="page-item disabled"> 
			      <span class="page-link">&laquo;</span>
			    </li>
			</c:if>
			
			<c:forEach var="num" begin="${startPagingNum}" end="${endPagingNum}">
				<c:if test="${num == currentPage}">
					<li class="page-item"><span class="page-link" style="font-weight:bold;">${num}</span></li>
				</c:if>
				<c:if test="${num != currentPage}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/admin/goodsList?goodsNo=${goodsNo}&currentPage=${num}">${num}</a>
					</li>
				</c:if>
			</c:forEach>
			
			<c:if test="${currentPage + 10 <= lastPage}">
			    <li class="page-item"> <!-- 다음 10 페이지 -->
			        <a class="page-link" href="${pageContext.request.contextPath}/admin/goodsList?goodsNo=${goodsNo}&currentPage=${currentPage + 10}" aria-label="Next">
			            <span aria-hidden="true">&raquo;</span>
			        </a>
			    </li>
			</c:if>
			<c:if test="${currentPage + 10 > lastPage}"> <!-- 다음 10 페이지가 없으면 비활성화-->
			    <li class="page-item disabled">
			        <span class="page-link">&raquo;</span>
			    </li>
			</c:if>
		</ul>
	</nav>
	
	<a href="${pageContext.request.contextPath}/admin/addGoods">상품 등록</a>
</body>
</html>