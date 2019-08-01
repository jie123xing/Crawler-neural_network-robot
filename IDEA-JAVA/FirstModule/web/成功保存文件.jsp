<%@ page contentType="text/html; charset=utf-8"%>
<%@ page language="java" %>
<%@ page import="java.io.*" %>
<HTML><HEAD><TITLE>读写文件</TITLE></HEAD>
<BODY>
<CENTER>
    <FONT SIZE = 5 COLOR = blue>将数据写入文件</FONT>
</CENTER>
<%
    String path ="F:\\weather\\weather1\\IDEA-JAVA\\FirstModule\\web"; //取得目录在服务器端的实际位置
    //out.println(path+"");
    File result =new File("result.txt");
    FileWriter fw = new FileWriter(path + result); //建立FileWrite对象,并设定由fw对象变量引用

    out.println(path + result);
    //将字串写入文件
    fw.write("大家好!");
    fw.write("祝大家学习jsp愉快！");
    fw.write("希望大家能够深入了解jsp技术！");
    fw.close(); //关闭文件
    FileReader fr = new FileReader(path + result); //建立FileReader对象,并设定由fr对象变量引用
    BufferedReader br = new BufferedReader(fr); //建立BufferedReader对象,并设定由br对象变量引
    String Line = br.readLine(); //读取一行数据
    out.println(Line + ""); //输出读取得的数据
    br.close(); //关闭BufferedReader对象
    fr.close(); //关闭文件
%>