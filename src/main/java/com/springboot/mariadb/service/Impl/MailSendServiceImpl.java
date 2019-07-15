package com.springboot.mariadb.service.Impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.springboot.mariadb.entity.MailSend;
import com.springboot.mariadb.enums.MailStatus;
import com.springboot.mariadb.enums.RedisPriorityQueue;
import com.springboot.mariadb.mapper.MailSend1Mapper;
import com.springboot.mariadb.mapper.MailSend2Mapper;
import com.springboot.mariadb.service.MailSendService;
import com.springboot.mariadb.util.FAsterJsonConvertUtil;

@Service
public class MailSendServiceImpl implements MailSendService{
	private static Logger logger = LoggerFactory.getLogger(MailSendServiceImpl.class);
	
	@Autowired
	MailSend1Mapper MailSend1Mapper;
	@Autowired
	MailSend2Mapper MailSend2Mapper;
	@Autowired
	RedisTemplate<String,String> redistemplate;
	
	@Override
	public void insert(MailSend mailSend) throws Exception {
			//KeyUtil = uuid
		int hashCode = mailSend.getSendId().hashCode();
		if(hashCode % 2 == 0) {
			MailSend1Mapper.insert(mailSend);
		}else {
			MailSend2Mapper.insert(mailSend);
		}
		
	}
	//消息投递到redis
	@Override
	public void sendRedis(MailSend mailSend) throws Exception	{
		try {
			logger.info("进来了:"+Thread.currentThread().getStackTrace()[1].getMethodName());
			ListOperations<String ,String> ope = redistemplate.opsForList();
			//优先级
			Double priority = mailSend.getSendPriority();
			Long ret = 0L;
			Long size = 0L;
			
			logger.info("成功了:");
			
			if(priority < 4d) {
				//优先级 1.2.3		延时队列
				ret = ope.rightPush(RedisPriorityQueue.DEFER_QUEUE.getCode(), FAsterJsonConvertUtil.converObjectToString(mailSend));
				size = ope.size(RedisPriorityQueue.DEFER_QUEUE.getCode());
			}else if(priority > 3d && priority < 7d){
				//优先级 4.5.6       普通队列
				ret = ope.rightPush(RedisPriorityQueue.NORMAL_QUEUE.getCode(), FAsterJsonConvertUtil.converObjectToString(mailSend));
				size = ope.size(RedisPriorityQueue.NORMAL_QUEUE.getCode());
			}else {
				//优先级  7.8.9    紧急队列
				ret = ope.rightPush(RedisPriorityQueue.FAST_QUEUE.getCode(), FAsterJsonConvertUtil.converObjectToString(mailSend));
				size = ope.size(RedisPriorityQueue.FAST_QUEUE.getCode());
			}
			//success
			if(ret==size) {
				if(mailSend.getSendCount()== 0 || mailSend.getSendCount()==0.0) {
					logger.info("-------初始化count{}-------------",mailSend.getSendCount());
					mailSend.setSendCount(Double.parseDouble("1"));
				}else {
					mailSend.setSendCount(mailSend.getSendCount()+Double.parseDouble("1"));
				}
				
				//发送到队列中去
				mailSend.setSendStatus(MailStatus.SEND_IN.getCode());
				if(mailSend.getSendId().hashCode() % 2 == 0) {
					
					MailSend1Mapper.updateByPrimaryKeySelective(mailSend);
					
				}else {
					
					MailSend2Mapper.updateByPrimaryKeySelective(mailSend);
					
				}
				logger.info("-------进入队列成功--------当前id：{}-------------",mailSend.getSendId());
			}else {
				mailSend.setSendCount(mailSend.getSendCount()+1d);
				//fail
				mailSend.setSendStatus(MailStatus.SEND_IN.getCode());
				if(mailSend.getSendId().hashCode() % 2 == 0) {
					
					MailSend1Mapper.updateByPrimaryKeySelective(mailSend);
					
				}else {
					
					MailSend2Mapper.updateByPrimaryKeySelective(mailSend);
					
				}
				logger.info("-------进入队列失败成功--------当前id：{ }---------等待轮询机制重新执行----",mailSend.getSendId());
			
			}
			
		}catch( Exception se) {
			// 处理 JDBC 错误
            se.printStackTrace();
            logger.error("处理 JDBC 错误:"+se.getMessage());
		}
	}
	
	
	
}
