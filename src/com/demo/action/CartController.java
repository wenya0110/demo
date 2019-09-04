package com.demo.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.po.Cart;
import com.demo.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	CartService service;
	@RequestMapping("/getcount")
	@ResponseBody
	//ajax的返回值
	public String getcount(Integer buyerid) {
		int count = service.getCountByBuyerid(buyerid);
		return count+"";
	}
	
	
	@RequestMapping("/del")
	public String del(Integer id) {
		service.del(id);
		return "redirect:getcarts";//重定向到cart/getcarts
	}
	@RequestMapping("/dels")
	public String dels(String ids) {
		service.dels(ids);
		return "redirect:getcarts";//重定向到cart/getcarts
	}
	@RequestMapping("/addone")
	@ResponseBody //返回的不是页面，是响应内容
	public String addone(Cart c) {
		System.out.println(c);
		service.addone(c);
		return "aaa";
	}
	//获取购物车信息
	@RequestMapping("/getcarts")
	public String getcarts(HttpServletRequest req) {
		Long buyerid = (Long)req.getSession().getAttribute("userid");
		System.out.println("userid"+buyerid);
		List<Map<String,Object>> map = service.getcarts(buyerid.intValue());
		req.setAttribute("data", map);
		return "bbs/portal/cart";
	}

}
