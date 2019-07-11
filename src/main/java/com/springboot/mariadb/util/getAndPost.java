package com.springboot.mariadb.util;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

/**
 * 获取token
 * @author ThinkPad
 *
 */
public class getAndPost {
	private static final String Token = "LILUO"; 
		//{"access_token":"ACCESS_TOKEN","expires_in":7200}
	/*
	 * 错误时微信会返回错误码等信息，JSON数据包示例如下（该示例为AppID无效错误）:
	 * {"errcode":40013,"errmsg":"invalid appid"}
	 */
	
	
	/**
	 * 向指定的url发送get请求,获取token
	 * @param url
	 * @return
	 * @throws MalformedURLException
	 */
	public static String get(String url) {
		try {
			URL urlObject = new URL(url);
			//开始连接
			URLConnection connection = urlObject.openConnection();
			InputStream is = connection.getInputStream();
			byte [] b = new byte[1024];
			int len;
			StringBuilder sb = new StringBuilder();
			while((len =is.read(b))!=-1) {
				sb.append(new String(b,0,len));
			}
			return sb.toString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return null;
	}
	/**
	 * 	向指定url发送一个post请求，带着data数据
	 * @param url
	 * @param data
	 * @return
	 */
	public static String post(String url,String data) {
		try {
			//获取url
			URL urlObj = new URL(url);
			//开始连接
			URLConnection connection = urlObj.openConnection();
			//要发送数据必须设置数据发送状态；
			connection.setDoOutput(true);
			//获取输出流
			OutputStream os = connection.getOutputStream();
			//写出数据
			os.write(data.getBytes());
			//刷新，关流
			os.flush();
			os.close();
			InputStream is = connection.getInputStream();
			byte [] b = new byte[1024];
			int len;
			StringBuilder sb = new StringBuilder();
			while((len =is.read(b))!=-1) {
				sb.append(new String(b,0,len));
			}
			return sb.toString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
}
