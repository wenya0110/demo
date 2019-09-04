package com.demo.dao.admin;

import java.util.List;
import java.util.Map;

import com.demo.po.Sku;

public interface AdminSkuDao {

	public void addone_sku(Sku sku);
	public List<Map<String,Object>> getsku(Integer productid);
	public void update(Sku sku);
}
