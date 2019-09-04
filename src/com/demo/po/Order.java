package com.demo.po;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Order {
	

   
	@Override
	public String toString() {
		return "Order [id=" + id + ", deliverFee=" + deliverFee + ", totalPrice=" + totalPrice + ", orderPrice="
				+ orderPrice + ", paymentWay=" + paymentWay + ", paymentCash=" + paymentCash + ", delivery=" + delivery
				+ ", isConfirm=" + isConfirm + ", isPaiy=" + isPaiy + ", orderState=" + orderState + ", createDate="
				+ createDate + ", note=" + note + ", buyerId=" + buyerId + "]";
	}
	private Long id;
    private Float deliverFee;
    private Float totalPrice;
    private Float orderPrice;
    private Integer paymentWay;
    private Integer paymentCash;
    private Integer delivery;
    private Integer isConfirm;
    private Integer isPaiy;
    private Integer orderState;
    @DateTimeFormat(pattern="yyyy")
    private Date createDate;
    private String note;
    private Long buyerId;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Float getDeliverFee() {
		return deliverFee;
	}
	public void setDeliverFee(Float deliverFee) {
		this.deliverFee = deliverFee;
	}
	public Float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Float totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Float getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(Float orderPrice) {
		this.orderPrice = orderPrice;
	}
	public Integer getPaymentWay() {
		return paymentWay;
	}
	public void setPaymentWay(Integer paymentWay) {
		this.paymentWay = paymentWay;
	}
	public Integer getPaymentCash() {
		return paymentCash;
	}
	public void setPaymentCash(Integer paymentCash) {
		this.paymentCash = paymentCash;
	}
	public Integer getDelivery() {
		return delivery;
	}
	public void setDelivery(Integer delivery) {
		this.delivery = delivery;
	}
	public Integer getIsConfirm() {
		return isConfirm;
	}
	public void setIsConfirm(Integer isConfirm) {
		this.isConfirm = isConfirm;
	}
	public Integer getIsPaiy() {
		return isPaiy;
	}
	public void setIsPaiy(Integer isPaiy) {
		this.isPaiy = isPaiy;
	}
	public Integer getOrderState() {
		return orderState;
	}
	public void setOrderState(Integer orderState) {
		this.orderState = orderState;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Long getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(Long buyerId) {
		this.buyerId = buyerId;
	}
	

}