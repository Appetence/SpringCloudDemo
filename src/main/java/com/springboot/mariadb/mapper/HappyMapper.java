package com.springboot.mariadb.mapper;

import java.util.List;

import com.springboot.mariadb.config.database.BaseMapper;
import com.springboot.mariadb.entity.Department;

public interface HappyMapper extends BaseMapper<Department>{

	List<Department> selectAllStatus(Department d);
	
}
