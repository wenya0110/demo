package com.demo.dao.admin;

import com.demo.po.admin.AdminUser;

public interface AdminUserDao {

	public AdminUser getByUsernameAndPassword(AdminUser user);
	 
}
