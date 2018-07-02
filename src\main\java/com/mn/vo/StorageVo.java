package com.mn.vo;

public class StorageVo {

	private int storageNo;
	private int blogNo;
	private int userNo;

	private String blogTitle;
	private String explanation;

	public StorageVo() {
	}

	public StorageVo(int blogNo, int userNo) {
		this.blogNo = blogNo;
		this.userNo = userNo;
	}

	public StorageVo(int storageNo, int blogNo, int userNo) {
		this.storageNo = storageNo;
		this.blogNo = blogNo;
		this.userNo = userNo;
	}

	public StorageVo(int blogNo, int userNo, String blogTitle, String explanation) {
		this.blogNo = blogNo;
		this.userNo = userNo;
		this.blogTitle = blogTitle;
		this.explanation = explanation;
	}

	public StorageVo(int storageNo, int blogNo, int userNo, String blogTitle, String explanation) {
		this.storageNo = storageNo;
		this.blogNo = blogNo;
		this.userNo = userNo;
		this.blogTitle = blogTitle;
		this.explanation = explanation;
	}

	public int getStorageNo() {
		return storageNo;
	}

	public void setStorageNo(int storageNo) {
		this.storageNo = storageNo;
	}

	public int getBlogNo() {
		return blogNo;
	}

	public void setBlogNo(int blogNo) {
		this.blogNo = blogNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "StorageVo [storageNo=" + storageNo + ", blogNo=" + blogNo + ", userNo=" + userNo + ", blogTitle="
				+ blogTitle + ", explanation=" + explanation + "]";
	}

	

}
