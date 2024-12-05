<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mall - 로그인</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel='stylesheet' href='css/woocommerce-layout.css' type='text/css' media='all'/>
    <link rel='stylesheet' href='css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
    <link rel='stylesheet' href='css/woocommerce.css' type='text/css' media='all'/>
    <link rel='stylesheet' href='css/font-awesome.min.css' type='text/css' media='all'/>
    <link rel='stylesheet' href='style.css' type='text/css' media='all'/>
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
    <link rel='stylesheet' href='css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
    <!-- Bootstrap CSS for modal -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5" style="width:50%">
        <h2>로그인</h2>

        <!-- 로그인 실패 메시지 -->
        <script type="text/javascript">
            <c:if test="${not empty message}">
                alert("${message}"); // 모델에서 전달된 메시지를 alert 창으로 띄우기
                window.location.href = "/hello"; // 회원가입 완료 후 메인 페이지로 리다이렉트
            </c:if>
        </script>

        <!-- 로그인 상태 확인 -->
        <c:if test="${not empty loggedInCustomer}">
            <p>${loggedInCustomer.customerMail}님 환영합니다!</p> <!-- 로그인된 사용자 ID 출력 -->
            <a href="/logout" class="btn btn-secondary">로그아웃</a>
        </c:if>
        <c:if test="${empty loggedInCustomer}">
            <!-- 로그인 폼 -->
            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="form-group">
                    <label for="customerMail">아이디 (이메일)</label>
                    <input type="email" class="form-control" name="customerMail" placeholder="아이디 (이메일)" required>
                </div>
                <div class="form-group">
                    <label for="customerPw">비밀번호</label>
                    <input type="password" class="form-control" name="customerPw" placeholder="비밀번호" required>
                </div>
                <div class="text-center">
               		<button type="submit" class="btn btn-primary" style="width: 30%;">로그인</button>
                </div>
            </form>
            <div class="text-center"><br>
                <a href="${pageContext.request.contextPath}/signUp" class="btn btn btn-outline-dark">회원가입</a>
                <a href="${pageContext.request.contextPath}/findPw" class="btn btn btn-outline-dark">비밀번호 찾기</a>
            </div>
            <div style="display: flex; margin: 20px 0;  align-items: center; justify-content: center;"><br>
            	<i class="material-icons dp48">assignment_ind</i>
            	<a href="${pageContext.request.contextPath}/admin/staffLogin" class="btn">관리자 로그인</a>
            </div>
        </c:if>
    </div>
</body>
</html>