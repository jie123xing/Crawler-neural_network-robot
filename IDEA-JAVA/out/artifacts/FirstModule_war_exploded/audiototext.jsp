<%@ page import="java.util.Map" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="org.apache.commons.codec.digest.DigestUtils" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONException" %>
<%@ page import="com.sun.net.httpserver.HttpContext" %>
<%@ page import="sun.misc.Request" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
    private static final String URL = "http://openapi.xfyun.cn/v2/aiui";
    private static final String APPID = "5d2f15c5";
    private static final String API_KEY = "9d508d85caeece6f62dd5bd6f708110a";
    private static final String DATA_TYPE = "audio";
    private static final String SCENE = "main";
    private static final String SAMPLE_RATE = "16000";
    private static final String AUTH_ID = "cbdbacac792b7b2ff4e8821758d7019d";
    private static final String AUE = "raw";
    private static String FILE_PATH = "I:\\程序集\\weather1\\IDEA-JAVA\\FirstModule\\web\\response\\1.wav";
    // 个性化参数，需转义
    private static final String PERS_PARAM = "{\\\"auth_id\\\":\\\"2894c985bf8b1111c6728db79d3479ae\\\"}";

    private static Map<String, String> buildHeader() throws UnsupportedEncodingException, ParseException {
        String curTime = System.currentTimeMillis() / 1000L + "";
        String param = "{\"aue\":\""+AUE+"\",\"sample_rate\":\""+SAMPLE_RATE+"\",\"auth_id\":\""+AUTH_ID+"\",\"data_type\":\""+DATA_TYPE+"\",\"scene\":\""+SCENE+"\"}";
        //使用个性化参数时参数格式如下：
        //String param = "{\"aue\":\""+AUE+"\",\"sample_rate\":\""+SAMPLE_RATE+"\",\"auth_id\":\""+AUTH_ID+"\",\"data_type\":\""+DATA_TYPE+"\",\"scene\":\""+SCENE+"\",\"pers_param\":\""+PERS_PARAM+"\"}";
        String paramBase64 = new String(Base64.encodeBase64(param.getBytes("UTF-8")));
        String checkSum = DigestUtils.md5Hex(API_KEY + curTime + paramBase64);

        Map<String, String> header = new HashMap<String, String>();
        header.put("X-Param", paramBase64);
        header.put("X-CurTime", curTime);
        header.put("X-CheckSum", checkSum);
        header.put("X-Appid", APPID);
        return header;
    }

    private static byte[] readFile(String filePath) throws IOException {
        InputStream in = new FileInputStream(filePath);
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024 * 4];
        int n = 0;
        while ((n = in.read(buffer)) != -1) {
            System.out.println(buffer);
            out.write(buffer, 0, n);
        }
        System.out.println(out);
        byte[] data = out.toByteArray();
        System.out.println(data);
        in.close();
        return data;
    }

    private static String httpPost(String url, Map<String, String> header, byte[] body) {
        String result = "";
        BufferedReader in = null;
        OutputStream out = null;
        try {
            java.net.URL realUrl = new URL(url);
            HttpURLConnection connection = (HttpURLConnection)realUrl.openConnection();
            for (String key : header.keySet()) {
                connection.setRequestProperty(key, header.get(key));
            }
            connection.setDoOutput(true);
            connection.setDoInput(true);

            //connection.setConnectTimeout(20000);
            //connection.setReadTimeout(20000);
            try {
                out = connection.getOutputStream();
                out.write(body);
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                in = new BufferedReader(new InputStreamReader(connection.getInputStream(),"utf-8"));
                String line;
                while ((line = in.readLine()) != null) {
                    result += line;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    String ss;
%>
<%
    //FILE_PATH=request.getSession().getServletContext().getRealPath("")+"\\response\\2.wav";
    Map<String, String> header = buildHeader();
    //byte[] dataByteArray = readFile(FILE_PATH);
    //String result = httpPost(URL, header, dataByteArray);
    //已经声明了会抛异常,那么在调用这个方法的时候,就必须做异常处理,
    /*
    try {
        JSONObject jsonObj = new JSONObject(result);
        String ss=jsonObj.getJSONArray("data").getJSONObject(0).getString("text");
        System.out.println("转的文本是："+ss);
    } catch (JSONException e) {
        e.printStackTrace();
    }
     */

System.out.println("t:"+request.getParameter("t"));
String t=request.getParameter("t");
String[] tbase=t.split(",");
System.out.println(tbase[1]);
System.out.println(tbase[1].length());
    tbase[1] = tbase[1].replaceAll(" ","+");
byte[] base64= java.util.Base64.getDecoder().decode(tbase[1]);
    System.out.println(base64);
String result1 = httpPost(URL, header,base64 );

System.out.println(result1);
    try {
        JSONObject jsonObj = new JSONObject(result1);
        ss=jsonObj.getJSONArray("data").getJSONObject(0).getString("text");
        System.out.println("转的文本是："+ss);
    } catch (JSONException e) {
        e.printStackTrace();
    }
%>
<%=ss%>

