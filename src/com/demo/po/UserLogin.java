package com.demo.po;

public class UserLogin {

	String username;
	String password;
	String returnUrl;
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
	public String getReturnUrl() {
		return returnUrl;
	}
	public void setReturnUrl(String returnUrl) {
		this.returnUrl = returnUrl;
	}
	@Override
	public String toString() {
		return "UserLogin [username=" + username + ", password=" + password + ", returnUrl=" + returnUrl + "]";
	}
	
	
}
