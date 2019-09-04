package com.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.demo.dao.BuyerDao;
import com.demo.po.Buyer;

@Service
public class BuyerServiceImpl implements BuyerService{

	@Autowired
	BuyerDao dao;
	@Override
	public Long login(String username,String password) {
		Buyer buyer = dao.getByUsername(username);
		if(buyer == null) {
			//用户名不存在
			return (long)  -1;
		}else {
			String md5 = DigestUtils.md5DigestAsHex(password.getBytes());
			if(md5.equals(buyer.getPassword())) {
				return buyer.getId();//用户名密码正确
			}else {
				return (long) -2;//密码错误
		    }	
			
	    }
	
	}
}
