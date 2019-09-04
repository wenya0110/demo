package com.demo.service;

import java.util.List;
import java.util.Map;

import com.demo.po.Cart;

public interface CartService {
	
	public void addone(Cart c);
	public List<Map<String,Object>> getcarts(Integer buyerid);
	public void del(Integer id);
	public void dels(String ids);
	public int getCountByBuyerid(Integer buyerid);
}
