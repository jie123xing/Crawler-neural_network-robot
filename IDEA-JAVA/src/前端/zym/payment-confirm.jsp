<%--
  Created by IntelliJ IDEA.
  User: 朱禹谋
  Date: 2019/7/29
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>订单完成</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="header.css">
    <link rel="stylesheet" href="payment-confirm.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container-fluid">
        <%@include file="header.jsp"%>
        <div class="row" style="padding-top: 10px;">
            <div class="col-xs-8 col-xs-offset-2 confirmarea">
                <div class="vertical-middle">
                    <h5>
                        购买成功！将返回购物车页面
                    </h5>
                    <a class="return" href="shoppingcar.jsp">
                        如果浏览器没有反应，点击这里返回购物车页面
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
