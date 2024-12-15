<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mall - 로그인</title>
    <!-- Bootstrap CSS for modal -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            display: flex; 
            justify-content: center; 
            align-items: center; 
            height: 100vh;
            margin: 0;
            background-color: white;
        }
        .login-container {
            width: 100%; 
            max-width: 400px; 
            padding: 20px; 
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); 
            border-radius: 8px; 
            background-color: white; 
        }
    </style>
</head>
<body>
    <div class="login-container"> 
        <h2 class="text-center">로그인</h2>

        <!-- 로그인 실패 메시지 -->
        <script type="text/javascript">
            <c:if test="${not empty message}">
                alert("${message}"); // 모델에서 전달된 메시지를 alert 창으로 띄우기
                window.location.href = "admin/dashBoard";
            </c:if>
        </script>

        <!-- 로그인 실패 메시지 -->
        <c:if test="${not empty message}">
            <div class="alert alert-danger">${message}</div> <!-- 로그인 실패 메시지 출력 -->
        </c:if>

        <!-- 로그인 상태 확인 -->
        <c:if test="${not empty loggedInStaff}">
            <p>${loggedInStaff.staffId}님 환영합니다!</p> <!-- 로그인된 사용자 ID 출력 -->
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-secondary">로그아웃</a>
        </c:if>
        <c:if test="${empty loggedInStaff}">
            <!-- 로그인 폼 -->
            <form action="${pageContext.request.contextPath}/admin/staffLogin" method="post">
                <div class="form-group">
                    <label for="staffId">아이디 (이메일)</label>
                    <input type="text" class="form-control" name="staffId" placeholder="아이디" required>
                </div>
                <div class="form-group">
                    <label for="staffPw">비밀번호</label>
                    <input type="password" class="form-control" name="staffPw" placeholder="비밀번호" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">로그인</button>
            </form>
        </c:if>
    </div>
</body>
</html>
