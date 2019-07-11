package com.springboot.mariadb.config.database;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;
import org.springframework.lang.Nullable;
//获取路由key,根据路由自动切换类型
public class MyRoutingDataSource extends AbstractRoutingDataSource {
    @Nullable//可以传入空值		//不能传入空值NotNull
    @Override
    protected Object determineCurrentLookupKey() {
    	//获取操作数据库参数类型
        return DBContextHolder.getDBType();
    }

}
