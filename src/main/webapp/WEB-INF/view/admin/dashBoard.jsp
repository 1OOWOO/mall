<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel='stylesheet' href='css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
<!-- css -->
<meta charset="UTF-8">
  <h1>Dashboard</h1>
    <div class="dashboard-stats">
        <!-- 신규 주문 -->
        <div class="stat-card">
            <h2>${summary.newOrders}</h2>
            <p>신규 주문</p>
        </div>

        <!-- 취소된 주문 -->
        <div class="stat-card">
            <h2>${summary.canceledOrders}</h2>
            <p>취소된 주문</p>
        </div>

        <!-- 신규 후기 -->
        <div class="stat-card">
            <h2>${summary.newReviews}</h2>
            <p>신규 후기</p>
        </div>

        <!-- 신규 회원 -->
        <div class="stat-card">
            <h2>${summary.newUsers}</h2>
            <p>신규 회원</p>
        </div>
    </div>
</body>
</html>