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
         <script type="text/javascript">
            <c:if test="${not empty message}">
                alert("${message}"); // 모델에서 전달된 메시지를 alert 창으로 띄우기
                window.location.href = "/hello"; // 회원가입 완료 후 메인 페이지로 리다이렉트
            </c:if>
        </script>
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
                <input type="date" class="form-control" name="customerBirth" placeholder="생년월일" required>
            </div>
            <div class="form-group">
                <label for="customerGender">성별</label>
                <select class="form-control" name="customerGender" required>
                    <option value="">성별 선택</option>
                    <option value="남자">남</option>
                    <option value="여자">여</option>
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
                    <button type="button" class="close" aria-label="Close">
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
        $('#searchButton').on('click', function (e) {
            e.preventDefault(); // 기본 form 제출 방지
            const searchAddress = $('#searchAddress').val().trim();

            if (searchAddress === '') {
                alert('주소를 입력해주세요.');
                return;
            }

            $('#addressSearchForm').submit(); // 폼 제출 실행
        });

        // 주소 선택 버튼 클릭 시 선택된 주소를 인풋 필드에 넣기
        $('#btnAddrSel').on('click', function () {
            const selectedOption = $('#resultAddress option:selected');

            if (selectedOption.length) {
                const selectedAddress = selectedOption.val(); // 선택된 주소 값 가져오기
                $('#selectedAddress').val(selectedAddress); // 주소 필드에 값 채우기
                $('#addressModal').modal('hide'); // 모달 닫기
            } else {
                alert('주소를 선택하세요.');
            }
        });
    </script>
</body>
</html>
