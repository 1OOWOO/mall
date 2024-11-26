<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Moschino | Minimalist Free HTML Portfolio by WowThemes.net</title>
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
    <div class="container">
        <!-- 모달: 주소 검색 -->
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
                        <form id="formAddress" action="${pageContext.request.contextPath}/on/addStaff" method="get" style="display: flex;">
                            <input type="text" name="searchAddress" id="searchAddress" style="margin-right: 10px;" placeholder="주소를 입력하세요">
                            <button type="button" id="btnAddress" class="btn btn-primary">주소 검색</button>
                        </form>
                        <h4>주소를 선택하세요</h4>
                        <select id="resultAddress" size="10" style="width: 100%;">
                            <c:forEach items="${addressList}" var="a">
                                <option value="${a.addressId}" data-address="${a.address}"> 
                                    (ADDRESS ID : ${a.addressId}) ${a.address}
                                </option>
                            </c:forEach>
                        </select>
                        <br>
                        <button type="button" id="btnAddrSel" class="btn btn-success mt-2">주소 선택</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 회원가입 폼 -->
        <div style="padding: 0 30%;" id="signUp" style="display: none;">
            <h2>회원가입</h2>                  
            <h4>회원정보를 입력해 주세요.</h4>
            <form class="wpcf7" method="post" action="contact.php" id="contactform">
                <div class="form">
                    <p><input type="text" name="name" placeholder="아이디 (이메일) *"></p>
                    <p><input type="password" name="password" placeholder="비밀번호 *"></p>
                    <p><input type="password" name="confirmPassword" placeholder="비밀번호 확인 *"></p>
                    <p><input type="text" name="birthdate" placeholder="생년월일 *"></p>
                    <p>
                        <select name="gender">
                            <option>성별</option>
                            <option>남</option>
                            <option>여</option>
                        </select>
                    </p>
                    <p><input type="text" name="address" id="selectedAddress" placeholder="주소 *" readonly></p>
                    <input type="submit" id="submit" class="clearfix btn" value="Send">
                </div>
            </form>
            <div class="done">                        
                Your message has been sent. Thank you!
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

 <script>
    // 페이지 로드 시 모달 열기
    $(document).ready(function() {
        $('#addressModal').modal('show');
    });

    // 주소 검색 버튼 클릭 시 동작
    document.getElementById('btnAddress').addEventListener('click', function() {
        const searchAddress = document.getElementById('searchAddress').value;
        if (searchAddress.trim() === "") {
            alert('주소를 입력하세요.');
            return;
        }

        // AJAX 요청을 통해 주소 검색
        $.ajax({
            url: '${pageContext.request.contextPath}/on/searchAddress', // 검색 API 경로
            method: 'GET',
            data: { searchAddress: searchAddress },
            success: function(response) {
                // 주소 리스트를 갱신
                const resultAddress = document.getElementById('resultAddress');
                resultAddress.innerHTML = ""; // 기존 옵션 제거

                // 새로운 주소 목록 추가
                response.forEach(function(address) {
                    const option = document.createElement('option');
                    option.value = address.addressId;
                    option.setAttribute('data-address', address.address);
                    option.textContent = `(ADDRESS ID : ${address.addressId}) ${address.address}`;
                    resultAddress.appendChild(option);
                });
            },
            error: function() {
                alert('주소 검색 중 오류가 발생했습니다.');
            }
        });
    });

    // 주소 선택 버튼 클릭 시 동작
    document.getElementById('btnAddrSel').addEventListener('click', function() {
        const resultAddress = document.getElementById('resultAddress');
        const selectedOption = resultAddress.options[resultAddress.selectedIndex];

        if (selectedOption) {
            // 선택된 주소를 주소 입력란에 채우기
            const selectedAddress = selectedOption.getAttribute('data-address');
            document.getElementById('selectedAddress').value = selectedAddress;

            // 모달 닫기
            $('#addressModal').modal('hide');

            // 회원가입 폼 보이기
            document.getElementById('signUp').style.display = 'block';
        } else {
            alert('주소를 선택하세요.');
        }
    });
</script>

</body>
</html>
