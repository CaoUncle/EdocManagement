package cn.edoc.test;

import java.util.regex.Pattern;

import static java.lang.Character.isLetter;

public class Test{

    public static void main(String[] args) {
        String a="abcde";
        String b="";
        for (int i = 0; i < a.length(); i++) {
            b=b+a.charAt(a.length()-1-i);
        }
        System.out.println(b);
    }
}
