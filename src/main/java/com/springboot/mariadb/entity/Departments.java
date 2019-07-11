package com.springboot.mariadb.entity;

import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;
@Component
@Data
public class Departments {
	private int id;
	/*
	 * private String department; private String grade; private String p_id; private
	 * List<Department> departments;
	 */	
	private String name;
	private String code;
	private String status;

}
