package com.mall.table.vo;

public class GoodsBoardVO{
	
	private String boardNo;
	private String goodsCd;
	private String userId;
	private String title;
	private String content;
	private String attchFile;
	private String replyYn;
	private String replyContent;
	private String regDt;
	private String replyDt;
	
	// 조건추가
	private String userName;
	
	
	

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(String goodsCd) {
		this.goodsCd = goodsCd;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAttchFile() {
		return attchFile;
	}
	public void setAttchFile(String attchFile) {
		this.attchFile = attchFile;
	}
	public String getReplyYn() {
		return replyYn;
	}
	public void setReplyYn(String replyYn) {
		this.replyYn = replyYn;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getReplyDt() {
		return replyDt;
	}
	public void setReplyDt(String replyDt) {
		this.replyDt = replyDt;
	}
	
	
}
