package com.mn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mn.vo.PostVo;

@Repository
public class PostDao {

	@Autowired
	private SqlSession sqlSession;
	
	//특정 회원의 선택한 카테고리 포스트 가져오기
	public List<PostVo> selectList(int cateNo) {
		return sqlSession.selectList("post.selectList", cateNo);
	}
	
	//선택한 포스트 가져오기
	public PostVo selectPost(int postNo) {
		return sqlSession.selectOne("post.selectPost" , postNo);
	}
	
	//포스트 글 가져오기
	public int selectPostNum(int blogNo) {
		return sqlSession.selectOne("post.selectPostNum", blogNo);
	}
	
	//작성자 이름 가져오기
	public String selectUserName(String id) {
		return sqlSession.selectOne("post.selectUserName", id);
	}
	
	//포스트 등록
	public int insertPost(PostVo postVo) {
		return sqlSession.insert("post.insertPost", postVo);
	}
	
	//포스트 삭제
	public int postRemove(int postNo) {
		return sqlSession.delete("post.deletePost", postNo);
	}
}

