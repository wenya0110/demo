package com.demo.service;

import java.util.Map;

import com.demo.po.Product;

public interface ProductService {
	
	public Product getById(Integer id);
	public Map<String,Object> test(Integer id);

}
