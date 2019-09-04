package com.demo.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.service.TestService;

@Controller
public class TestAction {

	@Autowired
	TestService s;
	@RequestMapping("/test")
	public String test(){
		System.out.println("----test action-----");
		s.test();
		return "index";
	}
}
