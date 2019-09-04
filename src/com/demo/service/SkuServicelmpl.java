package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.SkuDao;
import com.demo.po.Sku;
@Service
public class SkuServicelmpl implements SkuService {

	@Autowired
	SkuDao dao;
	@Override
	public List<Sku> getByPid(Integer pid) {
		// TODO Auto-generated method stub
		return dao.getByProductId(pid);
	}

}
