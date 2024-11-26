<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
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
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel='stylesheet' href='css/style.css' type='text/css' media='all'/>
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
<body>
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
