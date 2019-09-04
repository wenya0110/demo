package com.demo.dao.admin;

import java.util.List;

import com.demo.po.Brand;

public interface AdminBrandDao {

	public Brand getbyid(int id);
	public void update(Brand d);
	public List<Brand> getall();
	public List<Brand> getBrands();
}
