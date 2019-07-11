/**  
 * All rights Reserved, Designed By jxZhang
 * @Title:  WebMvcConfig.java   
 * @Package com.sinosoft.config   
 * @Description:    TODO(用一句话描述该文件做什么)   
 * @author: jxZhang     
 * @date:   2018年12月10日 下午5:54:08   
 */
package com.springboot.mariadb.config.swagger;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 * @ClassName: WebMvcConfig
 * @Description:新增静态资源 因为 在访问Swagger2Config时 shiro会拦截Swagger
 * @author: jxZhang
 * @date: 2018年12月10日 下午5:54:08
 * 
 */
@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {
	@Value("${domain.localLoad}")
	private String localLoad;

	/**
	 * 解决swagger 和shiro 兼容性问题
	 * <p>
	 * Title: addResourceHandlers
	 * </p>
	 * <p>
	 * Description:
	 * </p>
	 * 
	 * @param registry
	 * @see org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter#addResourceHandlers(org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry)
	 */
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("swagger-ui.html").addResourceLocations("classpath:/META-INF/resources/");

		registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
		registry.addResourceHandler("/static/upload/**").addResourceLocations("file:" + localLoad + "/");

	}

	/**
	 * 解决前后端分离跨域问题
	 * <p>
	 * Title: addCorsMappings
	 * </p>
	 * <p>
	 * Description:
	 * </p>
	 * 
	 * @param registry
	 * @see org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter#addCorsMappings(org.springframework.web.servlet.config.annotation.CorsRegistry)
	 */
	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**").allowedOrigins("*").allowedMethods("GET", "POST", "OPTIONS", "PUT")
				.allowedHeaders("Content-Type", "X-Requested-With", "accept", "Origin", "Access-Control-Request-Method",
						"Access-Control-Request-Headers")
				.exposedHeaders("Access-Control-Allow-Origin", "Access-Control-Allow-Credentials")
				.allowCredentials(true).maxAge(3600);
	}

	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/jsp/");
		viewResolver.setSuffix(".jsp");
		viewResolver.setViewClass(JstlView.class);
		return viewResolver;
	}
}
