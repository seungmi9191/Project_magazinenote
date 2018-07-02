package com.mn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mn.dao.CmtDao;
import com.mn.vo.CmtVo;

@Service
public class CmtService {

	@Autowired
	private CmtDao cmtDao;
	
	//포스트별 댓글 리스트 가져오기
	public List<CmtVo> getCmtList(int postNo) {
		return cmtDao.getCmtList(postNo);
	}
	
	//댓글추가
	public CmtVo cmtInsert(CmtVo cmtVo) {
		int cmtNo = cmtDao.cmtInsert(cmtVo);
		
		return cmtDao.selectCmt(cmtNo);
	}
	
	//댓글삭제
	public boolean removeCmt(int cmtNo) {
		int isExist  = cmtDao.removeCmt(cmtNo);
		
		boolean result = true;
		if(isExist>0) {
			result = true;
		} else {
			result = false;
		}
		
		return result;
	}
}
