<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
    </head>
<body>
<div class="fixed top">固定手懒</div>



<div id="ceshi">
    ceshiyinpingssid
</div>

<audio autoplay id="myAudio">
    <source src="F:\weather\weather1\IDEA-JAVA\FirstModule\web\response\3.wav" type="audio/mpeg">
</audio>
<input type="button" value="改变声音" onclick="f()">
</div>
<script>
    var ssid=0;
    function f() {
        ssid+=1;
        document.getElementById("ceshi").innerHTML="F:\\weather\\weather1\\IDEA-JAVA\\FirstModule\\web\\response\\3.wav";
        document.getElementById("myAudio").src="F:\\weather\\weather1\\IDEA-JAVA\\FirstModule\\web\\response\\3.wav";
    }
</script>

<%= "机器人："+request.getParameter("teststring")+"<br>"%>
请求体的mime类型:<%=request.getContentType()%><br>
协议类型及版本号:<%=request.getProtocol()%><br>
服务器主机名:<%=request.getServerName()%><br>
请求的端口号:<%=request.getServerPort()%><br>
字符编码方式:<%=request.getCharacterEncoding()%><br>
请求体的长度:<%=request.getContentLength()%><br>
返回发送请求的客户端IP地址:<%=request.getRemoteAddr()%><br>

返回上下文路径:<%=request.getContextPath()%><br>
getRequestURL<%=request.getRequestURL()%><br>
//realPath:D:\apache-tomcat-6.0.13\webapps\WebDemo\<%=request.getRealPath("/")%><br>
<%=request.getSession().getServletContext().getRealPath("")%><br>

<%=request.getParameter("data")%><br>
<%=request.getParameter("name")%><br>
<%=request.getParameter("upfile_b64")%><br>

</body>
</html>