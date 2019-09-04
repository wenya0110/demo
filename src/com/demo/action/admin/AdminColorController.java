package com.demo.action.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.po.Color;
import com.demo.service.admin.AdminColorService;

@Controller
@RequestMapping("admincolor")
public class AdminColorController {

	
	@Autowired
	AdminColorService service;
	@RequestMapping("getcolors")
	@ResponseBody
	public List<Color> getColors() {
		return service.getColors();
		
	}
	
}
