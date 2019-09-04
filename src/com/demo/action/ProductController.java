package com.demo.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.po.Color;
import com.demo.po.Sku;
import com.demo.service.ColorService;
import com.demo.service.ProductService;
import com.demo.service.SkuService;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	ProductService service;
	@Autowired
	SkuService s2;
	@Autowired
	ColorService s3;
	@RequestMapping("/getproduct")
	public String getproduct(HttpServletRequest req,Integer id) {                        //HttpServletRequest请求对象
		System.out.println("接收到的参数是："+id);
		Map<String,Object> map = service.test(id);
		System.out.println("--------------------------------");
		System.out.println(map);
		String s = (String)map.get("colors");
		List<Sku> list = s2.getByPid(id);//获取商品库存信息
		List<Color> list2 = s3.getColorsByPid(s.split(","));//获取商品颜色信息
		req.setAttribute("skus", list);//把库存信息放入页面中
		req.setAttribute("colors", list2);
		req.setAttribute("product", map);
		return "bbs/portal/product";      //请求转发，用户发送getproduct请求给服务器，将请求和数据返回用户，用户立刻请求访问product.jsp
	}

}
