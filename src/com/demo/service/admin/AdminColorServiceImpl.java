package com.demo.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.admin.AdminColorDao;
import com.demo.po.Color;

@Service
public class AdminColorServiceImpl implements AdminColorService{

	@Autowired
	AdminColorDao dao;
	@Override
	public List<Color> getColors(){
		return dao.getColors();
	}
}
