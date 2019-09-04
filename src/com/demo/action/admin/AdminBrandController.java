package com.demo.action.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.po.Brand;
import com.demo.service.admin.AdminBrandService;

@Controller
@RequestMapping("/adminbrand")
public class AdminBrandController {

	@Autowired
	AdminBrandService service;
	
	
	@RequestMapping("/getbrands")
	@ResponseBody
	public List<Brand> getBrands(){
		return service.getBrands();
	}
	
	
	
	@RequestMapping("/list")
	public String list(HttpServletRequest req){
		req.setAttribute("list",service.getall());
		return "admin/console/brand/list";
	}
	
	
	@RequestMapping("/getbyid")
	public String getbyid(int id,HttpServletRequest req){
		
		req.setAttribute("data", service.getbyid(id));
		return "admin/console/brand/edit";
	}
	
	@RequestMapping("/update")
	public String update(Brand b){
		System.out.println(b);
		service.update(b);
		return "redirect:list";
	}
}
