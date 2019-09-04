package com.demo.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.ColorDao;
import com.demo.dao.ProductDao;
import com.demo.po.Product;

@Service
public class ProductServicrlmpl implements ProductService {
	
	@Autowired  //依赖注入（DI）
	ProductDao dao;
	@Autowired
	ColorDao dao2;
	
	@Override
	public Product getById(Integer id) {
		Product p = dao.getById(id);
		//把imgUrl拆分成数组
		String s = p.getImg_url();
		String [] arr = s.split(",");
		p.setImgs(arr);		
		//把sizes拆分成数组
		s = p.getSizes();
		String [] arr1 = s.split(",");
		p.setSizearr(arr1);
		//把颜色拆分成数组
		s = p.getColors();
		String [] arr2 = s.split(",");
		p.setColorarr(arr2);
		return p;
	}

	@Override
	public Map<String,Object> test(Integer id){
		Map<String, Object> map = dao.test(id);
		String s = (String) map.get("img_url");
		String [] arr = s.split(",");
		map.put("imgs", arr);
		return map;
	}


}
