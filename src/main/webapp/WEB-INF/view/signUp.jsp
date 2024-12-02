<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container mt-5">
        <h2>회원가입</h2>
         <div class="form-group">
                <label for="searchAddress">주소 검색</label>
                <form action="${pageContext.request.contextPath}/signUp" method="get">
                    <div class="input-group">
                        <input type="text" class="form-control" name="searchAddress" placeholder="주소를 입력하세요" required>
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-info">검색</button>
                        </div>
                    </div>
                </form>
            </div>

            <!-- 검색 결과를 보여줄 DIV -->
            <div id="addressSearchResults" class="mt-3">
                <h4>검색 결과</h4>
                <select id="resultAddress" size="5" class="form-control">
                    <c:forEach items="${addressList}" var="a">
                        <option value="${a.addressDetail}">${a.addressDetail}</option>
                    </c:forEach>
                </select>
                <button type="button" class="btn btn-success mt-2" id="btnAddrSel">주소 선택</button>
            </div>

            <div class="form-group">
                <label for="selectedAddress">선택된 주소</label>
                <input type="text" class="form-control" name="selectedAddress" id="selectedAddress" readonly>
            </div>
            
        <form action="${pageContext.request.contextPath}/signUp" method="post">
            <div class="form-group">
                <label for="customerMail">아이디 (이메일)</label>
                <input type="email" class="form-control" name="customerMail" placeholder="아이디 (이메일)" required>
            </div>
            <div class="form-group">
                <label for="customerPw">비밀번호</label>
                <input type="password" class="form-control" name="customerPw" placeholder="비밀번호" required>
            </div>
            <div class="form-group">
                <label for="customerBirth">생년월일</label>
                <input type="date" class="form-control" name="customerBirth" required>
            </div>
            <div class="form-group">
                <label for="customerGender">성별</label>
                <select class="form-control" name="customerGender" required>
                    <option value="">성별 선택</option>
                    <option value="남자">남</option>
                    <option value="여자">여</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">회원가입</button>
        </form>
    </div>

    <script>
        // 주소 선택 버튼 클릭 시 선택된 주소를 입력 필드에 추가
        document.getElementById('btnAddrSel').onclick = function () {
            const selectedOption = document.getElementById('resultAddress').value;
            if (selectedOption) {
                document.getElementById('selectedAddress').value = selectedOption;
            } else {
                alert('주소를 선택하세요.');
            }
        };
    </script>
</body>
</html>
