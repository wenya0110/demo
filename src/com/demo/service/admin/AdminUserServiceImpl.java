package com.demo.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.demo.dao.admin.AdminUserDao;
import com.demo.po.admin.AdminUser;

@Service
public class AdminUserServiceImpl implements AdminUserService{

	@Autowired
	AdminUserDao dao;
	@Override
	public boolean login(AdminUser user) {
		user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
		AdminUser u = dao.getByUsernameAndPassword(user);
		if(null==u)
			return false;
		else
			return true;
		
	}
	
}
