<%@ page import="mywebapi_tts.WebTTs" %>
<%@ page import="mywebapi_tts.FileUtil" %>
<%@ page import="mywebapi_tts.HttpUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>文字转音频</title>
</head>
<body>
<p>mainrobot:
    <%!String[] args;%>
    <%
        WebTTs a=new WebTTs();
        a.setTEXT("附近有什么好吃的789");
        WebTTs.main(args);
    %>
</p>
</body>
</html>
