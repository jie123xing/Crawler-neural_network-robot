<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONException" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.*" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/7/24
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%!
public class Util {
//存储APIkey
public static final String API_KEY = "3e661c1a04574ce6aeec858e03a6ad62";
//存储接口请求地址
public static final String API_URL = "http://www.tuling123.com/openapi/api";

/**
* 拼接出我们的接口请求地址
*
* @param msg 需要发送的消息
* @return
*/
private String setParameter(String msg) {
//在接口请求中 中文要用URLEncoder encode成UTF-8
try {
   return API_URL + "?key=" + API_KEY + "&info=" + URLEncoder.encode(msg, "utf-8");
} catch (UnsupportedEncodingException e) {
e.printStackTrace();
}
return null;
}

/**
* 拿到消息回复的内容的方法
* @param json 请求接口得到的JSON
* @return text的部分
*/
private String getString(String json){
try {
JSONObject object = new JSONObject(json);
//System.out.println(object.getString("text"));
return object.getString("text");
} catch (JSONException e) {
e.printStackTrace();
}
return null;
}

/**
* 提供对外公开的方法用于最终拿到机器人回复的消息
* @param msg 传入你需要发送的信息
* @return 机器人对你的回复
*/
public String getMessage(String msg){
return getString(getHTML(setParameter(msg)));
}

private String getHTML(String url) {
    try {
        URL u = new URL(url);
        URLConnection urlConnection = u.openConnection();
        HttpURLConnection connection = null;
        if (urlConnection instanceof HttpURLConnection) {
            connection = (HttpURLConnection) urlConnection;
        } else {
            //System.out.println("请输入 URL 地址");
            return null;
        }
        BufferedReader in = new BufferedReader(
                new InputStreamReader(connection.getInputStream(),"utf-8"));
        String urlString = "";
        String current;
        while ((current = in.readLine()) != null) {
            urlString += current;
        }
        //System.out.println("urlString"+urlString);
        return urlString;
    } catch (IOException e) {
        e.printStackTrace();
    }
    return null;
}
}
//util
Util util = new Util();
String myquest;
String myresponse;
%>
<%myquest=request.getParameter("teststring");%>
<%myresponse=util.getMessage(myquest);%>
<%--<%myresponse=new String(util.getMessage(myquest).getBytes("gbk"),"utf-8");%>
已经gbk解码，再gdk编码后用utf-8解码任然错误
--%>
<%=myresponse%>

