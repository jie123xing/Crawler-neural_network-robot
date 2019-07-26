package HELLOWORLD;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.*;
import java.io.IOException;
public class http {
    public static void main(String[] args) {
        /*
        try {
            URL url = new URL("http://www.tuling123.com/openapi/api?key=3e661c1a04574ce6aeec858e03a6ad62&info=%E8%AE%B2%E4%B8%AA%E7%AC%91%E8%AF%9D");
            URLConnection urlConnection = url.openConnection();
            HttpURLConnection connection = null;
            if (urlConnection instanceof HttpURLConnection) {
                connection = (HttpURLConnection) urlConnection;
            } else {
                System.out.println("请输入 URL 地址");
                return;
            }
            BufferedReader in = new BufferedReader(
                    new InputStreamReader(connection.getInputStream()));
            String urlString = "";
            String current;
            while ((current = in.readLine()) != null) {
                urlString += current;
            }
            System.out.println(urlString);
        } catch (IOException e) {
            e.printStackTrace();
        }*/

    }
}
