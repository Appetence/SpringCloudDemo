package com.springboot.mariadb.util;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;

//自定义菜单工具类
public class BasicUtil {
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
			is.close();
			return sb.toString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
}
