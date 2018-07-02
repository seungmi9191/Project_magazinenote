package com.mn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mn.vo.UserVo;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//신청자 리스트 불러오기
	public List<UserVo> selectList() {
		return sqlSession.selectList("admin.selectByApplyList");
	}
	
	//지원 상세페이지 보기
	public UserVo selectId(String id) {
		return sqlSession.selectOne("admin.selectView", id);
	}
	
}
