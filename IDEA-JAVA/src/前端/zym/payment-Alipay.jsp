<%--
  Created by IntelliJ IDEA.
  User: 朱禹谋
  Date: 2019/7/27
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>支付宝支付</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="header.css">
    <link rel="stylesheet" href="payment-Alipay.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container-fluid">
        <%@include file="header.jsp"%>
        <div class="row">
            <div class="col-xs-8 col-xs-offset-2 row">
                <div class="row col-xs-12 information-title">
                    <h5 class="vertical-middle">
                        确认支付方式
                    </h5>
                </div>
                <div class="col-xs-12 row">
                    <div class="col-xs-8 row paymentarea">
                        <ul class="nav nav-tabs col-xs-12" style="padding: 0;">
                            <li role="presentation" class="active payment-selection"><a class="payment-a" href="payment-Alipay.jsp" style="border-bottom: unset !important;">支付宝</a></li>
                            <li role="presentation" class="payment-selection"><a class="payment-a" href="payment-Wechat.jsp">微信</a></li>
                            <li role="presentation" class="payment-selection"><a class="payment-a" href="payment-Bank.jsp">银行</a></li>
                        </ul>
                        <div class="col-xs-12 paymentarea-in">
                            <div class="payment-tip">
                                <h4>
                                    请扫描以下二维码
                                </h4>
                            </div>
                            <div class="div-img">
                                <img src="${pageContext.request.contextPath}/src/cat.bmp" class="img-code">
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-4 row area-right">
                        <h3>
                            提醒and说明
                        </h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
