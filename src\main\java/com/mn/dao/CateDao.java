package com.mn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mn.vo.CateVo;

@Repository
public class CateDao {

		@Autowired
		private SqlSession sqlSession;
	
		//승인 시 카테고리 기본정보 저장,카테고리 추가
		public int insertCate(CateVo cateVo) {
			sqlSession.insert("cate.insertCate", cateVo);
			return cateVo.getCateNo();
			
		}
		
		//카테고리 정보 가져오기
		public List<CateVo> selectList(int no) {
			return sqlSession.selectList("cate.selectList", no);
		}
		
		//카테고리 추가된 정보 가져오기
		public CateVo selectCate(int cateNo) {
			return sqlSession.selectOne("cate.selectCate", cateNo );
		}
		
		//카테고리 삭제
		public int removeCate(int cateNo) {
			return sqlSession.delete("cate.deleteCate", cateNo);
		}
		
}
