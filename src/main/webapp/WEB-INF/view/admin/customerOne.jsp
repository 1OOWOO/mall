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
   <!-- Author : 오자윤 -->
    
<title>회원관리 상세정보</title>
</head>
<body class="container-flud">
   <div class="row">
      <div class="col-sm-2 bg-light">
         <!-- leftMenu.jsp 삽입 -->
         <c:import url="/WEB-INF/view/admin/leftMenu.jsp"></c:import>
      </div>
     <div class="col-sm-10">
     
       <title>회원관리 상세정보</title>
</head>
<body>
    <div class="container">
        <h1>회원 관리</h1>
        
        <div class="customer-info">
            <h2 class="mt-4">회원 상세 정보</h2>
            <table class="table table-bordered">
                <thead class="thead-light">
                    <tr>
                        <th>항목</th>
                        <th>정보</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><strong>이메일:</strong></td>
                        <td>${customer.customerMail}</td>
                    </tr>
                    <tr>
                        <td><strong>비밀번호:</strong></td>
                        <td>${customer.customerPw}</td>
                    </tr>
                    <tr>
                        <td><strong>생년월일:</strong></td>
                        <td>${customer.customerBirth}</td>
                    </tr>
                    <tr>
                        <td><strong>성별:</strong></td>
                        <td>${customer.customerGender}</td>
                    </tr>
                    <tr>
                        <td><strong>가입날짜:</strong></td>
                        <td>${customer.createDate}</td>
                    </tr>
                    <tr>
                        <td><strong>최근 수정일:</strong></td>
                        <td>${customer.updateDate}</td>
                    </tr>
                </tbody>
            </table>
        </div>

		    <form action="${pageContext.request.contextPath}/admin/deleteCustomer?customerMail=${c.customerMail}&currentPage=${currentPage}">
		        <button type="submit" class="btn btn-danger">회원탈퇴</button>
		    </form>

        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <a href="${pageContextPath.request.contextPath}/admin/customerList" class="btn btn-secondary">목록으로 돌아가기</a>
    </div>
</body>
</html>