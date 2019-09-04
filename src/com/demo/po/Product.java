package com.demo.po;

import java.util.Arrays;
import java.util.Date;

public class Product {
		
    private String img_url;
    private String description;
    private String packageList;
    private Long id;
    private Long brand_id;
    private String name;
    private Float weight;
    private Boolean is_new;
    private Boolean is_hot;
    private Boolean is_commend;
    private Boolean is_show;
    private Boolean is_del;
    private String colors;
    private String sizes;
    private Date create_time;
    //加一个属性，存放图片数组
    private String[] imgs;
    //加一个属性,存放尺码数组
    private String[] sizearr;
    //加一个属性，存放颜色数组
    private String[] colorarr;
    //加一个属性，存放描述图片的url数组
    private String[] descurlarr;
    
    
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public String[] getDescurlarr() {
		return descurlarr;
	}
	public void setDescurlarr(String[] descurlarr) {
		this.descurlarr = descurlarr;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPackageList() {
		return packageList;
	}
	public void setPackageList(String packageList) {
		this.packageList = packageList;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(Long brand_id) {
		this.brand_id = brand_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Float getWeight() {
		return weight;
	}
	public void setWeight(Float weight) {
		this.weight = weight;
	}
	public Boolean getIs_new() {
		return is_new;
	}
	public void setIs_new(Boolean is_new) {
		this.is_new = is_new;
	}
	public Boolean getIs_hot() {
		return is_hot;
	}
	public void setIs_hot(Boolean is_hot) {
		this.is_hot = is_hot;
	}
	public Boolean getIs_commend() {
		return is_commend;
	}
	public void setIs_commend(Boolean is_commend) {
		this.is_commend = is_commend;
	}
	public Boolean getIs_show() {
		return is_show;
	}
	public void setIs_show(Boolean is_show) {
		this.is_show = is_show;
	}
	public Boolean getIs_del() {
		return is_del;
	}
	public void setIs_del(Boolean is_del) {
		this.is_del = is_del;
	}
	public String getColors() {
		return colors;
	}
	public void setColors(String colors) {
		this.colors = colors;
	}
	public String getSizes() {
		return sizes;
	}
	public void setSizes(String sizes) {
		this.sizes = sizes;
	}
	public Date getCreat_time() {
		return create_time;
	}
	public void setCreat_time(Date creat_time) {
		this.create_time = creat_time;
	}
	public String[] getImgs() {
		return imgs;
	}
	public void setImgs(String[] imgs) {
		this.imgs = imgs;
	}
	
	public String[] getSizearr() {
		return sizearr;
	}
	public void setSizearr(String[] sizearr) {
		this.sizearr = sizearr;
	}
	
	public String[] getColorarr() {
		return colorarr;
	}
	public void setColorarr(String[] colorarr) {
		this.colorarr = colorarr;
	}
	@Override
	public String toString() {
		return "Product [img_url=" + img_url + ", description=" + description + ", packageList=" + packageList + ", id="
				+ id + ", brand_id=" + brand_id + ", name=" + name + ", weight=" + weight + ", is_new=" + is_new
				+ ", is_hot=" + is_hot + ", is_commend=" + is_commend + ", is_show=" + is_show + ", is_del=" + is_del
				+ ", colors=" + colors + ", sizes=" + sizes + ", create_time=" + create_time + ", imgs="
				+ Arrays.toString(imgs) + ", sizearr=" + Arrays.toString(sizearr) + ", colorarr="
				+ Arrays.toString(colorarr) + ", descurlarr=" + Arrays.toString(descurlarr) + ", getCreate_time()="
				+ getCreate_time() + ", getDescurlarr()=" + Arrays.toString(getDescurlarr()) + ", getImg_url()="
				+ getImg_url() + ", getDescription()=" + getDescription() + ", getPackageList()=" + getPackageList()
				+ ", getId()=" + getId() + ", getBrand_id()=" + getBrand_id() + ", getName()=" + getName()
				+ ", getWeight()=" + getWeight() + ", getIs_new()=" + getIs_new() + ", getIs_hot()=" + getIs_hot()
				+ ", getIs_commend()=" + getIs_commend() + ", getIs_show()=" + getIs_show() + ", getIs_del()="
				+ getIs_del() + ", getColors()=" + getColors() + ", getSizes()=" + getSizes() + ", getCreat_time()="
				+ getCreat_time() + ", getImgs()=" + Arrays.toString(getImgs()) + ", getSizearr()="
				+ Arrays.toString(getSizearr()) + ", getColorarr()=" + Arrays.toString(getColorarr()) + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	


	}
	
