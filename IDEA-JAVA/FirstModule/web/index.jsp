<%@ page import="javafx.scene.shape.Circle" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
  <title>第一个网页</title>
</head>
<body>
<%! Printmy my = new Printmy("my string print");
    public class Printmy{
      private String mystring;
      Printmy(String mystring){
        this.mystring=mystring;
      }
      public String getstring(String mystring){
            //this.mystring=mystring;
            return mystring;
      }
      public int mystatus(int x){
        return x;
      }
    }
%>

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
</body>
</html>
