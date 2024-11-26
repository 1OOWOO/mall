<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
<title>Add Goods</title>
</head>
<body>
	<h1>상품 등록</h1>
	<form id="formAddGoods" method="post" action="${pageContext.request.contextPath}/admin/addGoods" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<td>카테고리</td>
				<td>
					<select id="category" name="category">
						<option value="">카테고리</option>
						<option value="계절별의류">계절별의류</option>
						<option value="액세서리">액세서리</option>
						<option value="장난감">장난감</option>
						<option value="산책용품">산책용품</option>
						<option value="간식&영양제">간식&영양제</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" name="goodsTitle" id="goodsTitle"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="number" name="goodsPrice" id="goodsPrice"></td>
			</tr>
			<tr>
				<td>메모</td>
				<td><textarea rows="3" cols="50" id="goodsMemo" name="goodsMemo"></textarea></td>
			</tr>
			<tr>
				<td>재고</td>
				<td>
					<input type="radio" name="goodsState" id="goodsState" value="재고있음">재고있음
					<input type="radio" name="goodsState" id="goodsState" value="재고없음">재고없음
				</td>
			</tr>
			<tr>
				<td>업데이트</td>
				<td><input type="datetime-local" name="goodsUpdateDate" id="goodsUpdateDate"></td>
			</tr>
			<tr>
				<td>파일</td>
				<td>
					<div id="fileDiv">
						<button type="button" id="btnAddFile">파일 추가</button>
						<button type="button" id="btnRemoveFile">파일 삭제</button>
					</div>
					<div style="color:Tomato;">${msg}</div>
				</td>
			</tr>
		</table>
		<div>
			<button id="btnAddGoods" type="button">상품 추가</button>
		</div>
	</form>
</body>
<script>
	// 상품 추가 버튼
	$('#btnAddGoods').click(function(){
		if($('#goodsTitle').val()==''){
			alert('상품명을 입력하세요');
		} else if($('#goodsPrice').val()==null){
			alert('상품 가격을 입력하세요');
		} else if($('.actorFile').length > 0 && $('.actorFile').last().val() == ''){
			alert('파일을 첨부하세요');
		} else{
			$('#formAddGoods').submit();
		}
	});

	// 파일 추가 버튼
	$('#btnAddFile').click(function(){
		if($('.goodsFile').last().val() == ''){ // 마지막 input_file값이 공백이라면
			alert('파일을 첨부하세요');
		} else{
			let html = '<input type="file" name="goodsFile" class="form-control" style="width:40%;">';
			$('#fileDiv').append(html);
		}
	});
	
	// 파일 삭제 버튼
	$('#btnRemoveFile').click(function(){
		if($('.goodsFile').length == 0){
			alert('삭제할 파일이 없습니다.');
		} else{
			$('.goodsFile').last().remove(); // 마지막 <input> 태그 제거
		}
	})
</script>
</html>