package com.mn.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mn.vo.UserVo;

@Repository
public class UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	//회원가입
	public int insert(UserVo userVo) {
		return sqlSession.insert("user.insert", userVo);
	}
	
	//아이디 중복체크
	public int getCountById(String id) {
		return sqlSession.selectOne("user.selectUserByIdCheck", id);
	}
	
	//이름 중복체크
	public int getCountByName(String name) {
		return sqlSession.selectOne("user.selectUserByNameCheck", name);
	}
	
	//로그인
	public UserVo selectUserVo(UserVo userVo) {
		return sqlSession.selectOne("user.selectUserForLogin", userVo);
	}
	
	//회원정보수정
	public int userUpdate(UserVo userVo) {
		System.out.println("dao:" +userVo.toString());
		int result = sqlSession.update("user.userUpdate",userVo);
		System.out.println(result);
		return result;
	}

	//퍼블리셔 지원자 체크
	public int applyCheck(String id) {
		int result = sqlSession.selectOne("user.applyCheck", id);
		return result;
	}
	
	//퍼블리셔 정보 수정
	public int updateUserPermit(UserVo userVo) {
		int result = sqlSession.update("user.updateUserPermit", userVo);
		return result;
	}
	
	//블로그 기본정보 수정
	@Transactional
	public int updateUserInfo(UserVo userVo) {
		int result = sqlSession.update("user.updateUserBasic", userVo);
		return result;
	}
	
	//회원탈퇴
	public int userDelete(int userNo) {
		int result = sqlSession.delete("user.userDelete", userNo);
		return result;
	}
}
