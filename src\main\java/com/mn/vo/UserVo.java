package com.mn.vo;

public class UserVo {

	private int userNo;
	private String id;
	private String password;
	private String name;
	private int regDate;
	private String mnIntro;
	private String auther;
	private String urlOrigin;
	private String url;
	private String applyDate;
	private String authority;
	private int authState;

	public UserVo() {
	}
	

	public UserVo(int userNo, String mnIntro, String auther, String urlOrigin, String url, String applyDate,
			int authState) {
		this.userNo = userNo;
		this.mnIntro = mnIntro;
		this.auther = auther;
		this.urlOrigin = urlOrigin;
		this.url = url;
		this.applyDate = applyDate;
		this.authState = authState;
	}
	
	public UserVo(int userNo, String id, String password, String name, int regDate, String authority, int authState) {
		this.userNo = userNo;
		this.id = id;
		this.password = password;
		this.name = name;
		this.regDate = regDate;
		this.authority = authority;
		this.authState = authState;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getRegDate() {
		return regDate;
	}


	public void setRegDate(int regDate) {
		this.regDate = regDate;
	}


	public String getMnIntro() {
		return mnIntro;
	}


	public void setMnIntro(String mnIntro) {
		this.mnIntro = mnIntro;
	}


	public String getAuther() {
		return auther;
	}


	public void setAuther(String auther) {
		this.auther = auther;
	}


	public String getUrlOrigin() {
		return urlOrigin;
	}


	public void setUrlOrigin(String urlOrigin) {
		this.urlOrigin = urlOrigin;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getApplyDate() {
		return applyDate;
	}


	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}


	public String getAuthority() {
		return authority;
	}


	public void setAuthority(String authority) {
		this.authority = authority;
	}


	public int getAuthState() {
		return authState;
	}


	public void setAuthState(int authState) {
		this.authState = authState;
	}


	@Override
	public String toString() {
		return "UserVo [userNo=" + userNo + ", id=" + id + ", password=" + password + ", name=" + name + ", regDate="
				+ regDate + ", mnIntro=" + mnIntro + ", auther=" + auther + ", urlOrigin=" + urlOrigin + ", url=" + url
				+ ", applyDate=" + applyDate + ", authority=" + authority + ", authState=" + authState + "]";
	}
	
	
	
}