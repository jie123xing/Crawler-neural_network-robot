<%--
  Created by IntelliJ IDEA.
  User: 朱禹谋
  Date: 2019/7/23
  Time: 17:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>购物车</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="header.css">
    <link rel="stylesheet" href="shoppingcar.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container-fluid">
        <%@include file="header.jsp"%>
        <div class="row" style="padding-top: 10px;">
            <div class="col-xs-8 col-xs-offset-2">
                <div class="row myattribute">
                    <label class="col-xs-4 mylabel">
                        商品信息
                    </label>
                    <label class="col-xs-2 mylabel">
                        单价
                    </label>
                    <label class="col-xs-2 mylabel">
                        数量
                    </label>
                    <label class="col-xs-2 mylabel">
                        金额
                    </label>
                    <label class="col-xs-2 mylabel-last">
                        操作
                    </label>
                </div>
                <div class="list-group row mylist-shoppingcar">
                    <div class="col-xs-1">
                        <input type="checkbox" value="select1">
                    </div>
                    <div class="col-xs-1 img-div">
                        <div class="myimg">
                            <a href="#" class="thumbnail">
                                <img src="${pageContext.request.contextPath}\src\cat.bmp" alt="...">
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        商品信息
                    </div>
                    <div class="col-xs-2">
                        ￥100
                    </div>
                    <div class="col-xs-2">
                            <button class="counter-button">
                                -
                            </button>
                            <input value="数量" class="counter-amount">
                            <button class="counter-button">
                                +
                            </button>
                    </div>
                    <div class="col-xs-2">
                        ￥300
                    </div>
                    <div class="col-xs-2 operator-div">
                        <div class="operator">
                            <p>
                                <a class="a-operator" href="#">
                                    加入收藏夹
                                </a>
                            </p>
                            <br/>
                            <a class="a-operator" href="#">
                                删除
                            </a>
                        </div>
                    </div>
                </div>
                <div class="list-group row mylist-shoppingcar">
                    <div class="col-xs-1">
                        <input type="checkbox" value="select1">
                    </div>
                    <div class="col-xs-1 img-div">
                        <div class="myimg">
                            <a href="#" class="thumbnail">
                                <img src="${pageContext.request.contextPath}\src\cat.bmp" alt="...">
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        商品信息
                    </div>
                    <div class="col-xs-2">
                        ￥100
                    </div>
                    <div class="col-xs-2">
                        <button class="counter-button">
                            -
                        </button>
                        <input value="数量" class="counter-amount">
                        <button class="counter-button">
                            +
                        </button>
                    </div>
                    <div class="col-xs-2">
                        ￥300
                    </div>
                    <div class="col-xs-2 operator-div">
                        <div class="operator">
                            <p>
                                <a class="a-operator" href="#">
                                    加入收藏夹
                                </a>
                            </p>
                            <br/>
                            <a class="a-operator" href="#">
                                删除
                            </a>
                        </div>
                    </div>
                </div>
                <div class="list-group row mylist-shoppingcar">
                    <div class="col-xs-1">
                        <input type="checkbox" value="select1">
                    </div>
                    <div class="col-xs-1 img-div">
                        <div class="myimg">
                            <a href="#" class="thumbnail">
                                <img src="${pageContext.request.contextPath}\src\cat.bmp" alt="...">
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        商品信息
                    </div>
                    <div class="col-xs-2">
                        ￥100
                    </div>
                    <div class="col-xs-2">
                        <button class="counter-button">
                            -
                        </button>
                        <input value="数量" class="counter-amount">
                        <button class="counter-button">
                            +
                        </button>
                    </div>
                    <div class="col-xs-2">
                        ￥300
                    </div>
                    <div class="col-xs-2 operator-div">
                        <div class="operator">
                            <p>
                                <a class="a-operator" href="#">
                                    加入收藏夹
                                </a>
                            </p>
                            <br/>
                            <a class="a-operator" href="#">
                                删除
                            </a>
                        </div>
                    </div>
                </div>
                <div class="list-group row mylist-shoppingcar">
                    <div class="col-xs-1">
                        <input type="checkbox" value="select1">
                    </div>
                    <div class="col-xs-1 img-div">
                        <div class="myimg">
                            <a href="#" class="thumbnail">
                                <img src="${pageContext.request.contextPath}\src\cat.bmp" alt="...">
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        商品信息
                    </div>
                    <div class="col-xs-2">
                        ￥100
                    </div>
                    <div class="col-xs-2">
                        <button class="counter-button">
                            -
                        </button>
                        <input value="数量" class="counter-amount">
                        <button class="counter-button">
                            +
                        </button>
                    </div>
                    <div class="col-xs-2">
                        ￥300
                    </div>
                    <div class="col-xs-2 operator-div">
                        <div class="operator">
                            <p>
                                <a class="a-operator" href="#">
                                    加入收藏夹
                                </a>
                            </p>
                            <br/>
                            <a class="a-operator" href="#">
                                删除
                            </a>
                        </div>
                    </div>
                </div>
                <div class="list-group row mylist-shoppingcar">
                    <div class="col-xs-1">
                        <input type="checkbox" value="select1">
                    </div>
                    <div class="col-xs-1 img-div">
                        <div class="myimg">
                            <a href="#" class="thumbnail">
                                <img src="${pageContext.request.contextPath}\src\cat.bmp" alt="...">
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        商品信息
                    </div>
                    <div class="col-xs-2">
                        ￥100
                    </div>
                    <div class="col-xs-2">
                        <button class="counter-button">
                            -
                        </button>
                        <input value="数量" class="counter-amount">
                        <button class="counter-button">
                            +
                        </button>
                    </div>
                    <div class="col-xs-2">
                        ￥300
                    </div>
                    <div class="col-xs-2 operator-div">
                        <div class="operator">
                            <p>
                                <a class="a-operator" href="#">
                                    加入收藏夹
                                </a>
                            </p>
                            <br/>
                            <a class="a-operator" href="#">
                                删除
                            </a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <nav aria-label="Page navigation">
                        <ul class="pagination mypage">
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
                <div class="row mylist-operator">
                    <div class="col-xs-1 mylabel-button">
                        <input type="checkbox" value="select-all">全选
                    </div>
                    <div class="col-xs-1 mylabel-button">
                        <a class="a-operator" href="#">
                            删除
                        </a>
                    </div>
                    <div class="col-xs-2 mylabel-button">
                        <a class="a-operator" href="#">
                            移入收藏夹
                        </a>
                    </div>
                    <div class="col-xs-1 mylabel-button">
                        <a class="a-operator" href="#">
                            分享
                        </a>
                    </div>
                    <div class="col-xs-2 mylabel-button">
                        <h4 class="vertical-middle">
                            已选商品1件
                        </h4>
                    </div>
                    <div class="col-xs-1 mylabel-button">
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
                        <button type="button" class="btn btn-default button-account" onclick="javascrtpt:window.location.href='order-payment.jsp'">结算</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
