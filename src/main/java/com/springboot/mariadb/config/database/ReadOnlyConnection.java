package com.springboot.mariadb.config.database;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

//注解类，用于强制读取从
//有一般情况就有特殊情况，特殊情况是某些情况下我们需要强制读主库，
//针对这种情况，我们定义一个主键，用该注解标注的就读主库
@Target({ElementType.METHOD,ElementType.TYPE})//仅用于方法上的注解,,,，，默认类型为TYPE类型
@Retention(RetentionPolicy.RUNTIME)//运行策略，在运行时执行
public @interface ReadOnlyConnection {

}
