package com.demo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.po.UserLogin;
import com.demo.service.BuyerService;

@Controller
@RequestMapping("/buyer")
public class BuyerController {

	@Autowired
	BuyerService service;
	@RequestMapping("/logout")
	@ResponseBody
	public String logout(HttpServletRequest req) {
		System.out.println("销毁session前userid="+req.getSession().getAttribute("userid"));
		req.getSession().removeAttribute("userid");
		req.getSession().removeAttribute("username");
		System.out.println("销毁session后userid="+req.getSession().getAttribute("userid"));
		return "logout";
		}
	@RequestMapping("/login")
	public String login(UserLogin u,HttpServletRequest req,HttpSession session) {
		System.out.println(u);
		Long ret = service.login(u.getUsername(), u.getPassword());
		if(ret > 0) {
			//将登录信息存入session
			session.setAttribute("userid",ret);
			session.setAttribute("username", u.getUsername());
			return "redirect:"+u.getReturnUrl();//重定向首页得用redirect:+网址才行
		}
		else if(ret==-1) {
			req.setAttribute("error", "用户名不存在");
			return "login/login/login";
		}else {
			req.setAttribute("error", "密码错误");
			return "login/login/login";
		}
	}
	
}
