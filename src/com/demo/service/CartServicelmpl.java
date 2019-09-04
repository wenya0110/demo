package com.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.digester.Digester;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.demo.dao.CartDao;
import com.demo.po.Cart;

@Service
public class CartServicelmpl implements CartService {

	@Autowired
	CartDao dao;
	@Override 
	public void addone(Cart c) {
	
		Cart cart = dao.getByids(c);
        if( cart != null) {
			//如果购物车中已经存在相同颜色和尺码的数据，应合并数量
        	Map<String,Integer> map = new HashMap<String,Integer>();
        	map.put("cid", cart.getId());
        	map.put("newnum", cart.getNum()+c.getNum());
        	dao.updateNum(map);
		}else {
			//如果购物车中不存在，那么新增一条
			dao.addone(c);
		}
	}
	@Override
	public void del(Integer id) {
		dao.del(id);
		
	}
	@Override
	public List<Map<String,Object>> getcarts(Integer buyerid){
		List<Map<String,Object>> list = dao.getcarts(buyerid);
		//把img_url拆分成数组,才能在product.jsp里取imgs[0]
		for( Map<String,Object> map : list) {
			String s = (String)map.get("img_url");
			map.put("imgs", s.split(","));
		}
		//System.out.println(dao.getcarts(buyerid));
		return list;
	}
	@Override
	public void dels(String ids) {
		String[] s = ids.split(",");
		for(String tmp :s ) {
			Integer id = Integer.parseInt(tmp);
			dao.del(id);
		}
		
	}
	@Override
	public int getCountByBuyerid(Integer buyerid) {
		return dao.getCountByBuyerid(buyerid);
	}

}
