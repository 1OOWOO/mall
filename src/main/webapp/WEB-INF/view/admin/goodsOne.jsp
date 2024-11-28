<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
<!-- Bootstrap CSS for modal -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Goods One</title>
</head>
<!-- Author : 오아림 -->
<body>
	<h1>상품 관리</h1>
	<h2>${goods.goodsTitle}</h2>
	<form id="formModifyGoods" action="${pageContext.request.contextPath}/admin/modifyGoods" method="post">
		<table>
			<tr>
				<td>No</td>
				<td>
					${go.goodsNo}
					<input type="hidden" name="goodsNo" value="${go.goodsNo}">
				</td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" id="goodsTitle" name="goodsTitle" value="${go.goodsTitle}"></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<select name="goodsCategoryNo" id="goodsCategoryNo">
						<option value="">:${go.categoryTitle}:</option>
						<c:forEach var="c" items="${categoryList}">
							<option value="${c.categoryNo}" <c:if test="${c.categoryNo == go.categoryNo}">selected</c:if>>
								${c.categoryTitle}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="number" id="goodsPrice" name="goodsPrice" value="${go.goodsPrice}"></td>
			</tr>
			<tr>
				<td>메모</td>
				<td><textarea id="goodsMemo" name="goodsMemo" row="5" col="50">${go.goodsMemo}</textarea></td>
			</tr>
			<tr>
				<td>재고</td>
				<td>
					${go.goodsState} <br>
					<input type="radio" name="goodsState" value="재고있음">재고있음
					<input type="radio" name="goodsState" value="재고없음">재고없음
				</td>
			</tr>
			<tr>
				<td>업데이트</td>
				<td>${go.updateDate}</td>
			</tr>
		</table>
		
		<br>
		<h4>상품 이미지</h4>
		<!-- goodsFile List -->
		<br>
		<button type="button" id="btnModifyGoods">상품 수정</button>
	</form>
</body>
<script>
	$('#btnModifyGoods').click(function(){
		if($('#goodsTitle').val() == ''){
    		$('#goodsTitle').val($('#goodsTitle').val()); // 상품명을 입력하지 않으면 이전 값 가져오기
		} else if($('#goodsCategoryNo').val() == null) {
			alert('카테고리를 선택하세요');
		} else if($('#goodsPrice').val() == null) {
			$('#goodsPrice').val($('#goodsPrice').val()); // 상품가격을 입력하지 않으면 이전 값 가져오기
		} else if($('input[name="goodsState"]:checked').length == 0) {
			alert('상품 재고를 선택하세요');
		} else if($('#goodsMemo').val() == ''){
			$('#goodsMemo').val($('#goodsMemo').val());
		} else {
			$('#formModifyGoods').submit();
		}
	});
</script>
</html>