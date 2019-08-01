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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>录音转文字</title>
</head>
<body>
<%!
    private static final String URL = "http://openapi.xfyun.cn/v2/aiui";
    private static final String APPID = "5d2f15c5";
    private static final String API_KEY = "9d508d85caeece6f62dd5bd6f708110a";
    private static final String DATA_TYPE = "audio";
    private static final String SCENE = "main";
    private static final String SAMPLE_RATE = "16000";
    private static final String AUTH_ID = "cbdbacac792b7b2ff4e8821758d7019d";
    private static final String AUE = "raw";
    private static final String FILE_PATH = "F:\\weather\\weather1\\IDEA-JAVA\\FirstModule\\web\\response\\1.wav";
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
            out.write(buffer, 0, n);
        }
        byte[] data = out.toByteArray();
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
%>
<%
    Map<String, String> header = buildHeader();
    SmartUpload su = new SmartUpload();//新建一个SmartUpload对象
    su.getRequest().getParameterValues();取数组值
    su.getRequest().getParameter( );取单个参数单个值
    byte[] dataByteArray=request.getParameter(fd);
    //byte[] dataByteArray = readFile(FILE_PATH);
    String result = httpPost(URL, header, dataByteArray);
    //已经声明了会抛异常,那么在调用这个方法的时候,就必须做异常处理,
    try {
        JSONObject jsonObj = new JSONObject(result);
        String ss=jsonObj.getJSONArray("data").getJSONObject(0).getString("text");
        System.out.println(ss);
    } catch (JSONException e) {
        e.printStackTrace();
    }
%>
</body>
</html>
