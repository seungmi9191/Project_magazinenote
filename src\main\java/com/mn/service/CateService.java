package com.mn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mn.dao.CateDao;
import com.mn.vo.CateVo;

@Service
public class CateService {
	
	@Autowired
	private CateDao cateDao;
	
	//카테고리 리스트 불러오기
	public List<CateVo> getCateList(int no) {
		return cateDao.selectList(no);
	}
	
	//카테고리 추가하고 방금 추가한 내용이 담긴 리스트를 받아옴
	public CateVo insertCate(CateVo cateVo) {
		int cateNo = cateDao.insertCate(cateVo);
		
		//리스트 받아옴
		return cateDao.selectCate(cateNo);
	}
	
	//카테고리 삭제
	public boolean removeCate(int cateNo) {
		int isExist = cateDao.removeCate(cateNo);
		
		boolean result = true;
		if(isExist>0) {
			result = true;
		} else {
			result = false;
		}
		
		return result;
	}

}
