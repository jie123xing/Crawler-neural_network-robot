<%@ page import="java.util.Map" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="org.apache.commons.codec.digest.DigestUtils" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLConnection" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="static org.apache.commons.io.IOUtils.toByteArray" %>
<%@ page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
    // 合成webapi接口地址
    private static final String WEBTTS_URL = "http://api.xfyun.cn/v1/service/v1/tts";
    // 应用APPID（必须为webapi类型应用，并开通语音合成服务，参考帖子如何创建一个webapi应用：http://bbs.xfyun.cn/forum.php?mod=viewthread&tid=36481）
    private static final String APPID = "5d2f15c5";
    // 接口密钥（webapi类型应用开通合成服务后，控制台--我的应用---语音合成---相应服务的apikey）
    private static final String API_KEY = "ec20a25c274fc66d3fbb6a604a4cc41f";
    // 待合成文本
    private static String TEXT = "上海明天的天气怎么样";
    private static String ssid = "0";
    private static String folder = "folder";
    private static String audiobase="";
    private static byte [] byte1;
    private static byte [] byte2;
    // 音频编码(raw合成的音频格式pcm、wav,lame合成的音频格式MP3)
    private static final String AUE = "raw";
    // 采样率
    private static final String AUF = "audio/L16;rate=16000";
    // 语速（取值范围0-100）
    private static final String SPEED = "50";
    // 音量（取值范围0-100）
    private static final String VOLUME = "50";
    // 音调（取值范围0-100）
    private static final String PITCH = "50";
    // 发音人（登陆开放平台https://www.xfyun.cn/后--我的应用（必须为webapi类型应用）--添加在线语音合成（已添加的不用添加）--发音人管理---添加发音人--修改发音人参数）
    private static final String VOICE_NAME = "xiaoyan";
    // 引擎类型
    private static final String ENGINE_TYPE = "intp65";
    // 文本类型（webapi是单次只支持1000个字节，具体看您的编码格式，计算一下具体支持多少文字）
    private static final String TEXT_TYPE = "text";

    public Map<String, String> buildHttpHeader() throws UnsupportedEncodingException {
        String curTime = System.currentTimeMillis() / 1000L + "";
        String param = "{\"auf\":\"" + AUF + "\",\"aue\":\"" + AUE + "\",\"voice_name\":\"" + VOICE_NAME + "\",\"speed\":\"" + SPEED + "\",\"volume\":\"" + VOLUME + "\",\"pitch\":\"" + PITCH + "\",\"engine_type\":\"" + ENGINE_TYPE + "\",\"text_type\":\"" + TEXT_TYPE + "\"}";
        String paramBase64 = new String(Base64.encodeBase64(param.getBytes("UTF-8")));
        String checkSum = DigestUtils.md5Hex(API_KEY + curTime + paramBase64);
        Map<String, String> header = new HashMap<String, String>();
        header.put("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
        header.put("X-Param", paramBase64);
        header.put("X-CurTime", curTime);
        header.put("X-CheckSum", checkSum);
        header.put("X-Appid", APPID);
        return header;
    }
    public static void save(String filePath, String fileName, byte[] content) {
        try {
            File filedir = new File(filePath);
            if (!filedir.exists()) {
                filedir.mkdirs();
                //System.out.println("mkdirs");
            }
            File file = new File(filePath, fileName);
            OutputStream os = new FileOutputStream(file);
            os.write(content, 0, content.length);
            os.flush();
            os.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public static Map<String, Object> doPost2(String url, Map<String, String> header, String body) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        PrintWriter out = null;
        try {
            // 设置 url
            URL realUrl = new URL(url);
            URLConnection connection = realUrl.openConnection();
            HttpURLConnection httpURLConnection = (HttpURLConnection) connection;
            // 设置 header
            for (String key : header.keySet()) {
                httpURLConnection.setRequestProperty(key, header.get(key));
            }
            // 设置请求 body
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setDoInput(true);
            out = new PrintWriter(httpURLConnection.getOutputStream());
            // 保存body
            out.print(body);
            // 发送body
            out.flush();
            if (HttpURLConnection.HTTP_OK != httpURLConnection.getResponseCode()) {
                System.out.println("Http 请求失败，状态码：" + httpURLConnection.getResponseCode());
                return null;
            }
            // 获取响应header
            String responseContentType = httpURLConnection.getHeaderField("Content-Type");
            if ("audio/mpeg".equals(responseContentType)) {
                // 获取响应body
                byte[] bytes = toByteArray(httpURLConnection.getInputStream());
                resultMap.put("Content-Type", "audio/mpeg");
                resultMap.put("sid", httpURLConnection.getHeaderField("sid"));
                resultMap.put("body", bytes);
                return resultMap;
            } else {
                // 设置请求 body
                BufferedReader in = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
                String line;
                String result = "";
                while ((line = in.readLine()) != null) {
                    result += line;
                }
                resultMap.put("Content-Type", "text/plain");
                resultMap.put("body", result);

                return resultMap;
            }
        } catch (Exception e) {
            return null;
        }
    }
%>
<%
    TEXT=request.getParameter("text");
    ssid=request.getParameter("ssid");
    folder =request.getParameter("folder");
    System.out.println(TEXT+"****"+ folder +"****"+ssid);
    Map<String, String> header = buildHttpHeader();
    Map<String, Object> resultMap = doPost2(WEBTTS_URL, header, "text=" + URLEncoder.encode(TEXT, "utf-8"));
    if ("audio/mpeg".equals(resultMap.get("Content-Type"))) { // 合成成功
        if ("raw".equals(AUE)) {
            audiobase=java.util.Base64.getEncoder().encodeToString((byte[]) resultMap.get("body"));//1编码
            System.out.println(audiobase);
            //save(request.getSession().getServletContext().getRealPath("")+"\\"+folder+"\\" , ssid + ".wav", (byte[]) resultMap.get("body"));
            //linux;save(request.getSession().getServletContext().getRealPath("")+folder+"\/" , ssid + ".wav", (byte[]) resultMap.get("body"));
            //save("F:\\weather\\weather1\\IDEA-JAVA\\FirstModule\\web\\"+folder+"\\",ssid + ".wav",byte2);//idea中调试的地址
            //System.out.println("合成 WebAPI 调用成功，音频保存位置:" + request.getSession().getServletContext().getRealPath("")+"\\"+folder+"\\" + ssid + ".wav");
        } else {
            save("F:\\weather\\weather1\\IDEA-JAVA\\FirstModule\\web\\audio\\response\\", ssid + ".mp3", (byte[]) resultMap.get("body"));
            System.out.println("合成 WebAPI 调用成功，音频保存位置：F:\\weather\\weather1\\IDEA-JAVA\\FirstModule\\web\\audio\\response\\" + ssid + ".mp3");
        }
    }
    else { // 合成失败
        System.out.println("合成 WebAPI 调用失败，错误信息：" + resultMap.get("body").toString());//返回code为错误码时，请查询https://www.xfyun.cn/document/error-code解决方案
    }
%>

<%=audiobase%>

