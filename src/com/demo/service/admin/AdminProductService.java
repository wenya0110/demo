package com.demo.service.admin;

import java.util.List;
import java.util.Map;

import com.demo.po.Product;
import com.demo.po.Sku;

public interface AdminProductService {

	public List<Product> getByPage(Integer page);

	public void addone(Product p);

	public int getsize();

	public List<Product> getByCondition(Map<String, Object> m);
	
}
