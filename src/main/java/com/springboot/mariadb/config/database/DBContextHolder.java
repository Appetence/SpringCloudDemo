package com.springboot.mariadb.config.database;

import java.util.concurrent.atomic.AtomicInteger;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.springboot.mariadb.enums.DBTypeEnum;
//接下来，通过ThreadLocal将数据源设置到每个线程上下文中
public class DBContextHolder {
	public static Logger logger = LoggerFactory.getLogger(DBContextHolder.class);
	//为防止由于线程不安全造成服务器异常，默认是当前线程，返回类型为DBTypeEnum中的一种
    private static final ThreadLocal<DBTypeEnum> contextHolder = new ThreadLocal<DBTypeEnum>();

    private static final AtomicInteger counter = new AtomicInteger(-1);
    //为线程池变量设置一个类型
    public static void setDBType(DBTypeEnum dbType) {
    	if(dbType==null) {//线程异常，抛出空指针
    		throw new NullPointerException();
    	}
        contextHolder.set(dbType);
    }
    
    //获取线程类型
    public static DBTypeEnum getDBType() {
    	//若得到类型为null返回master主类型，否则返回得到得类型
        return contextHolder.get()==null?DBTypeEnum.MASTER:contextHolder.get();
    }

    //清除类型，不影响下一个线程操作
    public static void clearDBType() {
    	contextHolder.remove();
    }
    
    
    public static void master() {
        setDBType(DBTypeEnum.MASTER);
        logger.info("切换到master");
    }

    public static void slave() {
        logger.info("切换到slave数据源");
        //  轮询，切换数据库，			多次查询？？？
        int index = counter.getAndIncrement() % 2;
        if (counter.get() > 9999) {
            counter.set(-1);
        }
        if (index == 0) {
            setDBType(DBTypeEnum.SLAVE1);
            logger.info("执行slave1数据源");
        }
    }
}