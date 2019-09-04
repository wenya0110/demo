package com.demo.dao;

import java.util.Map;

import com.demo.po.Product;

public interface ProductDao {
	
	public Product getById(Integer id);
	public Map<String,Object> test(Integer pid);

}
