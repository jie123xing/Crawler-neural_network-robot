<%@ page import="mywebapi_tts.WebTTs" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>文字转音频</title>
</head>
<body>
<%
    String TEXT;
    WebTTs webtts=new WebTTs();
%>
<jsp:useBean id="date" class="java.util.Date" />
<p>日期为：<%= date %>

<jsp:useBean id="WebTTs"
             class="mywebapi_tts.WebTTs">
    <jsp:setProperty name="WebTTs" property="TEXT"
                     value="小强有什么手机软件"/>
</jsp:useBean>

<p>TEXT:
    <jsp:getProperty name="webapi_tts" property="TEXT"/>
</p>

    success
</body>
</html>
