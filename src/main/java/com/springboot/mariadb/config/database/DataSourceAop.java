package com.springboot.mariadb.config.database;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;

import com.springboot.mariadb.enums.DBTypeEnum;
//默认情况下，所有的查询都走从库，插入/修改/删除走主库。我们通过方法名来区分操作类型（CRUD)
@Aspect	//Spring只支持XML方式而没有实现注解的方式（也叫AspectJ方式）的AOP，所以要使用@Aspect注解，只能引入AspectJ相关的 jar 包 aopalliance-1.0.jar 和 aspectjweaver.jar，这个坑把我给坑惨了。
@Component ///（把普通pojo实例化到spring容器中，相当于配置文件中的<bean id="" class=""/>）
public class DataSourceAop implements Ordered {
	public static Logger logger = LoggerFactory.getLogger(DataSourceAop.class);
	
	@Around(value = "@annotation(readOnlyConnection)")//将注解添加到readonluconnection实体类上
	public Object proceed(ProceedingJoinPoint proceedingJoinPoint,ReadOnlyConnection readOnlyConnection) throws Throwable{
		try {
			logger.info("---------set database connection 2 read only---------");
			//强制让其读取只读从数据库
			DBContextHolder.setDBType(DBTypeEnum.SLAVE1);
			Object result = proceedingJoinPoint.proceed();//proceed让注解上的方法执行完毕
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("---------切换只读数据库时发生异常	---------");
			return null;
		}finally {
			DBContextHolder.clearDBType();
			logger.info("---------cleat DataBaseType 	---------");
		}
	}
	
	
	@Override
	public int getOrder() {
		// TODO Auto-generated method stub
		return 0;
	}
/*
    @Pointcut("!@annotation(com.springboot.mariadb.annotation.Master) " +
            "&& (execution(* com.cjs.example.service..*.select*(..)) " +
            "|| execution(* com.cjs.example.service..*.get*(..)))")
    public void readPointcut() {

    }

    @Pointcut("@annotation(com.springboot.mariadb.annotation.Master) " +
            "|| execution(* com.cjs.example.service..*.insert*(..)) " +
            "|| execution(* com.cjs.example.service..*.add*(..)) " +
            "|| execution(* com.cjs.example.service..*.update*(..)) " +
            "|| execution(* com.cjs.example.service..*.edit*(..)) " +
            "|| execution(* com.cjs.example.service..*.delete*(..)) " +
            "|| execution(* com.cjs.example.service..*.remove*(..))")
    public void writePointcut() {

    }

    @Before("readPointcut()")
    public void read() {
        DBContextHolder.slave();
    }

    @Before("writePointcut()")
    public void write() {
        DBContextHolder.master();
    }



     //* 另一种写法：if...else...  判断哪些需要读从数据库，其余的走主数据库
   
//    @Before("execution(* com.cjs.example.service.impl.*.*(..))")
//    public void before(JoinPoint jp) {
//        String methodName = jp.getSignature().getName();
//
//        if (StringUtils.startsWithAny(methodName, "get", "select", "find")) {
//            DBContextHolder.slave();
//        }else {
//            DBContextHolder.master();
//        }
//    }
	*/
}