package com.cakesale.util;


import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class SmsUtil {
    public static boolean send(String mobile,String num){
        String url="http://v.juhe.cn/sms/send";
        String code= URLEncoder.encode("#code#="+num);
        String param = "mobile=" + mobile + "&tpl_id=" + 113474 + "&tpl_value=" + code + "&key=c040f0c304fb6707716a93715619106b";
        String result= HTTPUtil.httpPost(url,param,"utf-8");
        System.out.println(result);
        Map<String,Object> json=(HashMap) JsonUtil.getObj(result, HashMap.class);
       if(0 == (int)json.get("error_code")){
           return true;

       }
       return false;
    }
    public static String getRandomCode(int len) {
        Random random = new Random();
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < len; i++) {
            builder.append(random.nextInt(10));
        }
        return builder.toString();
    }


}
