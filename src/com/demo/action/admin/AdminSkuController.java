package com.demo.action.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.po.Sku;
import com.demo.service.admin.AdminSkuService;

@Controller
@RequestMapping("/adminsku")
public class AdminSkuController {

	@Autowired
	AdminSkuService service;
	@RequestMapping("/update")
	@ResponseBody
	public String update(Sku sku){
		System.out.println(sku);
		service.update(sku);
		return "success";
	}
	
	@RequestMapping("/getsku")
	public String getsku(Integer productid,HttpServletRequest req){
		
		List<Map<String,Object>> list = service.getsku(productid);
		req.setAttribute("data", list);
		return "admin/console/sku/list";
		
	}
}
