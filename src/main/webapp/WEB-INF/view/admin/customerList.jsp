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
                <c:forEach var="c" items="${customerList}">
                    <tr>
	                    <td>
	                        <a href="${pageContext.request.contextPath}/admin/customerOne?customerMail=${c.customerMail}">${c.customerMail}</a>
	                    </td>
                        <td>${c.customerBirth}</td>
                        <td>${c.createDate}</td>
                    </tr>
                </c:forEach>
        </table>
        
        <!-- 페이징 -->
		<div>
			<c:if test="${currentPage > numPerPage}">
				<a href="${pageContext.request.contextPath}/admin/customerList?currentPage=${beginPagingNum - numPerPage}">이전</a>
			</c:if>
			<c:forEach var="num" begin="${beginPageNum}" end="${endPageNum}">
				<c:if test="${num==currentPage}">
					${num}&nbsp;
				</c:if>
				<c:if test="${num!=currentPage}">
				<a href="${pageContext.request.contextPath}/admin/customerList?currentPage=${num}">${num}</a>
				&nbsp;
				</c:if>
			</c:forEach>
					<c:if test="${currentPage < lastPage - numPerPage }">
						<a href="${pageContext.request.contextPath}/admin/customerList?currentPage=${beginPageNum + numPerPage}">다음</a>
					</c:if>
			</div>
		</div> 
    </div>
</body>
</html>