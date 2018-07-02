package com.mn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mn.vo.BlogVo;
import com.mn.vo.StorageVo;

@Repository
public class BlogDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//승인 시 블로그 생성
	public int insertBlog(BlogVo blogVo) {
		return sqlSession.insert("blog.insertBlog", blogVo);
	}
	
	//id로 userNo 받아오기
	public Long selectByUserNo(String id) {
		return sqlSession.selectOne("blog.selectByUserNo", id);
	}
	
	//블로그 정보 받아오기
	public BlogVo selectByBlogInfo(Long no) {
		return sqlSession.selectOne("blog.selectByBlogInfo", no);
	}
	
	//블로그 기본정보 수정
	public int updateByBlogInfo(BlogVo blogVo) {
		int result = sqlSession.update("blog.updateUserBasic", blogVo);
		return result;
	}
	
	//메인 블로그 리스트 가져오기
	public List<BlogVo> getBlogListAll() {
		return sqlSession.selectList("blog.getBlogListAll");
	}
	
	//카테고리 -1일 때 블로그 글 조회
	/*public List<PostVo> getPost(Long no) {
		return sqlSession.selectList("blog.getPost", no);
	}*/
	
	//북마크 추가
	/*public int addBookmark(StorageVo sVo) {
		return sqlSession.insert("blog.insertBookMark", sVo);
	}
	
	//리스트
	public List<StorageVo> getStorage(StorageVo sVo) {
		return sqlSession.selectList("blog.getStorage", sVo);
	}*/

}
