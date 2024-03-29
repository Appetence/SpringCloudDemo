package com.springboot.mariadb.config.swagger;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**   
 * @ClassName:  Swagger2Config   
 * @Description:Swagger2Config配置文件
 * @author: jxZhang
 * @date:   2018年12月4日 下午5:39:51   
 *   
 */
@Configuration //spring boot配置注解
public class Swagger2Config {
	
	 @Value("${swagger.enable}")
	 private boolean enableSwagger;
    @Bean
    public Docket createRestfulApi() {//api文档实例
        return new Docket(DocumentationType.SWAGGER_2)//文档类型：DocumentationType.SWAGGER_2
                .apiInfo(apiInfo())//api信息
                .enable(enableSwagger)
                .select()//构建api选择器
                .apis(RequestHandlerSelectors.basePackage("com.sinosoft.controller"))//api选择器选择api的包
                .paths(PathSelectors.any())//api选择器选择包路径下任何api显示在文档中
                .build();//创建文档
    }

    private ApiInfo apiInfo() {//接口的相关信息
        return new ApiInfoBuilder()
                .title("Spring Boot中使用Swagger2构建RESTful接口")
                .description("接口描述")
                .termsOfServiceUrl("termsOfServiceUrl")
                .version("1.0")
                .license("http://springfox.github.io/springfox/docs/current/")
                .licenseUrl("http://springfox.github.io/springfox/docs/current/")
                .contact(new Contact("佐同学", null, "15834260040"))
                .build();
    }

}