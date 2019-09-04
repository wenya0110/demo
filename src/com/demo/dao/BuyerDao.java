package com.demo.dao;

import java.util.Map;

import com.demo.po.Buyer;

public interface BuyerDao {

	public Map<String,Object> getById(Integer id); 
	public Buyer getByUsername(String username);
}
