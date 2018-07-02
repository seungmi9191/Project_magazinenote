package com.mn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mn.dao.AdminDao;
import com.mn.vo.UserVo;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;
	
	
	//신청자 리스트 불러오기
	public List<UserVo> aList() {
		return adminDao.selectList();
	}
	
	//지원 상세페이지 보기
	public UserVo viewId(String id) {
		return adminDao.selectId(id);
	}
}
