package com.cakesale.test;

import java.util.LinkedHashMap;
import java.util.Map;

public class LinkedHashMapSample {
    public static void main(String[] args) {
        LinkedHashMap<String, String> sampleMap = new LinkedHashMap(16, 0.75F, true) {

            @Override
            protected boolean removeEldestEntry(Map.Entry eldest) {//实现自定义删除方法
                return size() > 3;
            }
        };

        sampleMap.put("P1", "1");
        sampleMap.put("P2", "2");
        sampleMap.put("P3", "3");

        sampleMap.forEach((k, v) -> System.out.println(k + ":" + v));
        sampleMap.get("P1");
        sampleMap.get("P1");
        sampleMap.get("P3");
        System.out.println("=== Iterator ===");
        sampleMap.forEach((k, v) -> System.out.println(k + ":" + v));

        System.out.println("=== remove ===");
        sampleMap.put("P4", "4");
        System.out.println("=== remove ===");

        sampleMap.forEach((k, v) -> System.out.println(k + ":" + v));
    }
}
