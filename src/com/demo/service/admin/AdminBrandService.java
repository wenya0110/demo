package com.demo.service.admin;

import java.util.List;

import com.demo.po.Brand;

public interface AdminBrandService {

	public Brand getbyid(int id);
	public void update(Brand d);
	public List<Brand> getall();
	public List<Brand> getBrands();
}
