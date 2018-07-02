package com.mn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mn.vo.CmtVo;

@Repository
public class CmtDao {

	@Autowired
	private SqlSession sqlSession;
	
	//포스트 댓글 불러오기
	public List<CmtVo> getCmtList(int postNo) {
		return sqlSession.selectList("cmt.selectCmtList", postNo);
	}
	
	//댓글 입력
	public int cmtInsert(CmtVo cmtVo) {
		sqlSession.insert("cmt.insertCmt", cmtVo);
		return cmtVo.getCmtNo();
	}
	
	//댓글 추가된 정보
	public CmtVo selectCmt(int cmtNo) {
		return sqlSession.selectOne("cmt.selectCmt",cmtNo);
	}
	
	//댓글삭제
	public int removeCmt(int cmtNo) {
		return sqlSession.delete("cmt.deleteCmt", cmtNo);
	}
}
