<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   <link rel="stylesheet" href="assets/materialize/css/materialize.min.css" media="screen,projection" />
    Bootstrap Styles
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    FontAwesome Styles
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    Morris Chart Styles
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    Custom Styles
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
    Google Fonts
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css"> 
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel='stylesheet' href='css/style.css' type='text/css' media='all'/> -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f7f7f7;
        }
        .dashboard {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 20px;
        }
        .dashboard h1 {
            font-size: 2em;
            margin-bottom: 20px;
        }
        .dashboard-stats {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            width: 100%;
            max-width: 800px;
        }
        .stat-card {
            background: white;
            border: 2px solid #000;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .stat-card h2 {
            font-size: 1.5em;
            margin: 0;
        }
        .stat-card p {
            font-size: 1em;
            margin: 0;
        }
    </style>
</head>
<body class="container-flud">
   <div class="row">
      <div class="col-sm-2 bg-light">
         <!-- leftMenu.jsp 추가 -->
         <c:import url="/WEB-INF/view/admin/leftMenu.jsp"></c:import>
      </div>
    <div class="col-sm-10">
    	<div class="dashboard">
        <h1>대시보드</h1>
        <div class="dashboard-stats">
            <div class="stat-card">
                <h2>${summary.newOrders}</h2>
                <p>신규 주문</p>
            </div>
            <div class="stat-card">
                <h2>${summary.canceledOrders}</h2>
                <p>취소된 주문</p>
            </div>
            <div class="stat-card">
                <h2>${summary.newReviews}</h2>
                <p>신규 후기</p>
            </div>
            <div class="stat-card">
                <h2>${summary.newUsers}</h2>
                <p>신규 회원</p>
            </div>
        </div>
    </div>
</body>
</html>
