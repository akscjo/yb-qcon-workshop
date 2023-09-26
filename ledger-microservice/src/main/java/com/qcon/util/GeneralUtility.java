package com.qcon.util;

import com.qcon.model.Transaction;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

public class GeneralUtility {
    private static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    private static SecureRandom rnd = new SecureRandom();
    private static final String JSON_TEMPLATE="{name:}";

    public static void main(String[] args) {

    }

    public static String randomString(int len){
        StringBuilder sb = new StringBuilder(len);
        for(int i = 0; i < len; i++)
            sb.append(AB.charAt(rnd.nextInt(AB.length())));
        return sb.toString();
    }

    public static int randomIntegerVal(int min, int max){
        return ThreadLocalRandom.current().nextInt(min, max + 1);
    }

    public static int randomIntegerVal(){
        return randomIntegerVal(0,9999);
    }

    public static long randomLongVal(long min, long max){
        return ThreadLocalRandom.current().nextLong(min, max + 1);
    }

    public static List<Long> getRandomIds(int size){
        List<Long> list = new ArrayList<>();
        for(int i = 0; i < size; i++){
            list.add(randomLongVal(1,10000));
        }
        return list;
    }

    public static Transaction getRandomTransaction(){
        Transaction transaction = new Transaction();
        transaction.setAmount(randomIntegerVal());
        transaction.setFromAcct(randomString(10));
        transaction.setToAcct(randomString(10));
        transaction.setFromRoute(randomString(8));
        transaction.setToRoute(randomString(8));
        return transaction;
    }


}
