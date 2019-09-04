package com.demo.service;

import java.util.List;

import com.demo.po.Sku;

public interface SkuService {
	
	//根据pid查询库存
	public List<Sku> getByPid(Integer pid);
	

}
