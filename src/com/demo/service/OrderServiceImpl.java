package com.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.dao.BuyerDao;
import com.demo.dao.CartDao;
import com.demo.dao.DetailDao;
import com.demo.dao.OrderDao;
import com.demo.dao.SkuDao;
import com.demo.po.CartVo;
import com.demo.po.Detail;
import com.demo.po.Order;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	CartDao dao1;
	@Autowired
	BuyerDao dao2;
	@Autowired
	OrderDao order_dao;
	@Autowired
	DetailDao detail_dao;
	@Autowired
	SkuDao skudao;
	
	
	@Override
	public List<Map<String, Object>> getInfoForOrder(CartVo v,Integer buyerid) {
		List<Map<String,Object>> list = dao1.getByIds(v);    //商品信息
		for(Map<String, Object> map : list) {
			String s = (String) map.get("img_url");
			map.put("imgs", s.split(","));
		}
		list.add(0,dao2.getById(buyerid));                   //购买者信息
		return list;
	}
	
	@Override
	@Transactional
	public void setOrder(Order o,List<Detail> list,String ids,String nums) {
		System.out.println(o);
		System.out.println(ids);
		System.out.println(nums);
		order_dao.addone(o);//插入order数据
		System.out.println("---------------order_dao.addone结束----------------");
		for(Detail d : list) {
			d.setOrderId(o.getId());//新增的order表数据的主键已经返回到o对象的id属性里了
			System.out.println("-------曾令国你有毒--------"+o.getId());
			System.out.println("-------曾令国你有病--------"+d.getOrderId());
			detail_dao.addone(d);//插入detail数据
			//修改库存信息
		}
		//修改库存信息
		String []arr_id = ids.split(",");
		String [] arr_num = nums.split(",");
		for(int i=0;i<arr_id.length;i++) {
			Map<String,Integer> map = new HashMap<String,Integer>();
			map.put("id", Integer.parseInt(arr_id[i]));
			map.put("num", Integer.parseInt(arr_num[i]));
			skudao.updateStockById(map);
			
		}
	}

}
