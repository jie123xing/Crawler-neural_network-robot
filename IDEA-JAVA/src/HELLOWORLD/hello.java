package HELLOWORLD;

import java.io.UnsupportedEncodingException;

public class hello {
    public  static void main(String[] args) throws UnsupportedEncodingException {
        String  c ="北京:周五 07月26日,晴 南风转东南风,最低气温27度，最高气温36度。";
        System.out.println(new String(c.getBytes("utf-8"),"utf-8"));
        System.out.println(new String(c.getBytes("utf-8"),"ISO-8859-1"));
        String iosc=new String(c.getBytes("utf-8"),"ISO-8859-1");
        String gdkc="鍖椾含:鍛ㄤ簲 07鏈�26鏃�,鏅� 鍗楅杞笢鍗楅,鏈�浣庢皵娓�27搴︼紝鏈�楂樻皵娓�36搴︺��";
        System.out.println(new String(iosc.getBytes("ISO-8859-1"),"utf-8"));
        String srcString = "北京:周五 07月26日,晴 南风转东南风,最低气温27度，最高气温36度。";
        String utf2GbkString = new String(srcString.getBytes("UTF-8"),"GBK");
        System.out.println("UTF-8转换成GBK："+utf2GbkString);
        String utf2Gbk2UtfString = new String(utf2GbkString.getBytes("GBK"),"UTF-8");
        System.out.println("UTF-8转换成GBK再转成UTF-8："+utf2Gbk2UtfString);
    }
}
//北京:周五 07月26日,晴 南风转东南风,最低气温27度，最高气温36度。
//北京:周五 07�?26�?,�? 南风转东南风,�?低气�?27度，�?高气�?36度�??
//鍖椾含:鍛ㄤ簲 07鏈�26鏃�,鏅� 鍗楅杞笢鍗楅,鏈�浣庢皵娓�27搴︼紝鏈�楂樻皵娓�36搴︺�� gbk