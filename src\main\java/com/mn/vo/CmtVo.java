package com.mn.vo;

public class CmtVo {

	private int cmtNo; // 식별번호
	private int postNo; // 글번호
	private int userNo; // 회원번호
	private String cmtContent; // 댓글내용
	private String regDate; // 등록일
	private String id; // 아이디
	private String name; // 회원이름

	public CmtVo() {

	}

	public CmtVo(int postNo, int userNo, String cmtContent) {
		this.postNo = postNo;
		this.userNo = userNo;
		this.cmtContent = cmtContent;
	}

	public CmtVo(int cmtNo, int postNo, int userNo, String cmtContent, String regDate) {

		this.cmtNo = cmtNo;
		this.postNo = postNo;
		this.userNo = userNo;
		this.cmtContent = cmtContent;
		this.regDate = regDate;
	}

	public CmtVo(int cmtNo, int postNo, int userNo, String cmtContent, String regDate, String id, String name) {
		this.cmtNo = cmtNo;
		this.postNo = postNo;
		this.userNo = userNo;
		this.cmtContent = cmtContent;
		this.regDate = regDate;
		this.id = id;
		this.name = name;
	}

	public int getCmtNo() {
		return cmtNo;
	}

	public void setCmtNo(int cmtNo) {
		this.cmtNo = cmtNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getCmtContent() {
		return cmtContent;
	}

	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "CmtVo [cmtNo=" + cmtNo + ", postNo=" + postNo + ", userNo=" + userNo + ", cmtContent=" + cmtContent
				+ ", regDate=" + regDate + ", id=" + id + ", name=" + name + "]";
	}

	
}
