package com.demo.action.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.po.admin.AdminUser;
import com.demo.service.admin.AdminUserService;

@Controller
@RequestMapping("adminuser")
public class AdminUserController {

	@Autowired
	AdminUserService service;//调service需要自动装配一个@Autowired
	@RequestMapping("/login")
	public String login(AdminUser user,HttpSession session) {//登录成功后需要有session
		boolean b = service.login(user);
		if(b==true) {
			System.out.println("登陆成功");
			session.setAttribute("username", user.getUsername());
			return "redirect:../admin/console/index.jsp";
		}
		else
			System.out.println("登陆失败");
			return "redirect:../admin/console/login.jsp";
		
	}
}
