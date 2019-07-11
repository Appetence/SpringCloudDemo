package com.springboot.mariadb;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import tk.mybatis.spring.annotation.MapperScan;

@EnableWebMvc		//启动springmvc
@Configurable	//配置类
//将spring boot自带的DataSourceAutoConfiguration禁掉，因为它会读取application.properties文件的spring.datasource.*属性并自动配置单数据源
@SpringBootApplication(exclude = DataSourceAutoConfiguration.class,scanBasePackages="com.springboot.mariadb.*")//全局扫描
@MapperScan(basePackages="com.springboot.mariadb.mapper")//scan DAO
public class MainConfig {

}
