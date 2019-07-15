package com.springboot.mariadb.enums;

public enum MailStatus {
	//暂存
	DRAFT("0"),
	//发送中，已经进入队列
	SEND_IN("1"),
	//发送成功
	NEED_OK("2"),
	//发送失败
	NEED_ERROR("3");
	
	private String code;
	
	private MailStatus (String code) {
		this.code = code;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	
	
}
