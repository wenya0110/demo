package com.demo.po;

public class Brand {
	
   
    @Override
	public String toString() {
		return "Brand [id=" + id + ", name=" + name + ", description=" + description + ", imgUrl=" + imgUrl
				+ ", webSite=" + webSite + ", sort=" + sort + ", isDisplay=" + isDisplay + "]";
	}
	private Long id;
    private String name;
    private String description;
    private String imgUrl;
    private String webSite;
    private Integer sort;
    private Boolean isDisplay;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getWebSite() {
		return webSite;
	}
	public void setWebSite(String webSite) {
		this.webSite = webSite;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public Boolean getIsDisplay() {
		return isDisplay;
	}
	public void setIsDisplay(Boolean isDisplay) {
		this.isDisplay = isDisplay;
	}
   
}