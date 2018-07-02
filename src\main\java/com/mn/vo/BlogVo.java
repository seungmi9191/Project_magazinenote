package com.mn.vo;

public class BlogVo {

	private int blogNo;
	private String blogTitle; // 블로그제목
	private String logoFile; // 블로그이미지경로
	private String explanation;
	private int userNo; //FK
	private String regDate;
	private String id; // 아이디
	private String name; //이름

	public BlogVo() {

	}
	
	public BlogVo(int blogNo, String blogTitle, String logoFile, String explanation, String id, int userNo,
			String regDate) {
		this.blogNo = blogNo;
		this.blogTitle = blogTitle;
		this.logoFile = logoFile;
		this.explanation = explanation;
		this.id = id;
		this.userNo = userNo;
		this.regDate = regDate;
	}
	
	
	public BlogVo(int blogNo, String blogTitle, String logoFile, String explanation, int userNo, String regDate,
			String name) {
		this.blogNo = blogNo;
		this.blogTitle = blogTitle;
		this.logoFile = logoFile;
		this.explanation = explanation;
		this.userNo = userNo;
		this.regDate = regDate;
		this.name = name;
	}

	public BlogVo(int blogNo, String blogTitle, String logoFile, String explanation, int userNo, String regDate,
			String id, String name) {
		this.blogNo = blogNo;
		this.blogTitle = blogTitle;
		this.logoFile = logoFile;
		this.explanation = explanation;
		this.userNo = userNo;
		this.regDate = regDate;
		this.id = id;
		this.name = name;
	}

	public int getBlogNo() {
		return blogNo;
	}

	public void setBlogNo(int blogNo) {
		this.blogNo = blogNo;
	}

	public String getBlogTitle() {
		return blogTitle;
	}

	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}

	public String getLogoFile() {
		return logoFile;
	}

	public void setLogoFile(String logoFile) {
		this.logoFile = logoFile;
	}

	public String getExplanation() {
		return explanation;
	}

	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "BlogVo [blogNo=" + blogNo + ", blogTitle=" + blogTitle + ", logoFile=" + logoFile + ", explanation="
				+ explanation + ", userNo=" + userNo + ", regDate=" + regDate + ", id=" + id + ", name=" + name + "]";
	}

}
