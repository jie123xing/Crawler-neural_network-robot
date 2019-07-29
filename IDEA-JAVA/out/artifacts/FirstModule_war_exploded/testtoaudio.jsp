<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    public class WebTTs implements java.io.Serializable {
        // 合成webapi接口地址
        private static final String WEBTTS_URL = "http://api.xfyun.cn/v1/service/v1/tts";
        // 应用APPID（必须为webapi类型应用，并开通语音合成服务，参考帖子如何创建一个webapi应用：http://bbs.xfyun.cn/forum.php?mod=viewthread&tid=36481）
        private static final String APPID = "5d2f15c5";
        // 接口密钥（webapi类型应用开通合成服务后，控制台--我的应用---语音合成---相应服务的apikey）
        private static final String API_KEY = "ec20a25c274fc66d3fbb6a604a4cc41f";
        // 待合成文本
        private static String TEXT = "上海明天的天气怎么样";
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

        /**
         * 合成 WebAPI 调用示例程序
         *
         * //@param args
         * @throws IOException
         */
        public static void main(String[] args) throws IOException {
            System.out.println(TEXT);
            Map<String, String> header = buildHttpHeader();

            Map<String, Object> resultMap = HttpUtil.doPost2(WEBTTS_URL, header, "text=" + URLEncoder.encode(TEXT, "utf-8"));
            System.out.println("占用内存大小： "+ URLEncoder.encode(TEXT, "utf-8").getBytes().length);
            if ("audio/mpeg".equals(resultMap.get("Content-Type"))) { // 合成成功
                if ("raw".equals(AUE)) {
                    FileUtil.save("FirstModule\\web\\audio\\response\\", resultMap.get("sid") + ".wav", (byte[]) resultMap.get("body"));
                    System.out.println("合成 WebAPI 调用成功，音频保存位置：audio\\response\\" + resultMap.get("sid") + ".wav");
                } else {
                    FileUtil.save("FirstModule\\web\\audio\\response\\", resultMap.get("sid") + ".mp3", (byte[]) resultMap.get("body"));
                    System.out.println("合成 WebAPI 调用成功，音频保存位置：audio\\response\\" + resultMap.get("sid") + ".mp3");
                }
            } else { // 合成失败
                System.out.println("合成 WebAPI 调用失败，错误信息：" + resultMap.get("body").toString());//返回code为错误码时，请查询https://www.xfyun.cn/document/error-code解决方案
            }
        }

        /**
         * 组装http请求头
         */
        private static Map<String, String> buildHttpHeader() throws UnsupportedEncodingException {
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
            System.out.println("buildHttpHeader");
            return header;
        }
        //get set
        public String getTEXT()throws IOException{
            return TEXT;
        }
        public void setTEXT(String TEXT){
            this.TEXT=TEXT;
        }
    }
    //httputil
    public class HttpUtil {
        public HttpUtil() {
        }

        public static Map<String, Object> doPost2(String url, Map<String, String> header, String body) {
            Map<String, Object> resultMap = new HashMap();
            PrintWriter out = null;

            try {
                URL realUrl = new URL(url);
                URLConnection connection = realUrl.openConnection();
                HttpURLConnection httpURLConnection = (HttpURLConnection)connection;
                Iterator var8 = header.keySet().iterator();

                while(var8.hasNext()) {
                    String key = (String)var8.next();
                    httpURLConnection.setRequestProperty(key, (String)header.get(key));
                }

                httpURLConnection.setDoOutput(true);
                httpURLConnection.setDoInput(true);
                out = new PrintWriter(httpURLConnection.getOutputStream());
                out.print(body);
                out.flush();
                if (200 != httpURLConnection.getResponseCode()) {
                    System.out.println("Http 请求失败，状态码：" + httpURLConnection.getResponseCode());
                    return null;
                } else {
                    String responseContentType = httpURLConnection.getHeaderField("Content-Type");
                    if ("audio/mpeg".equals(responseContentType)) {
                        byte[] bytes = toByteArray(httpURLConnection.getInputStream());
                        resultMap.put("Content-Type", "audio/mpeg");
                        resultMap.put("sid", httpURLConnection.getHeaderField("sid"));
                        resultMap.put("body", bytes);
                        return resultMap;
                    } else {
                        BufferedReader in = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));

                        String line;
                        String result;
                        for(result = ""; (line = in.readLine()) != null; result = result + line) {
                        }

                        resultMap.put("Content-Type", "text/plain");
                        resultMap.put("body", result);
                        return resultMap;
                    }
                }
            } catch (Exception var12) {
                return null;
            }
        }

        public static String doPost1(String url, Map<String, String> header, String body) {
            String result = "";
            BufferedReader in = null;
            PrintWriter out = null;

            try {
                URL realUrl = new URL(url);
                URLConnection connection = realUrl.openConnection();
                HttpURLConnection httpURLConnection = (HttpURLConnection)connection;
                Iterator var9 = header.keySet().iterator();

                while(var9.hasNext()) {
                    String key = (String)var9.next();
                    httpURLConnection.setRequestProperty(key, (String)header.get(key));
                }

                httpURLConnection.setDoOutput(true);
                httpURLConnection.setDoInput(true);
                out = new PrintWriter(httpURLConnection.getOutputStream());
                out.print(body);
                out.flush();
                if (200 != httpURLConnection.getResponseCode()) {
                    System.out.println("Http 请求失败，状态码：" + httpURLConnection.getResponseCode());
                    return null;
                } else {
                    String line;
                    for(in = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream())); (line = in.readLine()) != null; result = result + line) {
                    }

                    return result;
                }
            } catch (Exception var11) {
                return null;
            }
        }

        private static byte[] toByteArray(InputStream in) throws IOException {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            boolean var3 = false;

            int n;
            while((n = in.read(buffer)) != -1) {
                out.write(buffer, 0, n);
            }

            return out.toByteArray();
        }
    }
    //fileutil
    public class FileUtil {
        /**
         * 读取文件内容为二进制数组
         *
         * @param filePath
         * @return
         * @throws IOException
         */
        public static byte[] read(String filePath) throws IOException {

            InputStream in = new FileInputStream(filePath);
            byte[] data = inputStream2ByteArray(in);
            in.close();

            return data;
        }

        /**
         * 流转二进制数组
         *
         * @param in
         * @return
         * @throws IOException
         */
        private static byte[] inputStream2ByteArray(InputStream in) throws IOException {

            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[1024 * 4];
            int n = 0;
            while ((n = in.read(buffer)) != -1) {
                out.write(buffer, 0, n);
            }
            return out.toByteArray();
        }

        /**
         * 保存文件
         *
         * @param filePath
         * @param fileName
         * @param content
         */
        public static void save(String filePath, String fileName, byte[] content) {
            try {
                File filedir = new File(filePath);
                if (!filedir.exists()) {
                    filedir.mkdirs();
                }
                File file = new File(filedir, fileName);
                OutputStream os = new FileOutputStream(file);
                os.write(content, 0, content.length);
                System.out.println("filesava");
                os.flush();
                os.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
%>
</body>
</html>
