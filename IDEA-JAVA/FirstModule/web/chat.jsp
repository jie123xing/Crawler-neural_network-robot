<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <script>
        function loadXMLDoc()
        {
            var xmlhttp;
            if (window.XMLHttpRequest)
            {
                // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
                xmlhttp=new XMLHttpRequest();
            }
            else
            {
                // IE6, IE5 浏览器执行代码
                xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function()
            {
                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    document.getElementById("myDiv").innerHTML+="我："+document.getElementById("quest").value+"<br>"
                    document.getElementById("myDiv").innerHTML+=xmlhttp.responseText+"<br>";
                    document.getElementById("quest").value=""
                }
            }
            xmlhttp.open("GET","robot.jsp?teststring="+document.getElementById("quest").value,true);
            //xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlhttp.send();
        }
    </script>
    <title>智能应答</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<br>
<br>
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">图灵机器人</h3>
    </div>
    <div class="panel-body" id="myDiv">

    </div>
</div>
<br>
<br>

<from>
<div class="form-group">
    <div class="col-sm-10">
        <input type="text" class="form-control" id="quest"
               placeholder="请输入你的问题">
    </div>
</div>
<div class="form-group">
    <div class="col-sm-10">
        <button type="button" class="btn btn-default" onclick="loadXMLDoc()">发送</button>
    </div>
</div>
</from>

</body>
</html>