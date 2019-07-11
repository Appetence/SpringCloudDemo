package com.springboot.mariadb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springboot.mariadb.service.HappyService;
import com.springboot.mariadb.util.model.Msg;

@Controller
@RequestMapping("/HelloWorldController")
public class HelloWorldController {
	@Autowired
	HappyService happyService;
	@ResponseBody
	@RequestMapping("/hello")
	public String hello(String id) {
		System.out.println("id:"+id);
		return "hello";
	}
	@ResponseBody
	@RequestMapping("/DeptContent")
	public Msg DeptContent() {
		
		Msg msg = happyService.DeptContent();
		
		return msg;
	}
}
