package com.demo.po;

import java.util.Date;

public class Cart {
	
	Integer id;
	Integer buyerid;
	Integer productid;
	Integer num;
	Integer colorid;
	String sizename;
	double babaprice;
	double price;
	Integer isdel;
	Date createtime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getBuyerid() {
		return buyerid;
	}
	public void setBuyerid(Integer buyerid) {
		this.buyerid = buyerid;
	}
	public Integer getProductid() {
		return productid;
	}
	public void setProductid(Integer productid) {
		this.productid = productid;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getColorid() {
		return colorid;
	}
	public void setColorid(Integer colorid) {
		this.colorid = colorid;
	}
	public String getSizename() {
		return sizename;
	}
	public void setSizename(String sizename) {
		this.sizename = sizename;
	}
	public double getBabaprice() {
		return babaprice;
	}
	public void setBabaprice(double babaprice) {
		this.babaprice = babaprice;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Integer getIsdel() {
		return isdel;
	}
	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	@Override
	public String toString() {
		return "Cart [id=" + id + ", buyerid=" + buyerid + ", productid=" + productid + ", num=" + num + ", colorid="
				+ colorid + ", sizename=" + sizename + ", babaprice=" + babaprice + ", price=" + price + ", isdel="
				+ isdel + ", createtime=" + createtime + "]";
	}
	

}
