package com.demo.po.admin;

public class AdminUser {

	Integer id;
	String username;
	String password;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "AdminUsers [id=" + id + ", username=" + username + ", password=" + password + "]";
	}
	
}
