package com.springboot.mariadb.config.database;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.aspectj.apache.bcel.util.ClassLoaderRepository;
import org.aspectj.apache.bcel.util.ClassLoaderRepository.SoftHashMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import com.springboot.mariadb.enums.DBTypeEnum;

/***
 * spring中配置多数据源
 * 
 * @author Administrator
 *
 */
@Configuration
@EnableTransactionManagement // 开启事务
public class DataSourceConfiguration {
	private static Logger logger = LoggerFactory.getLogger(DataSourceConfiguration.class);
	@Value("${druid.type}")
	private Class<? extends DataSource> dataSourceType;

	// 主数据源注入到bean中
	@Bean("masterDataSource")
	@Primary // 相同类型数据源，优先选择该数据源作为连接对象
	@ConfigurationProperties(prefix = "druid.master") // yml中对应属性前缀
	public DataSource masterDataSource() throws SQLException {
		DataSource masterDataSource = DataSourceBuilder.create().type(dataSourceType).build();
		logger.info("==== MASTER ====" + masterDataSource);
		return masterDataSource;
	}

	// 从数据源注入到bean中
	@Bean("slaveDataSource")
	@ConfigurationProperties(prefix = "druid.slave") // yml中对应属性前缀
	public DataSource slaveDataSource() {
		DataSource slaveDataSource = DataSourceBuilder.create().type(dataSourceType).build();
		logger.info("==== SLAVE ====" + slaveDataSource);
		return slaveDataSource;
	}
	/*
	// 动态路由数据源，根据需求转换具体使用哪个数据源
	@SuppressWarnings("unchecked")
	@Bean
	public DataSource myRoutingDataSource(@Qualifier("masterDataSource") DataSource masterDataSource,
			@Qualifier("slaveDataSource") DataSource slave1DataSource) {
		//mybatis提供的底层map类
		SoftHashMap targetDataSources = new ClassLoaderRepository.SoftHashMap();
		//设置键值对，区分使用哪个数据源
		targetDataSources.put(DBTypeEnum.MASTER, masterDataSource);
		targetDataSources.put(DBTypeEnum.SLAVE1, slave1DataSource);
		//继承了AbstractRoutingDataSource的类
		MyRoutingDataSource myRoutingDataSource = new MyRoutingDataSource();
		myRoutingDataSource.setDefaultTargetDataSource(masterDataSource);//设置默认的数据源
		myRoutingDataSource.setTargetDataSources(targetDataSources);//装入存有主从数据源的map
		return myRoutingDataSource;
	}
	*/
	// 下面的1和2是配置Druid的监控
	// 自己手写的servlet注入到spring容器中执行方法
	// 将druid的servlet注入到spring容器中
	@Bean
	public ServletRegistrationBean druidServlet() {
		/*
		 * 方式1，暂时不用，使用方式2 ServletRegistrationBean<StatViewServlet> reg = new
		 * ServletRegistrationBean<StatViewServlet>(); reg.setServlet(new
		 * StatViewServlet()); reg.addUrlMappings("/druid/*");//过滤时候开放地址
		 * reg.addInitParameter("allow","");//默认就是允许所有访问
		 * reg.addInitParameter("deny","");//黑名单的IP
		 * logger.info("druid console manager init"); return reg;
		 */
		ServletRegistrationBean bean = new ServletRegistrationBean(new StatViewServlet(), "/druid/*");
		Map<String, String> initParams = new HashMap<>();
		initParams.put("loginUsername", "admin");// 登录druid监控的账户
		initParams.put("loginPassword", "admin");// 登录druid监控的密码
		//initParams.put("allow", "");// 默认就是允许所有访问
		initParams.put("allow", "192.168.233.1");// 默认就是允许所有访问
		initParams.put("deny", "192.168.233.111");// 黑名单的IP

		bean.setInitParameters(initParams);

		logger.info("druid console manager init");
		return bean;

	}

	// druid配置web监听filter
	@Bean
	public FilterRegistrationBean<WebStatFilter> filterRegistrationBean() {
		FilterRegistrationBean<WebStatFilter> filterRegistrationBean = new FilterRegistrationBean<WebStatFilter>();
		filterRegistrationBean.setFilter(new WebStatFilter());
		filterRegistrationBean.setUrlPatterns(Arrays.asList("/*"));// setUrlPatterns()将一个arrays转换为list
		Map<String, String> initParams = new HashMap<>();
		initParams.put("exclusions", "*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*");
		filterRegistrationBean.setInitParameters(initParams);
		//未使用和上一步同理
		//filterRegistrationBean.addInitParameter("exclusions", "*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*");
		logger.info("druid file register : {}" + filterRegistrationBean);
		return filterRegistrationBean;

	}

}
