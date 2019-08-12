<%--
  Created by IntelliJ IDEA.
  User: 朱禹谋
  Date: 2019/7/27
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>订单支付</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="header.css">
    <link rel="stylesheet" href="order-payment.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container-fluid">
        <%@include file="header.jsp"%>
        <div class="row">
            <div class="col-xs-8 col-xs-offset-2">
                <div class="row col-xs-12 information-title">
                    <h5 class="vertical-middle">
                        确认收货地址
                    </h5>
                </div>
                <div class="row">
                    <div class="col-xs-4 row">
                        <div class="col-xs-9 address">
                            <div class="address-item" style="border-bottom: 1px solid black;">
                                <h5 class="vertical-middle">
                                    北京 北京 （xx收）
                                </h5>
                            </div>
                            <div class="address-item">
                                <h5 class="vertical-middle">
                                    海淀 花园路 北京邮电大学
                                </h5>
                            </div>
                            <div class="address-item">
                                <h5 class="vertical-middle">
                                    188****9607
                                </h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-4 row">
                        <div class="col-xs-9 address">
                            <div class="address-item" style="border-bottom: 1px solid black;">
                                <h5 class="vertical-middle">
                                    北京 北京 （xx收）
                                </h5>
                            </div>
                            <div class="address-item">
                                <h5 class="vertical-middle">
                                    海淀 花园路 北京邮电大学
                                </h5>
                            </div>
                            <div class="address-item">
                                <h5 class="vertical-middle">
                                    188****9607
                                </h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-4 row">
                        <div class="col-xs-9 address">
                            <div class="address-item" style="border-bottom: 1px solid black;">
                                <h5 class="vertical-middle">
                                    北京 北京 （xx收）
                                </h5>
                            </div>
                            <div class="address-item">
                                <h5 class="vertical-middle">
                                    海淀 花园路 北京邮电大学
                                </h5>
                            </div>
                            <div class="address-item">
                                <h5 class="vertical-middle">
                                    188****9607
                                </h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-4 row">
                        <div class="col-xs-9 address">
                            <div class="address-item" style="border-bottom: 1px solid black;">
                                <h5 class="vertical-middle">
                                    北京 北京 （xx收）
                                </h5>
                            </div>
                            <div class="address-item">
                                <h5 class="vertical-middle">
                                    海淀 花园路 北京邮电大学
                                </h5>
                            </div>
                            <div class="address-item">
                                <h5 class="vertical-middle">
                                    188****9607
                                </h5>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row address-manage">
                    <div class="col-xs-2">
                        <button type="button" class="btn btn-default">
                            使用新地址
                        </button>
                    </div>
                    <div class="col-xs-offset-8 col-xs-2">
                        <a href="#">
                            管理收货地址
                        </a>
                    </div>
                </div>
                <div class="row col-xs-12 information-title">
                    <h5 class="vertical-middle">
                        确认订单信息
                    </h5>
                </div>
                <div class="row col-xs-12 myattribute">
                    <div class="col-xs-4 mylabel">
                        商品相关
                    </div>
                    <div class="col-xs-2 mylabel">
                        单价
                    </div>
                    <div class="col-xs-2 mylabel">
                        数量
                    </div>
                    <div class="col-xs-2 mylabel">
                        金额
                    </div>
                    <div class="col-xs-2 mylabel-last">
                        备注
                    </div>
                </div>
                <div class="row col-xs-12 mylist-order">
                    <div class="col-xs-1 img-div">
                        <div class="myimg">
                            <a href="#" class="thumbnail">
                                <img src="${pageContext.request.contextPath}/src/cat.bmp" alt="...">
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-3">
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
                    <div class="col-xs-2">
                        无
                    </div>
                </div>
                <div class="row col-xs-12 mylist-order">
                    <div class="col-xs-1 img-div">
                        <div class="myimg">
                            <a href="#" class="thumbnail">
                                <img src="${pageContext.request.contextPath}/src/cat.bmp" alt="...">
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-3">
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
                    <div class="col-xs-2">
                        无
                    </div>
                </div>
                <div class="row col-xs-12 mylist-order">
                    <div class="col-xs-1 img-div">
                        <div class="myimg">
                            <a href="#" class="thumbnail">
                                <img src="${pageContext.request.contextPath}/src/cat.bmp" alt="...">
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-3">
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
                    <div class="col-xs-2">
                        无
                    </div>
                </div>
                <div class="row col-xs-12 mylist-order">
                    <div class="col-xs-1 img-div">
                        <div class="myimg">
                            <a href="#" class="thumbnail">
                                <img src="${pageContext.request.contextPath}/src/cat.bmp" alt="...">
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-3">
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
                    <div class="col-xs-2">
                        无
                    </div>
                </div>
                <div class="row col-xs-12 mylist-order">
                    <div class="col-xs-1 img-div">
                        <div class="myimg">
                            <a href="#" class="thumbnail">
                                <img src="${pageContext.request.contextPath}/src/cat.bmp" alt="...">
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-3">
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
                    <div class="col-xs-2">
                        无
                    </div>
                </div>
                <div class="row col-xs-12 information-title">
                    <h3 class="col-xs-2 col-xs-offset-8 vertical-middle">
                        合计：
                    </h3>
                    <h3 class="col-xs-2 vertical-middle" style="color: red;">
                        ￥1000
                    </h3>
                </div>
                <div class="row col-xs-12 information-quest">
                    <div class="col-xs-5 col-xs-offset-7 information-border">
                        <div class="information-item">
                            <h5 class="vertical-middle">
                                实付款：￥1000
                            </h5>
                        </div>
                        <div class="information-item">
                            <h5 class="vertical-middle">
                                寄送至：北京 北京 海淀 花园路 北京邮电大学
                            </h5>
                        </div>
                        <div class="information-item">
                            <h5 class="vertical-middle">
                                收货人：xxx 188****9607
                            </h5>
                        </div>
                    </div>
                </div>
                <div  class="row col-xs-12 operator">
                    <div class="col-xs-2 col-xs-offset-7 return-shoppingcar">
                        <a href="shoppingcar.jsp" class="vertical-middle">
                            <span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>
                            返回购物车
                        </a>
                    </div>
                    <div class="col-xs-2 col-xs-offset-1 set-order">
                        <button class="btn btn-default button-account" onclick="javascrtpt:window.location.href='payment-Alipay.jsp'">提交订单</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
