package com.springboot.mariadb.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.springboot.mariadb.config.database.ReadOnlyConnection;
import com.springboot.mariadb.entity.Department;
import com.springboot.mariadb.mapper.HappyMapper;
import com.springboot.mariadb.service.HappyService;
import com.springboot.mariadb.util.model.Msg;
@Service
public class HappyServiceImpl implements HappyService{
	
	@Autowired
	HappyMapper happymapper;

	@Override
	@ReadOnlyConnection
	public Msg DeptContent() {
		PageHelper.startPage(1,3);
		List<Department> dp = happymapper.selectAll();
		PageInfo<Department> pageInfo = new PageInfo<Department>(dp,3);
		for( Department s : dp) {
				System.out.println("Department:"+s.getName());
			
		}
		System.out.println("Department:---------");
		return this.selectAllStatus();
	}
	@Override
	public Msg selectAllStatus() {
		System.out.println("Department:---------");
		Msg msg = new Msg();
		Department dept = new Department();
		dept.setStatus("1");
		List<Department> bep = happymapper.selectAllStatus(dept);
		msg.setData(bep);
		return msg;
		
	}
	
	
	
}
