package com.mn.vo;

public class PostVo {

	private int postNo; // 식별번호
	private String postTitle; // 글 제목
	private String postContent; // 글 내용
	private String postImage;
	private String regDate; // 글 작성일
	private int cateNo; // 카테고리번호
	private int blogNo; // 블로그 번호

	public PostVo() {

	}

	public PostVo(String postTitle, String postContent) {
		this.postTitle = postTitle;
		this.postContent = postContent;
	}

	public PostVo(String postTitle, String postContent, int cateNo) {

		this.postTitle = postTitle;
		this.postContent = postContent;
		this.cateNo = cateNo;
	}

	public PostVo(String postTitle, String postContent, String postImage, int cateNo) {

		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postImage = postImage;
		this.cateNo = cateNo;
	}
	
	

	public PostVo(String postTitle, String postContent, String postImage, int cateNo, int blogNo) {
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postImage = postImage;
		this.cateNo = cateNo;
		this.blogNo = blogNo;
	}

	public PostVo(int postNo, String postTitle, String postContent, String postImage, String regDate, int cateNo,
			int blogNo) {
		this.postNo = postNo;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postImage = postImage;
		this.regDate = regDate;
		this.cateNo = cateNo;
		this.blogNo = blogNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPostImage() {
		return postImage;
	}

	public void setPostImage(String postImage) {
		this.postImage = postImage;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
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

	@Override
	public String toString() {
		return "PostVo [postNo=" + postNo + ", postTitle=" + postTitle + ", postContent=" + postContent + ", postImage="
				+ postImage + ", regDate=" + regDate + ", cateNo=" + cateNo + ", blogNo=" + blogNo + "]";
	}

}
