package com.springboot.mariadb.util;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;

public class FAsterJsonConvertUtil {
	private static final SerializerFeature [] featuresWithNullValue = {SerializerFeature.WriteMapNullValue,SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse,
																				SerializerFeature.WriteNullNumberAsZero,SerializerFeature.WriteNullStringAsEmpty};
	
	/**
	 * 将json字符串转换为实体类对象
	 * @param data  json字符串
	 * @param clas 	转换对象
	 * @return
	 */
	public static <T> T converJsonToObject(String data ,Class<T> clazz) {
		try {
			T t = JSON.parseObject(data,clazz);
			return t;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	/**
	 * 将JSONObject对象转换为实体类对象
	 * @param data	jsonobjct对象
	 * @param clas	转换对象
	 * @return
	 */
	public static <T> T converJsonToObject(JSONObject data ,Class<T> clazz) {
		
		try {
			T t = JSON.toJavaObject(data, clazz);
			return t;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	/**
	 * 	将json字符串数组转换为list集合对象
	 * @param data	json字符串数组
	 * @param clazz	转换为list对象
	 * @return
	 */
	public static <T> List<T> converJsonToArray(String data ,Class<T> clazz){
		
		try {
			List<T> t = JSON.parseArray(data,clazz);
			return t;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
	
	/**
	 * 将list装换为list对象
	 * @param data
	 * @param clazz
	 * @return
	 */
	public static <T> List<T> converJsonToArray(List<JSONObject> data ,Class<T> clazz){
		
		try {
			List<T> t = new ArrayList<T>();
			for(JSONObject jsonObject : data) {
				t.add(converJsonToObject(jsonObject,clazz));
			}
			return t;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
	
	/**
	 * 将对象转换为json串
	 * @param obj
	 * @return
	 */
	public static String converObjectToString(Object obj) {
		
		try {
			String text = JSON.toJSONString(obj);
			return text;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	/**
	 * 对象转换为JSONObject对象
	 * @param obj
	 * @return
	 */
	public static JSONObject converObjectToJSONObject(Object obj) {
		try {
			JSONObject jsonObject =  (JSONObject)JSONObject.toJSON(obj);
			return jsonObject;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	/**
	 * 排除空对象,转为json字符串
	 * @param obj
	 * @return
	 */
	public static String converObjectToJSONObjectWithNullValue(Object obj) {
		
		
		try {
			String text = JSON.toJSONString(obj,featuresWithNullValue);
			return text;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
}
