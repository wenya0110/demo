package com.demo.service;

import java.util.List;
import java.util.Map;

import com.demo.po.CartVo;
import com.demo.po.Detail;
import com.demo.po.Order;
import com.demo.po.OrderDetail;

public interface OrderService {

	public void setOrder(Order o, List<Detail> list,String ids,String nums);
	public List<Map<String,Object>> getInfoForOrder(CartVo v,Integer buyerid);
}
