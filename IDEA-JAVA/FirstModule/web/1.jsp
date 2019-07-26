<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONException" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>第一个网页</title>
</head>
<body>
<%
    try {
    URL u = new URL("http://www.tuling123.com/openapi/api?key=3e661c1a04574ce6aeec858e03a6ad62&info=%E5%8C%97%E4%BA%AC%E6%98%8E%E5%A4%A9%E7%9A%84%E5%A4%A9%E6%B0%94");
    URLConnection urlConnection = u.openConnection();
    HttpURLConnection connection = null;
    if (urlConnection instanceof HttpURLConnection) {
    connection = (HttpURLConnection) urlConnection;
    } else {
    System.out.println("请输入 URL 地址");
    }
    BufferedReader in = new BufferedReader(
    new InputStreamReader(connection.getInputStream()));
    out.println("in.readLine"+in.readLine());
    String urlString = "";
    String current;
        out.println("mytestString"+"今天周几？。");
    while ((current = in.readLine()) != null) {
        out.println("current"+current);
    urlString += current;
    }
    out.println("urlString"+urlString);

    } catch (IOException e) {
    e.printStackTrace();
    }
%>
</body>
</html>