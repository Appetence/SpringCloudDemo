package com.springboot.mariadb.constant;
@SuppressWarnings("unused")
public final class Constant {

	public Constant() {
		super();
		// TODO Auto-generated constructor stub
	}
	public static final String SPRING_PROFILE_DEVELOPMENT="dev";//开发环境 
	public static final String SPRING_PROFILE_PRODUCTION="prod";//生成环境
	public static final String SPRING_PROFILE_LOCATION="local";//本地环境
	/**判断代码，是*/
	public static final String TRUE ="1";
	/**判断代码，否*/
	public static final String FALSE="0";
	
	/**无关联记录*/
	public static final String NO_FOREIGN_REF="0";
	/**通用字符集编码*/
	public static final String CHARSET_UTF_8 = "UTF-8";
	/**中文字符集编码*/
	public static final String CHARSET_CHINESE = "GBK";
	/**英文字符集编码*/
	public static final String CHARSET_LATIN = "ISO-8859-1";
	/**根节点*/
	public static final String ROOT_ID = "root";
	/**空字符串*/
	public static final String NULL = "null";
	/**本机ip*/
	public static final String LOCALHOST = "localhost";
	/**格式化时间*/
	public static final String FORMAT_DATE = "yyyy-MM-dd";
	/**格式化时间——短格式 yyyyMMdd*/
	public static final String FORMAT_DATE_SHORT = " yyyyMMdd";
	/**格式化时间 yyyy-MM-dd HH:mm:ss*/
	public static final String FORMAT_DATETIME = "yyyy-MM-dd HH:mm:ss";
	/**格式化时间——短格式yyyyMMddHHmmss*/
	public static final String FORMAT_DATETIME_SHORT = "yyyyMMddHHmmss";
	/**格式化时间  时间戳格式 yyyy-MM-dd HH:mm:ss.SSS */
	public static final String FORMAT_TIMESTAMP = "yyyy-MM-dd HH:mm:ss.SSS";
	/**格式化时间  短时间戳格式    yyyyMMddHHmmssSSS*/
	public static final String FORMAT_TIMESTAMP_SHORT = "yyyyMMddHHmmssSSS";
	/**成功*/
	public static final String SUCCESS =  "success";
	/**失败*/
	public static final String FAILURE = "failure";
	/**下划线分割符*/
	public static final String	UNDERLINE_SPLIT = "_";
	/**逗号分隔符*/
	public static final String COMMA_SPLIT = ",";
	/**操作人：系统（运行时）*/
	public static final String SYS_RUNTIME = "SYSRUNTIME";
	/**操作人：系统（初始化时）*/
	public static final String SYS_INIT = "SUSINIT";
}
