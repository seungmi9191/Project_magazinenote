package com.mn.vo;

public class CateVo {

	private int cateNo;
	private int blogNo;
	private String cateName;
	private String description;
	private String regDate;
	private int postNum;

	public CateVo() {

	}

	public CateVo(int blogNo, String cateName, String description, String regDate) {
		this.blogNo = blogNo;
		this.cateName = cateName;
		this.description = description;
		this.regDate = regDate;
	}

	public CateVo(int cateNo, int blogNo, String cateName, String description, String regDate) {
		this.cateNo = cateNo;
		this.blogNo = blogNo;
		this.cateName = cateName;
		this.description = description;
		this.regDate = regDate;
	}

	public CateVo(int cateNo, int blogNo, String cateName, String description, String regDate, int postNum) {
		this.cateNo = cateNo;
		this.blogNo = blogNo;
		this.cateName = cateName;
		this.description = description;
		this.regDate = regDate;
		this.postNum = postNum;
	}

	public int getCateNo() {
		return cateNo;
	}

	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}

	public int getBlogNo() {
		return blogNo;
	}

	public void setBlogNo(int blogNo) {
		this.blogNo = blogNo;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	@Override
	public String toString() {
		return "CateVo [cateNo=" + cateNo + ", blogNo=" + blogNo + ", cateName=" + cateName + ", description="
				+ description + ", regDate=" + regDate + ", postNum=" + postNum + "]";
	}

}
