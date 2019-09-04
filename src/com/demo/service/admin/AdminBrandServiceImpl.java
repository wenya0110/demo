package com.demo.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.admin.AdminBrandDao;
import com.demo.po.Brand;

@Service
public class AdminBrandServiceImpl implements AdminBrandService {

	@Autowired
	AdminBrandDao dao;
	
	@Override
	public List<Brand> getBrands() {
		return dao.getBrands();
	}
	
	@Override
	public Brand getbyid(int id) {
		return dao.getbyid(id);
	}
	@Override
	public void update(Brand d) {
		dao.update(d);
		
	}
	@Override
	public List<Brand> getall() {
		return dao.getall();
	}

}
