package com.runoob;

import java.io.IOException;

public class StudentsBean implements java.io.Serializable {
    private String firstName = null;
    private String lastName = null;
    private int age = 0;
    private static String city = null;

    public StudentsBean() {
    }
    public String getFirstName(){
        return firstName;
    }
    public String getLastName(){
        return lastName;
    }
    public int getAge(){
        return age;
    }

    public void setFirstName(String firstName){
        this.firstName = firstName;
    }
    public void setLastName(String lastName){
        this.lastName = lastName;
    }
    public void setAge(int age) {
        this.age = age;
    }
    public void setcity(String city) {
        this.city = city;
    }
    public static String  mm() throws IOException {
        System.out.println("我在执行mm函数");
        return "ji789";
    }

    public static void main(String[] args) {
        System.out.println("我在执行main函数");
        System.out.println(city);

    }
}