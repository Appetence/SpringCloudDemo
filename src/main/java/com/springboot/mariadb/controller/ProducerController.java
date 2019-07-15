package com.springboot.mariadb.controller;

import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.mariadb.constant.Constant;
import com.springboot.mariadb.entity.MailSend;
import com.springboot.mariadb.enums.MailStatus;
import com.springboot.mariadb.enums.RedisPriorityQueue;
import com.springboot.mariadb.service.MailSendService;
import com.springboot.mariadb.util.FAsterJsonConvertUtil;
import com.springboot.mariadb.util.KeyUtil;

@RestController
@RequestMapping("Producer")
public class ProducerController {
	private static Logger logger = LoggerFactory.getLogger(ProducerController.class);
	@Autowired
	RedisTemplate<String,String> redistemplate;
	@Autowired
	MailSendService mailSendService;
	@RequestMapping(value = "/send" ,produces = {"application/json;charset=UTF-8"})
	public void send(@RequestBody(required= true)MailSend mailSend) throws Exception	{
		//MailSend mailSend = new MailSend();
		//mailSend.setSendTo(sendTo);
		logger.info("--"+mailSend.getSendTo());
		mailSend.setSendCount(0d);
		mailSend.setVersion(1d);
		logger.info("-----【id:{}， to:{}】------",mailSend.getSendTo(),mailSend.getSendCount());
		//校验传入数据
		
		//根据业务进行校验
		
		mailSend.setSendId(KeyUtil.generatorUUID());
		mailSend.setSendStatus(MailStatus.DRAFT.getCode());
		mailSend.setUpdateBy(Constant.SYS_RUNTIME);
		try {
			//写入数据库
			mailSendService.insert(mailSend);
			//投递到redis，更新数据库状态
			mailSendService.sendRedis(mailSend);
		}catch(SQLException  se) {
			// 处理 JDBC 错误
            se.printStackTrace();
            logger.error("处理 JDBC 错误:"+se.getMessage());
		}
		//try catch 
		//尽量缩小范围，记录日志 logger.error
		
	}
	
	
	//操作redis
	@RequestMapping(value = "/redisSend",method = RequestMethod.GET )
	public void redisSend() throws Exception	{
		try {
			logger.info("进来了:");
			ValueOperations<String ,String> ope = redistemplate.opsForValue();
			ope.set("age", "11");
			ope.set("name", "佐同学");
			ope.set("status", "1");
			logger.info("成功了:");
		}catch( Exception se) {
			// 处理 JDBC 错误
            se.printStackTrace();
            logger.error("处理 JDBC 错误:"+se.getMessage());
		}
	}
	@RequestMapping(value = "/redisDelete",method = RequestMethod.GET )
	public void redisDelete() throws Exception	{
		try {
			logger.info("进来了:");
			//ValueOperations<String ,String> ope = redistemplate.opsForValue();
			redistemplate.delete("name");
			logger.info("成功了:");
		}catch( Exception se) {
			// 处理 JDBC 错误
            se.printStackTrace();
            logger.error("处理 JDBC 错误:"+se.getMessage());
		}
	}
	
	
	
}
