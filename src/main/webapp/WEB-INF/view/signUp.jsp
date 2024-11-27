<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mall - 회원가입</title>
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
    <div class="container mt-5">
        <h2>회원가입</h2>
        <form action="${pageContext.request.contextPath}/register" method="post">
            <div class="form-group">
                <label for="username">아이디 (이메일)</label>
                <input type="text" class="form-control" name="username" placeholder="아이디 (이메일)" required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" class="form-control" name="password" placeholder="비밀번호" required>
            </div>
            <div class="form-group">
                <label for="birthdate">생년월일</label>
                <input type="text" class="form-control" name="birthdate" placeholder="생년월일" required>
            </div>
            <div class="form-group">
                <label for="gender">성별</label>
                <select class="form-control" name="gender" required>
                    <option value="">성별 선택</option>
                    <option value="남">남</option>
                    <option value="여">여</option>
                </select>
            </div>
            <div class="form-group">
                <label for="address">주소</label>
                <div class="input-group">
                    <input type="text" class="form-control" name="address" id="selectedAddress" placeholder="주소를 검색하세요" readonly>
                    <div class="input-group-append">
                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#addressModal">주소 검색</button>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">회원가입</button>
        </form>
    </div>

    <!-- 모달창 -->
    <div class="modal fade" id="addressModal" tabindex="-1" role="dialog" aria-labelledby="addressModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addressModalLabel">주소 검색</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- 검색 폼 -->
                    <form id="addressSearchForm" method="post" action="${pageContext.request.contextPath}/signUp">
                        <input type="text" class="form-control" name="searchAddress" id="searchAddress" placeholder="주소 입력" required>
                        <button type="button" class="btn btn-primary mt-2" id="searchButton">검색</button>
                    </form>

                    <!-- 검색 결과 목록 --> 
                    <select id="resultAddress" size="5" class="form-control mt-2">
                        <c:forEach items="${addressList}" var="a">
                            <option value="${a.addressDetail}">${a.addressDetail}</option>
                        </c:forEach>
                    </select>
                    <button type="button" class="btn btn-success mt-2" id="btnAddrSel">주소 선택</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        // 검색 버튼 클릭 시 모달 창이 닫히지 않도록 처리
        document.getElementById('searchButton').addEventListener('click', function (event) {
            event.preventDefault();  // 기본 form 제출을 막기 위한 코드
            const searchAddress = document.getElementById('searchAddress').value;
            
            if (searchAddress.trim() === '') {
                alert('주소를 입력해주세요.');
                return;
            }

            // 서버로 데이터를 보내기 전에 form이 submit되지 않도록 처리
            const form = document.getElementById('addressSearchForm');
            form.submit(); // 검색 실행, 모달 창은 닫히지 않음
        });

        // 주소 선택 버튼 클릭 시 선택된 주소를 인풋 필드에 넣기
        document.getElementById('btnAddrSel').addEventListener('click', function () {
            const resultAddress = document.getElementById('resultAddress');
            const selectedOption = resultAddress.options[resultAddress.selectedIndex];

            if (selectedOption) {
                const selectedAddress = selectedOption.value; // 선택된 주소 값 가져오기
                document.getElementById('selectedAddress').value = selectedAddress;

                // 모달을 닫기
                $('#addressModal').modal('hide');
            } else {
                alert('주소를 선택하세요.');
            }
        });
    </script>
</body>
</html>
