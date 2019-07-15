package com.springboot.mariadb.service;

import org.springframework.web.bind.annotation.RequestBody;

import com.springboot.mariadb.entity.MailSend;

public interface MailSendService {
	public void insert(MailSend mailSend) throws Exception;
	
	public void sendRedis(MailSend mailSend) throws Exception	;
}
