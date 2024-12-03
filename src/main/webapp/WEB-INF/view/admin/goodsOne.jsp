<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>상품 관리 | 상품 상세</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="assets/materialize/css/materialize.min.css"
	media="screen,projection" />
<!-- Bootstrap Styles-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- Morris Chart Styles-->
<link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- Custom Styles-->
<link href="assets/css/custom-styles.css" rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<body>
	<div id="wrapper">
		<nav class="navbar navbar-default top-navbar" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle waves-effect waves-dark"
					data-toggle="collapse" data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand waves-effect waves-dark" href="index.html"><i
					class="large material-icons">track_changes</i> <strong>OOWOO</strong></a>

				<div id="sideNav" href="">
					<i class="material-icons dp48">toc</i>
				</div>
			</div>

			<ul class="nav navbar-top-links navbar-right">
				<li><a class="dropdown-button waves-effect waves-dark"
					href="#!" data-activates="dropdown1"><i
						class="fa fa-user fa-fw"></i> <b>${loggedInStaff.staffId}님</b> <i
						class="material-icons right">arrow_drop_down</i></a></li>
			</ul>
		</nav>
		<!-- staff Menu -->
		<ul id="dropdown1" class="dropdown-content">
			<li><a
				href="${pageContext.request.contextPath}/admin/staffLogout"><i
					class="fa fa-sign-out fa-fw"></i> Logout</a></li>
		</ul>
		<!-- Left Menu  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li><a class="active-menu waves-effect waves-dark"
						href="${pageContext.request.contextPath}/admin/dashBoard"><i
							class="fa fa-dashboard"></i> 대시보드</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/customerList"
						class="waves-effect waves-dark"><i class="fa fa-desktop"></i>
							회원관리 </a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/goodsList"
						class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i>
							상품관리</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/ordersList"
						class="waves-effect waves-dark"><i class="fa fa-qrcode"></i>
							주문관리</a></li>
				</ul>
			</div>
		</nav>
		<!-- /. NAV SIDE  -->

		<div id="page-wrapper">
			<div class="header">
				<h1 class="page-header">상품 관리</h1>
			</div>
			<div id="page-inner">
				<div class="dashboard-cards">
					<div class="row">
					    <div class="col-sm-10">
							<h3 style=" text-align: center;">${go.goodsTitle}</h3><br>
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
								</table><br>
								<button type="button" id="btnModifyGoods">상품 수정</button>
							</form>
							
							<h4>상품 이미지</h4>
							<form action="${pageContext.request.contextPath}/admin/addGoodsFile" method="post" enctype="multipart/form-data">
   								<input type="hidden" name="goodsNo" value="${go.goodsNo}" />
								<div id="fileDiv">
									<button type="button" id="btnAddFile">파일 추가</button>
									<button type="button" id="btnRemoveFile">파일 삭제</button>
								</div>
								    <button type="submit" class="btn">업로드</button>
								<div style="color: Tomato;">${msg}</div>
								<!-- <img src="/mall/upload/34af1f47bdd14daba389f9a20cff6308.png"> -->
								<c:if test="${goodsFileList!=null}">
									<c:forEach var="file" items="${goodsFileList}">
								         <img src="${pageContext.request.contextPath}/upload/${file.goodsFileName}.${file.goodsFileExt}" 
									        alt="${file.goodsFileName}" style="width: 300px; height: auto;">
								    </c:forEach>
								 </c:if>  
							    <c:if test="${empty goodsFileList}">
									<img src="${pageContext.request.contextPath}/upload/NoImage.png" style="width: 300px; height: auto;">
								</c:if>
								
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	// 상품 수정 버튼
	$('#btnModifyGoods').click(function(){
		if($('#goodsTitle').val() == ''){
    		alert('상품명을 입력하세요')
		} else if($('#goodsCategoryNo').val() == null) {
			alert('카테고리를 선택하세요');
		} else if($('#goodsPrice').val() == null) {
			alert('상품 가격을 입력하세요')
		} else if($('input[name="goodsState"]:checked').length == 0) {
			alert('상품 재고를 선택하세요');
		} else {
			$('#formModifyGoods').submit();
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
		if($('.actorFile').length == 0){
			alert('삭제할 파일이 없습니다.');
		} else{
			$('.actorFile').last().remove(); // 마지막 <input> 태그 제거
		}
	})
</script>
</html>