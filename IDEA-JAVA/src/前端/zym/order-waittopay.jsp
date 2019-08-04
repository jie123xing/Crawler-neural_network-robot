<%--
  Created by IntelliJ IDEA.
  User: 朱禹谋
  Date: 2019/8/3
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>待支付</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="header.css">
    <link rel="stylesheet" href="order-waittopay.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <%@include file="header.jsp"%>
    <div class="row" style="padding-top: 10px;">
        <div class="col-xs-8 col-xs-offset-2">
            <nav class="row navbar navbar-default">
                <ul class="nav navbar-nav myorder">
                    <li><a href="order-all.jsp">所有订单</a></li>
                    <li class="active"><a href="order-waittopay.jsp">待付款</a></li>
                    <li><a href="order-waittoreceive.jsp">待收货</a></li>
                </ul>
            </nav>
            <div class="row myattribute">
                <label class="col-xs-6 mylabel">
                    商品信息
                </label>
                <label class="col-xs-2 mylabel">
                    单价
                </label>
                <label class="col-xs-2 mylabel">
                    数量
                </label>
                <label class="col-xs-2 mylabel-last">
                    金额
                </label>
            </div>
            <div class="order-one">
                <div class="row order-imformation">
                    <div class="col-xs-2 mytable">
                        <h5 class="vertical-middle">
                            <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
                            2019-8-3
                        </h5>
                    </div>
                    <div class="col-xs-10 mytable">
                        <h5 class="vertical-middle">
                            订单号：123456789
                        </h5>
                    </div>
                </div>
                <div class="row mylist-order">
                    <div class="col-xs-1 img-div">
                        <div class="myimg">
                            <a href="#" class="thumbnail">
                                <img src="${pageContext.request.contextPath}/src/cat.bmp" alt="...">
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-5">
                        商品信息
                    </div>
                    <div class="col-xs-2">
                        ￥100
                    </div>
                    <div class="col-xs-2">
                        2
                    </div>
                    <div class="col-xs-2">
                        ￥200
                    </div>
                </div>
                <div class="row mylist-order">
                    <div class="col-xs-1 img-div">
                        <div class="myimg">
                            <a href="#" class="thumbnail">
                                <img src="${pageContext.request.contextPath}/src/cat.bmp" alt="...">
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-5">
                        商品信息
                    </div>
                    <div class="col-xs-2">
                        ￥100
                    </div>
                    <div class="col-xs-2">
                        2
                    </div>
                    <div class="col-xs-2">
                        ￥200
                    </div>
                </div>
                <div class="row mylist-operator">
                    <div class="col-xs-2 col-xs-offset-6 mylabel-button">
                        <h5 class="vertical-middle">
                            合计：
                        </h5>
                    </div>
                    <div class="col-xs-2 mylabel-button">
                        <h4 class="vertical-middle" style="color: red;">
                            ￥100
                        </h4>
                    </div>
                    <div class="col-xs-2 mylabel-button" style="padding: unset;">
                        <button type="button" class="btn btn-default button-account" onclick="javascrtpt:window.location.href='payment-Alipay.jsp'">结算</button>
                    </div>
                </div>
            </div>
            <div class="order-one">
                <div class="row order-imformation">
                    <div class="col-xs-2 mytable">
                        <h5 class="vertical-middle">
                            <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
                            2019-8-3
                        </h5>
                    </div>
                    <div class="col-xs-10 mytable">
                        <h5 class="vertical-middle">
                            订单号：123456789
                        </h5>
                    </div>
                </div>
                <div class="row mylist-order">
                    <div class="col-xs-1 img-div">
                        <div class="myimg">
                            <a href="#" class="thumbnail">
                                <img src="${pageContext.request.contextPath}/src/cat.bmp" alt="...">
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-5">
                        商品信息
                    </div>
                    <div class="col-xs-2">
                        ￥100
                    </div>
                    <div class="col-xs-2">
                        2
                    </div>
                    <div class="col-xs-2">
                        ￥200
                    </div>
                </div>
                <div class="row mylist-operator">
                    <div class="col-xs-2 col-xs-offset-6 mylabel-button">
                        <h5 class="vertical-middle">
                            合计：
                        </h5>
                    </div>
                    <div class="col-xs-2 mylabel-button">
                        <h4 class="vertical-middle" style="color: red;">
                            ￥100
                        </h4>
                    </div>
                    <div class="col-xs-2 mylabel-button" style="padding: unset;">
                        <button type="button" class="btn btn-default button-account" onclick="javascrtpt:window.location.href='payment-Alipay.jsp'">结算</button>
                    </div>
                </div>
            </div>
            <nav aria-label="Page navigation">
                <ul class="pagination" style="float: right;">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
