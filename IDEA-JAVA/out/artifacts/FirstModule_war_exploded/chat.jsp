<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <script>
        var showContent = $(".myDiv");
        showContent[0].scrollTop = showContent[0].scrollHeight;
        function txttowav(text123) {
            var robotresponse;
            if (window.XMLHttpRequest)
            {
                // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
                robotresponse=new XMLHttpRequest();
            }
            else
            {
                // IE6, IE5 浏览器执行代码
                robotresponse=new ActiveXObject("Microsoft.XMLHTTP");
            }
            robotresponse.onreadystatechange=function()
            {
                if (robotresponse.readyState==4 && robotresponse.status==200)
                {
                    var x=robotresponse.responseText;
                }
            }
            robotresponse.open("GET","getrobotresponse.jsp?text="+text123,true);
            //xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            robotresponse.send();
        }
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
                    document.getElementById("myDiv").innerHTML+="机器人："+xmlhttp.responseText+"<br>";
                    txttowav(xmlhttp.responseText);
                    document.getElementById("quest").value=""
                    var x=document.getElementById("myDiv")
                    x.scrollTop =x.scrollHeight;
                }
            }
            xmlhttp.open("GET","robot.jsp?teststring="+document.getElementById("quest").value,true);
            //xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlhttp.send();
        }
    </script>
    <title>智能应答</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
<br>
<br>
<div class="max-height:60%">
    <div style="background-color:#A9A9A9">
        <h3 class="mx-auto col-md-3 text-white" >图灵机器人</h3>
    </div>
    <br>
    <div id="myDiv" class="col-md-10 offset-md-1 pre-scrollable" style="background-color:#ddd;height:60%;">

    </div>

</div>
<br>

<div class="col-md-10 offset-md-1">
    <from>
    <div class="input-group mb-3">
        <input type="text" name="robotresponse"class="form-control" placeholder="输入" id="quest">
        <div class="input-group-append">
            <button class="btn btn-success" type="submit" onclick="loadXMLDoc()">发送</button>
        </div>
    </div>
    </from>
</div>
<audio autoplay>
    <source src=sid type="audio/mpeg">
    您的浏览器不支持 audio 元素。
</audio>
</body>
</html>