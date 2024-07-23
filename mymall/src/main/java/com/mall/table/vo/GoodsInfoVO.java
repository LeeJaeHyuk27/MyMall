package com.mall.table.vo;

import java.util.List;

public class GoodsInfoVO{
	
	private String goodsCd;
	private String ctCd;
	private String goodsName;
	private String normalPrice;
	private String sellPrice;
	private String ivQty;
	private String goodsStatus;
	private String supplierCd;
	private String thumbnailUrl;
	private String content;
	private String regDt;
	
	// 조건 추가
	private List<GoodsImgVO> imglist;
	private List<GoodsBoardVO> boardlist;
	
	

	public List<GoodsImgVO> getImglist() {
		return imglist;
	}
	public void setImglist(List<GoodsImgVO> imglist) {
		this.imglist = imglist;
	}
	public List<GoodsBoardVO> getBoardlist() {
		return boardlist;
	}
	public void setBoardlist(List<GoodsBoardVO> boardlist) {
		this.boardlist = boardlist;
	}
	public String getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(String goodsCd) {
		this.goodsCd = goodsCd;
	}
	public String getCtCd() {
		return ctCd;
	}
	public void setCtCd(String ctCd) {
		this.ctCd = ctCd;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getNormalPrice() {
		return normalPrice;
	}
	public void setNormalPrice(String normalPrice) {
		this.normalPrice = normalPrice;
	}
	public String getSellPrice() {
		return sellPrice;
	}
	public void setSellPrice(String sellPrice) {
		this.sellPrice = sellPrice;
	}
	public String getIvQty() {
		return ivQty;
	}
	public void setIvQty(String ivQty) {
		this.ivQty = ivQty;
	}
	public String getGoodsStatus() {
		return goodsStatus;
	}
	public void setGoodsStatus(String goodsStatus) {
		this.goodsStatus = goodsStatus;
	}
	public String getSupplierCd() {
		return supplierCd;
	}
	public void setSupplierCd(String supplierCd) {
		this.supplierCd = supplierCd;
	}
	public String getThumbnailUrl() {
		return thumbnailUrl;
	}
	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	
}
