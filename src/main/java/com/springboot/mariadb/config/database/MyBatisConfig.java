package com.springboot.mariadb.config.database;

import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.apache.ibatis.mapping.DatabaseIdProvider;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.aspectj.apache.bcel.util.ClassLoaderRepository;
import org.aspectj.apache.bcel.util.ClassLoaderRepository.SoftHashMap;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.boot.autoconfigure.ConfigurationCustomizer;
import org.mybatis.spring.boot.autoconfigure.MybatisAutoConfiguration;
import org.mybatis.spring.boot.autoconfigure.MybatisProperties;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ResourceLoader;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;
import org.springframework.transaction.PlatformTransactionManager;

import com.springboot.mariadb.enums.DBTypeEnum;
//由于Spring容器中现在有2个数据源，所以我们需要为事务管理器和MyBatis手动指定一个明确的数据源
//@EnableTransactionManagement
@Configuration
@AutoConfigureAfter(value={DataSourceConfiguration.class})//配置数据源当DataSourceConfiguration加载完成之后加载
public class MyBatisConfig extends MybatisAutoConfiguration{//继承mybatisautoconfiguration功能类似mybatis.xml
	
	
	
	public MyBatisConfig(MybatisProperties properties, ObjectProvider<Interceptor[]> interceptorsProvider,
			ResourceLoader resourceLoader, ObjectProvider<DatabaseIdProvider> databaseIdProvider,
			ObjectProvider<List<ConfigurationCustomizer>> configurationCustomizersProvider) {
		super(properties, interceptorsProvider, resourceLoader, databaseIdProvider, configurationCustomizersProvider);
	}


   /*
	@Resource(name = "myRoutingDataSource")
    private DataSource myRoutingDataSource;
	*/
	@Resource(name = "slaveDataSource")
    private DataSource slaveDataSource;
	@Resource(name = "masterDataSource")
    private DataSource masterDataSource;
	
	//sqlsessionfactory管理mybatis选择哪一个，现有factory后注入数据源
    @Bean(name = "sqlSessionFactory")
    public SqlSessionFactory sqlSessionFactory() throws Exception {
    	/*
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(myRoutingDataSource);
        sqlSessionFactoryBean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:mapper/*.xml"));
        return sqlSessionFactoryBean.getObject();
        */
    	return super.sqlSessionFactory(myRoutingDataSource());
    }
    
    
    public AbstractRoutingDataSource myRoutingDataSource() {
		//mybatis提供的底层map类
		SoftHashMap targetDataSources = new ClassLoaderRepository.SoftHashMap();
		//设置键值对，区分使用哪个数据源
		targetDataSources.put(DBTypeEnum.MASTER, masterDataSource);
		targetDataSources.put(DBTypeEnum.SLAVE1, slaveDataSource);
		//继承了AbstractRoutingDataSource的类
		MyRoutingDataSource myRoutingDataSource = new MyRoutingDataSource();
		myRoutingDataSource.setDefaultTargetDataSource(masterDataSource);//设置默认的数据源
		myRoutingDataSource.setTargetDataSources(targetDataSources);//装入存有主从数据源的map
		return myRoutingDataSource;
	}
/*
    @Bean
    public PlatformTransactionManager platformTransactionManager() {
        return new DataSourceTransactionManager(myRoutingDataSource);
    }
 */   
    
}