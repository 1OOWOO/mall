<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Orders List</title>
<style>
	th {
	    width: 275px;
	    cursor: pointer;
	    text-align: left;
	    padding: 8px;
	    background-color: #f9f9f9;
	    border-bottom: 2px solid #dddddd;
	}    
	th[tabindex="0"] {
	    outline: none;
	}
</style>
</head>
<!-- Author : 오아림 -->
<body class="container-flud">
	<div class="row">
		<div class="col-sm-2 bg-light">
	         <!-- leftMenu.jsp 추가 -->
	         <c:import url="/WEB-INF/view/admin/leftMenu.jsp"></c:import>
	    </div>
	    <div class="col-sm-10">
			<h1>주문 관리</h1>
			<form id="formModifyOrders${o.ordersNo}" action="${pageContext.request.contextPath}/admin/ordersList" method="post">
				<table class="table table-striped table-bordered table-hover dataTable no-footer">
					<tr role="row">
						<th>주문 번호</th>
						<th>상품</th>
						<th>수량</th>
						<th>금액</th>
						<th>주문 상태</th>
						<th>결제 방법</th>
						<th></th>
					</tr>
					<c:forEach var="o" items="${ordersList}">
					<input type="hidden" name="ordersNo" value="${o.ordersNo}">
						<tr>
							<td style=" text-align: center;">${o.ordersNo}</td>
							<td>${o.goodsTitle}</td>
							<td style="text-align: center;">${o.ordersAmount}</td>
							<td>${o.goodsPrice}</td>
							<td style="text-align: center;">
				                <select name="paymentState" id="paymentState${o.ordersNo}">
			                		<option value="${o.paymentState}">:${o.paymentState}:</option>
			                		<option value="결제완료">결제완료</option>
			                		<option value="배송중">배송중</option>
			                		<option value="배송완료">배송완료</option>
			                	</select>
			                </td>
			                <td>${o.paymentMethod}</td>
			                <td><button id="btnModifyOrders${o.ordersNo}" type="submit">수정</button></td>
						</tr>
					</c:forEach>
				</table>
			</form>
		</div>
	</div>
</body>
<script>
	$('#btnModifyOrders${o.ordersNo}').click(function(){
		if($('#paymentState${o.ordersNo}').val() == '') {
			alert('주문 상태를 선택하세요')
		} else {
			$('#formModifyOrders${o.ordersNo}').submit();
		}
	});
</script>
</html>