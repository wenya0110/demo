package com.demo.po;

public class ProductWithBLOBs extends Product {
	
    @Override
	public String toString() {
		return "ProductWithBLOBs [imgUrl=" + imgUrl + ", description=" + description + ", packageList=" + packageList
				+ "]";
	}

	/**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column bbs_product.img_url
     *
     * @mbg.generated Mon Jun 24 16:01:01 CST 2019
     */
    private String imgUrl;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column bbs_product.description
     *
     * @mbg.generated Mon Jun 24 16:01:01 CST 2019
     */
    private String description;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column bbs_product.package_list
     *
     * @mbg.generated Mon Jun 24 16:01:01 CST 2019
     */
    private String packageList;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column bbs_product.img_url
     *
     * @return the value of bbs_product.img_url
     *
     * @mbg.generated Mon Jun 24 16:01:01 CST 2019
     */
    public String getImgUrl() {
        return imgUrl;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column bbs_product.img_url
     *
     * @param imgUrl the value for bbs_product.img_url
     *
     * @mbg.generated Mon Jun 24 16:01:01 CST 2019
     */
    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl == null ? null : imgUrl.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column bbs_product.description
     *
     * @return the value of bbs_product.description
     *
     * @mbg.generated Mon Jun 24 16:01:01 CST 2019
     */
    public String getDescription() {
        return description;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column bbs_product.description
     *
     * @param description the value for bbs_product.description
     *
     * @mbg.generated Mon Jun 24 16:01:01 CST 2019
     */
    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column bbs_product.package_list
     *
     * @return the value of bbs_product.package_list
     *
     * @mbg.generated Mon Jun 24 16:01:01 CST 2019
     */
    public String getPackageList() {
        return packageList;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column bbs_product.package_list
     *
     * @param packageList the value for bbs_product.package_list
     *
     * @mbg.generated Mon Jun 24 16:01:01 CST 2019
     */
    public void setPackageList(String packageList) {
        this.packageList = packageList == null ? null : packageList.trim();
    }
}