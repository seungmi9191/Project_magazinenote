package com.mn.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mn.dao.PostDao;
import com.mn.vo.PostVo;

@Service
public class PostService {
	
	@Autowired
	private PostDao postDao;
	
	
	//특정 회원의 선택한 카테고리 포스트 가져오기
	public List<PostVo> getPostList(int cateNo) {
		return postDao.selectList(cateNo);
	}
	
	//선택한 포스트 가져오기
	public PostVo getPost(int postNo) {
		return postDao.selectPost(postNo);
	}
	
	//포스트 글 수 가져오기
	public int getPostNum(int blogNo) {
		return postDao.selectPostNum(blogNo);
	}
	
	//작성자 이름 가져오기
	public String getUserName(String id) {
		return postDao.selectUserName(id);
	}
	
	//포스트 등록
	public boolean write(PostVo postVo, MultipartFile file) {
		
		//파일 정보 수정
		String saveName="";
		
		//파일의 값이 empty가 아니면 아래 실행
				if(!file.isEmpty()) {
					
					String saveDir = "/Users/WOOSEUNGMI/Desktop/2018/upload/post";
					
					//원본 파일명(사용자 컴퓨터에 저장되어 있던 이름)
					String orgName = file.getOriginalFilename();
					System.out.println("orgName: "+orgName);
					
					//확장자 (파일의 원본 파일명의 .을 기준으로 잘라라)
					String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
					System.out.println("exName: "+exName);
					
					//저장파일명
					saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
					System.out.println("saveName: "+saveName);
					
					//파일패스
					String filePath = saveDir + "/" + saveName;
					System.out.println("filePath: "+filePath);
					
					//파일사이즈
					long fileSize = file.getSize();
					System.out.println(fileSize);
					
				
				//파일 서버에 복사
				try {
					byte[] fileData = file.getBytes();
					OutputStream out = new FileOutputStream( saveDir + "/" + saveName);
					BufferedOutputStream bout = new BufferedOutputStream(out); //버퍼하나 끼워주면 빠름
					
					bout.write(fileData);
					
					if(bout != null) { //데이터랑 상관없이 연결이 있으면 닫아버령
						bout.close();
					}
					
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				} 
				
					//null이 아니면 새로운 파일을 서버에 복사해주고, null이면 아래만 실행!
					//파일경로 DB에 넣어주기
					postVo.setPostImage(saveName);
					System.out.println("insert postVo: "+postVo.toString());
					
					//포스트 저장
					int isExist = postDao.insertPost(postVo);
					
					boolean result = true;
					if(isExist > 0) {
						result = true;
						System.out.println("포스트 삽입 성공!");
					} else {
						result = false;
						System.out.println("포스트 삽입 실패!");
					}
					
		  return result;
	}
	
	//포스트 삭제
	public boolean postRemove(int postNo) {
		int isExist = postDao.postRemove(postNo);
		
		boolean result = true;
		if(isExist > 0) {
			result = true;
		} else {
			result = false;
		}
		
		return result;
	}

}
