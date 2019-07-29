<%@ page import="mywebapi_tts.WebTTs" %>
<%@ page import="mywebapi_tts.FileUtil" %>
<%@ page import="mywebapi_tts.HttpUtil" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="org.apache.commons.codec.digest.DigestUtils" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLConnection" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>文字转音频</title>
</head>
<body>
<p>文字转音频:
    <%!
            String[] args;
            WebTTs a=new WebTTs();
    %>
    <%
        a.setTEXT("不做了，提交以后会去");
        WebTTs.main(args);
    %>
    <%=a.getTEXT()%>
</p>



</body>
</html>
