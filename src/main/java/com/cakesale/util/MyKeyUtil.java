package com.cakesale.util;

import java.util.Random;

public class MyKeyUtil {
    public static String getRandomStr(int num) {
        String src = "abcdefghijklmnopqrstuvwxyz-0123456789-ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        return getRandom(num,src);
    }

    /**
     * @param num 位数
     */
    public static String getRandomNum(int num) {
        String src = "0123456789";
        return getRandom(num,src);
    }

    private static String getRandom(int num, String src) {
        Random random = new Random();
        int length = src.length();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < num; i++) {
            sb.append(src.charAt(random.nextInt(length)));
        }
        return sb.toString();
    }
}
