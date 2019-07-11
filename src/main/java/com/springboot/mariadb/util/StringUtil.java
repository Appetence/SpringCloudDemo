package com.springboot.mariadb.util;

import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil {
    /**
     * 检查字符串是否为null或者空
     *
     * */
    public static boolean isNotNullOrEmpty(final String str) {
        return null != str && !"".equals(str) && !"null".equals(str);
    }
    /**
     * 检查字符串是否为null或者空
     *
     * */
    public static boolean isNullOrEmpty(final String str) {
        return !isNotNullOrEmpty(str);
    }

    /**
     * 将字符串以逗号分割成为list
     * @param string
     * @return
     */
    public static List<String> arrayToList(String string){
        String[] array = string.split(",");
        List<String> paramList =java.util.Arrays.asList(array);
        return paramList;
    }
    /**
     * MD5加密
     *
     * @param str 加密字符串
     * @return 加密结果
     */
    public static String EncodeByMD5(final CharSequence str) {
        MessageDigest md5;
        md5 = null;

        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        BASE64Encoder base64Encoder = new BASE64Encoder();
        String newStr = null;
        try {
            newStr = base64Encoder.encode(md5.digest(str.toString().getBytes("utf-8")));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return newStr;
    }

    /**
     * 检测手机号是否符合格式
     *
     * */
    public static boolean checkPhone(String phoneNumber) {
        Pattern pattern = Pattern.compile("^1[3|4|5|7|8][0-9]{9}$");
        Matcher matcher = pattern.matcher(phoneNumber);
        return matcher.matches();
    }


    /**
     * 检测email是否符合格式
     *
     * */
    public static boolean checkEmail(String email) {
        Pattern pattern = Pattern.compile("^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+");
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }
}
