package com.demo.action.admin;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.demo.po.Product;
import com.demo.service.admin.AdminProductService;

@Controller
@RequestMapping("/adminproduct")
public class AdminProductController {

	@Autowired
	AdminProductService service;
	
	@RequestMapping("/select")
	@ResponseBody
	public List<Product> select(String name,Integer brandid,Integer isshow){
	
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("name","%"+name+"%");
		m.put("isshow",isshow);
		m.put("brandid",brandid);
		System.out.println("select接收到的参数是："+m);
		return service.getByCondition(m);
	}
	
	
	
	@RequestMapping("/uploadfiles")
	@ResponseBody
	public String[] uploadfiles(@RequestParam("pics")MultipartFile[] pics,HttpServletRequest request) throws IllegalStateException, IOException {
		String path = request.getSession().getServletContext().getRealPath("/");
		System.out.println(path);
		if(pics != null && pics.length>0) {
			String[] imgurl = new String[pics.length];
			for(int i=0;i<pics.length;i++) {
				
				String filename = pics[i].getOriginalFilename();
				File f = new File(path+"bbs/images/"+filename);
				pics[i].transferTo(f);
				System.out.println("文件"+filename+"已上传至："+path+"bbs/images/"+filename);
				imgurl[i] = "/images/"+filename;
			}
			return imgurl;
		}else {
			return null;
		}
	}
	
	
	
	@RequestMapping("/uploadfiles1")
	@ResponseBody
	public String[] uploadfiles1(@RequestParam("pics")MultipartFile[] pics1,HttpServletRequest request) throws IllegalStateException, IOException {
		String path = request.getSession().getServletContext().getRealPath("/");
		System.out.println(path);
		if(pics1 != null && pics1.length>0) {
			String[] imgurl = new String[pics1.length];
			for(int i=0;i<pics1.length;i++) {
				
				String filename = pics1[i].getOriginalFilename();
				File f = new File(path+"bbs/images/"+filename);
				pics1[i].transferTo(f);
				System.out.println("文件"+filename+"已上传至："+path+"bbs/images/"+filename);
				imgurl[i] = "/images/"+filename;
			}
			return imgurl;
		}else {
			return null;
		}
	}
	
	
	@RequestMapping("/add")
	public String add(Product p) throws IllegalStateException, IOException {
		System.out.println(p);
		
		service.addone(p);
		return "redirect:list?page=1";
		
	}
	
	
	@RequestMapping("/list")
	public String productlist(int page,HttpServletRequest req) {
		List<Product> list = service.getByPage(page);
		System.out.println("数据个数："+list.size());
		req.setAttribute("data", list);
		req.setAttribute("size", service.getsize());
		return "admin/console/product/list";
		
	}
	
	
	@RequestMapping("/getbypage")
	@ResponseBody
	public List<Product> getbypage(int page,HttpServletRequest req) {
		List<Product> list = service.getByPage(page);
		
		return list;
		
		
	}
}
