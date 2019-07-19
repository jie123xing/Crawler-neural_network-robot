package 图灵机器人;

import java.util.Scanner;

public class tulingrobut {
    public static void main(String[] args) {
        //声明并实例化我们刚刚封装好的工具类
        Util util = new Util();
        //接收用户输入
        Scanner scanner = new Scanner(System.in);
        while (scanner.hasNext()){
            //直接输出机器人的回复
            System.err.println("图灵机器人 -> " + util.getMessage(scanner.nextLine()));
        }
    }
}
