package com.demo.dao;

import java.util.List;
import java.util.Map;

import com.demo.po.Cart;
import com.demo.po.CartVo;

public interface CartDao {
	
	public List<Map<String,Object>> getByIds(CartVo v);
	//删除指定id的数据
	public void del(Integer id);
	//更新指定cartid的数量
	public void updateNum(Map<String,Integer> map);
	//查询指定的buyerid,productid,colorid和size数据库中有没有
	public Cart getByids(Cart c);
	//加入购物车--购物车表中添加信息
	public void addone(Cart c);
	//查询购物车信息
	public List<Map<String,Object>> getcarts(Integer buyerid);
	//根据指定的buyerid查询购物车中有多少条信息
	public Integer getCountByBuyerid(Integer buyerid);

}
