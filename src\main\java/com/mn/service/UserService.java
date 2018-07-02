package com.mn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mn.dao.BlogDao;
import com.mn.dao.CateDao;
import com.mn.dao.UserDao;
import com.mn.vo.BlogVo;
import com.mn.vo.CateVo;
import com.mn.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private BlogDao blogDao;
	
	@Autowired
	private CateDao cateDao;
	
	//회원가입
	public boolean join(UserVo userVo) {
		
		int isExist = userDao.insert(userVo);
		
		boolean result;
		if(isExist>0) {
			result = true;
		} else {
			result = false;
		}		
		return result;
	}
	
	//아이디 중복체크
	public boolean isCheckOk(String id) {
		
		int isExist = userDao.getCountById(id);
		//System.out.println(isExist);
		
		boolean result = true;
		if(isExist == 0) { //0이면 아이디 없음
			result = true; //사용가능
		} else {
			result = false; //isExist가 1이므로 사용불가
		}
		
		return result;
	}
	
	//이름 중복체크
	public boolean isCheckOkName(String name) {
		
		int isExist = userDao.getCountByName(name);
		System.out.println(isExist);
		
		boolean result = true;
		if(isExist == 0) {
			result = true;
		} else {
			result = false;
		}
		
		return result;
	}
	
	//로그인
	public UserVo login(UserVo userVo) {
		//회원정보 가져옴
		return userDao.selectUserVo(userVo);
	}
	
	//회원정보수정
	public boolean userUpdate(UserVo userVo) {
		
		int isExist = userDao.userUpdate(userVo);
		System.out.println(isExist);
		
		boolean result = true;
		if(isExist == 0) {
			result = true;
		} else {
			result = false;
		}
		
		return result;
	}
	
	//퍼블리셔 신청 확인하기
	public boolean applyCheck(String id) {
		
		int isExist = userDao.applyCheck(id);
		
		boolean result = true;
		if(isExist < 1 ) {
			result = true;
		} else {
			result = false;
		}
		
		return result;
	}
	
	//퍼블리셔 승인 및 블로그 생성
	//승인 시 회원정보 권한&상태 변경, 블로그 기본정보, 카테고리 기본정보 저장되어야 함
	@Transactional
	public boolean userpermit(UserVo userVo) {
		
		int isExist = userDao.updateUserPermit(userVo);
		
		boolean result = true;
		if(isExist < 1 ) {
			result = true;
		} else {
			result = false;
		}
		
		//blog 생성
		BlogVo blogVo = new BlogVo();
		blogVo.setUserNo(userVo.getUserNo());
		blogVo.setBlogTitle(userVo.getName()+ "의 서재입니다.");
		blogVo.setExplanation("서재에 대한 소개를 적어보세요");
		blogVo.setLogoFile("blog_logo.jpg");
		
		blogDao.insertBlog(blogVo);
		
		
		//category 초기값 저장
		CateVo cateVo = new CateVo();
//		cateVo.setUserNo(userVo.getUserNo());
		cateVo.setBlogNo(blogVo.getBlogNo());
		System.out.println("받아오는 blogNo" + cateVo.getBlogNo());
		cateVo.setCateName("잡지소개");
		cateVo.setDescription("잡지소개를 꼭 작성하셔서 독자분들에게 매거진을 알려주세요.");
		
		cateDao.insertCate(cateVo);
				
		return result;
	}
	
	//회원탈퇴
	public boolean userDelete(int userNo) {
		
		int isExist = userDao.userDelete(userNo);
		System.out.println(isExist);
		
		boolean result = true;
		if(isExist == 0) {
			result = true;
		} else {
			result = false;
		}
		
		return result;
	}

}
