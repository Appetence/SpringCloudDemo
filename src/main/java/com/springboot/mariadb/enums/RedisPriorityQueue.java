package com.springboot.mariadb.enums;

public enum RedisPriorityQueue {
	//7.8.9隐私，安全，交易
	FAST_QUEUE("fast"),
	//4.5.6活动通知类
	NORMAL_QUEUE("normal"),
	//1.2.3汇总调查
	DEFER_QUEUE("defer");
	
	private String code;
	
	private RedisPriorityQueue(String code) {
		this.code = code;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
}
