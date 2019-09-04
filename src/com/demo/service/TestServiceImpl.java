package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.TestDao;
import com.demo.po.Brand;

@Service
public class TestServiceImpl implements TestService{

	@Autowired
	TestDao dao;
	@Override
	public void test() {
		List<Brand> list = dao.test();
		for(Brand u:list)
			System.out.println(u);

	}

}
