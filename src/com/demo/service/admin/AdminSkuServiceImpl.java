package com.demo.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.admin.AdminSkuDao;
import com.demo.po.Sku;

@Service
public class AdminSkuServiceImpl implements AdminSkuService {

	@Autowired
	AdminSkuDao dao;
	@Override
	public void addone_sku(Sku sku) {
		//System.out.println("---------曾令国有毒--------"+sku);
		dao.addone_sku(sku);
		
	}

	@Override
	public List<Map<String,Object>> getsku(Integer productid) {
		return dao.getsku(productid);
	}

	@Override
	public void update(Sku sku) {
		dao.update(sku);
		
	}

}
