package com.springboot.mariadb.constant;
@SuppressWarnings("unused")
public final class Constant {

	public Constant() {
		super();
		// TODO Auto-generated constructor stub
	}
	private static final String SPRING_PROFILE_DEVELOPMENT="dev";//开发环境 
	private static final String SPRING_PROFILE_PRODUCTION="prod";//生成环境
	private static final String SPRING_PROFILE_LOCATION="local";//本地环境
	/**判断代码，是*/
	private static final String TRUE ="1";
	/**判断代码，否*/
	private static final String FALSE="0";
	
	/**无关联记录*/
	private static final String NO_FOREIGN_REF="0";
	/**通用字符集编码*/
	private static final String CHARSET_UTF_8 = "UTF-8";
	/**中文字符集编码*/
	private static final String CHARSET_CHINESE = "GBK";
	/**英文字符集编码*/
	private static final String CHARSET_LATIN = "ISO-8859-1";
	/**根节点*/
	private static final String ROOT_ID = "root";
	/**空字符串*/
	private static final String NULL = "null";
	/**本机ip*/
	private static final String LOCALHOST = "localhost";
	/**格式化时间*/
	private static final String FORMAT_DATE = "yyyy-MM-dd";
	/**格式化时间——短格式 yyyyMMdd*/
	private static final String FORMAT_DATE_SHORT = " yyyyMMdd";
	/**格式化时间 yyyy-MM-dd HH:mm:ss*/
	private static final String FORMAT_DATETIME = "yyyy-MM-dd HH:mm:ss";
	/**格式化时间——短格式yyyyMMddHHmmss*/
	private static final String FORMAT_DATETIME_SHORT = "yyyyMMddHHmmss";
	/**格式化时间  时间戳格式 yyyy-MM-dd HH:mm:ss.SSS */
	private static final String FORMAT_TIMESTAMP = "yyyy-MM-dd HH:mm:ss.SSS";
	/**格式化时间  短时间戳格式    yyyyMMddHHmmssSSS*/
	private static final String FORMAT_TIMESTAMP_SHORT = "yyyyMMddHHmmssSSS";
	/**成功*/
	private static final String SUCCESS =  "success";
	/**失败*/
	private static final String FAILURE = "failure";
	/**下划线分割符*/
	private static final String	UNDERLINE_SPLIT = "_";
	/**逗号分隔符*/
	private static final String COMMA_SPLIT = ",";
	/**操作人：系统（运行时）*/
	private static final String SYS_RUNTIME = "SYSRUNTIME";
	/**操作人：系统（初始化时）*/
	private static final String SYS_INIT = "SUSINIT";
}
