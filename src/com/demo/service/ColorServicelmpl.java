package com.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.ColorDao;
import com.demo.po.Color;

@Service
public class ColorServicelmpl implements ColorService {

	@Autowired
	ColorDao dao;
	@Override
	public List<Color> getColorsByPid(String[] colorarr) {
		// TODO Auto-generated method stub
		List<Color> list = new ArrayList<Color>(); //接口是静态常量和虚拟方法的集合
		
		for(String ss : colorarr) {  //增强for,与索引无关时用增强for
			Color c = dao.getByColorId(Integer.valueOf(ss));
			list.add(c);
		}
		return list;
	}

}
