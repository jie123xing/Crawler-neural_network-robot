<%@ page import="mywebapi_tts.WebTTs" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>文字转音频</title>
</head>
<body>
<%
    String TEXT;
    String[] args;
%>
<jsp:useBean id="date" class="java.util.Date" />
<p>日期为：<%= date %>
    <jsp:useBean id="robotresponse"
                 class="mywebapi_tts.WebTTs">
        <jsp:setProperty name="robotresponse" property="TEXT"
                         value="明天上海的天气怎么样"/>
    </jsp:useBean>

<p>robotresponse:
    <jsp:getProperty name="robotresponse" property="TEXT"/>
</p>
<p>mainrobot:
    <%
        WebTTs a=new WebTTs();
    %>
    <%a.main1();%>
</p>
</body>
</html>
