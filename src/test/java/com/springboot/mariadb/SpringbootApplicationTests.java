package com.springboot.mariadb;

import java.sql.Connection;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = SpringbootApplication.class)
public class SpringbootApplicationTests {
	private static Logger logger = LoggerFactory.getLogger(SpringbootApplicationTests.class);

	@Resource(name = "slaveDataSource")
    private DataSource slaveDataSource;
	@Resource(name = "masterDataSource")
    private DataSource masterDataSource;
	@Test
	public void context() throws SQLException {
		
		Connection cmt = masterDataSource.getConnection("root", "root");
		logger.info("cmt:"+cmt.getMetaData().getURL());//打印链接地址
		Connection cs1 = slaveDataSource.getConnection("root", "root");
		logger.info("cs1:"+cs1.getMetaData().getURL());
	}


}
