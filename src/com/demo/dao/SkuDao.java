package com.demo.dao;

import java.util.List;
import java.util.Map;

import com.demo.po.Sku;

public interface SkuDao {
	
	//根据product id查询库存信息
	public List<Sku> getByProductId(Integer pid);

	public void updateStockById(Map<String,Integer> map);
}
