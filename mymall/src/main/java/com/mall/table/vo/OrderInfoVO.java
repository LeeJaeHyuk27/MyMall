package com.mall.table.vo;

import java.util.List;

public class OrderInfoVO{
	
	private String orderNo; // 주문번호
	private String userId;  // 회원ID
	private String orderGoodsName;  // 상품명
	private String orderPrice;  // 주문금액
	private String orderStatus;  // 주문상태
	private String orderDt;  // 주문일
	private String receiveName;  //  수취인
	private String zipcd;  // 우편번호
	private String addr;  // 주소
	private String addrDtl;  // 상세주소
	private String memo;  // 메모
	private String regDt;  // 등록일
	private String payment;  // 결제수단
	
	
	//조건추가
	private String orderDtFrom;
	private String orderDtTo;
	private String userName;
	private String receivePhone;
	private String totalPrice;
	private String receiveAddr;
	private String sellPrice;
	
	
	//주문상품 조건추가
	private String goodsCd;
	private String unitPrice;
	private String buyQty;
	
	
	//주문정보 리스트
	private List<String> ordernolist; 

	//주문상품 리스트
	private List<OrderGoodsVO> orderGoods;
	
	
	
	public String getSellPrice() {
		return sellPrice;
	}
	public void setSellPrice(String sellPrice) {
		this.sellPrice = sellPrice;
	}
	public String getReceiveAddr() {
		return receiveAddr;
	}
	public void setReceiveAddr(String receiveAddr) {
		this.receiveAddr = receiveAddr;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public List<OrderGoodsVO> getOrderGoods() {
		return orderGoods;
	}
	public void setOrderGoods(List<OrderGoodsVO> orderGoods) {
		this.orderGoods = orderGoods;
	}
	public String getReceivePhone() {
		return receivePhone;
	}
	public void setReceivePhone(String receivePhone) {
		this.receivePhone = receivePhone;
	}
	public List<String> getOrdernolist() {
		return ordernolist;
	}
	public void setOrdernolist(List<String> ordernolist) {
		this.ordernolist = ordernolist;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getOrderDtFrom() {
		return orderDtFrom;
	}
	public void setOrderDtFrom(String orderDtFrom) {
		this.orderDtFrom = orderDtFrom;
	}
	public String getOrderDtTo() {
		return orderDtTo;
	}
	public void setOrderDtTo(String orderDtTo) {
		this.orderDtTo = orderDtTo;
	}
	public String getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(String goodsCd) {
		this.goodsCd = goodsCd;
	}
	public String getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getBuyQty() {
		return buyQty;
	}
	public void setBuyQty(String buyQty) {
		this.buyQty = buyQty;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrderGoodsName() {
		return orderGoodsName;
	}
	public void setOrderGoodsName(String orderGoodsName) {
		this.orderGoodsName = orderGoodsName;
	}
	public String getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getOrderDt() {
		return orderDt;
	}
	public void setOrderDt(String orderDt) {
		this.orderDt = orderDt;
	}
	public String getReceiveName() {
		return receiveName;
	}
	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
	}
	public String getZipcd() {
		return zipcd;
	}
	public void setZipcd(String zipcd) {
		this.zipcd = zipcd;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrDtl() {
		return addrDtl;
	}
	public void setAddrDtl(String addrDtl) {
		this.addrDtl = addrDtl;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	
	
	
	
	
	
}
