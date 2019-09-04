package com.demo.dao.admin;

import java.util.List;
import java.util.Map;

import com.demo.po.Product;

public interface AdminProductDao {

	public List<Product> getByPage(int page);
	public void addone(Product p);
	public int getsize();
	public List<Product> getByCondition(Map<String, Object> m);
	
}
