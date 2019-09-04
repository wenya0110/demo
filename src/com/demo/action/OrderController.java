package com.demo.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.po.CartVo;
import com.demo.po.Order;
import com.demo.po.OrderDetail;
import com.demo.service.OrderService;


@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	OrderService service;
	@RequestMapping("/setorder")
	public String setorder(Order o,OrderDetail list1,String ids,String nums,HttpServletRequest req) {
		o.setBuyerId( (Long)req.getSession().getAttribute("userid"));
		System.out.println("---------123------"+o.getId());
		System.out.println("---------ordercontroller:setorder参数：------------------"+o);
		System.out.println("----OrderController::setorder--参数ids:"+ids+",nums:"+nums);
		service.setOrder(o, list1.getList(), ids, nums);
		System.out.println("o");
		req.setAttribute("orderid",o.getId());
		switch (o.getPaymentWay()) {
		case 0:
			req.setAttribute("paymentway","货到付款");
			break;
		case 1:
			req.setAttribute("paymentway","在线支付");
			break;
		case 2:
			req.setAttribute("paymentway","公司转账");
			break;
		case 3:
			req.setAttribute("paymentway","邮局汇款");
			break;
		}
		req.setAttribute("price", o.getTotalPrice());
		return "bbs/portal/success";
		

	}
	@RequestMapping("/getorder")
	public String getorder(String cartids,String skuids,String nums,HttpServletRequest request) {
		System.out.println("-------------skuids:"+skuids);
		System.out.println("-------------cartids:"+cartids);
		System.out.println("-------------nums:"+nums);
		String[] tmp1 = cartids.split(",");
		CartVo v = new CartVo();
		List<Integer> list = v.getIds();
		for(String s:tmp1) {
			list.add(Integer.parseInt(s));
		}
		List<Map<String,Object>> l = service.getInfoForOrder(v, 1);
		request.setAttribute("data", l);
		request.setAttribute("skuids", skuids);
		request.setAttribute("nums", nums);
		return "bbs/portal/order";
	}

}
