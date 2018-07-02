package com.mn.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.mn.dao.BlogDao;
import com.mn.dao.UserDao;
import com.mn.vo.BlogVo;
import com.mn.vo.StorageVo;
import com.mn.vo.UserVo;

@Service
public class BlogService {

	@Autowired
	private BlogDao blogDao;
	
	@Autowired
	private UserDao userDao;
	
	//id로 usrNo 조회하기
	public Long getUserNo(String id) {
		System.out.println("받아온 userid: " + id);
		return blogDao.selectByUserNo(id);
	}
	
	//userNo로 블로그 정보 받아오기
	public BlogVo getBlog(Long no) {
		return blogDao.selectByBlogInfo(no);
	}
	
	//기본정보 수정
	@Transactional
	public boolean blogAdminBasicModify(BlogVo blogVo, MultipartFile file) {
		
		//파일 정보 수정
		String saveName="";
		

		//파일의 값이 empty가 아니면 아래 실행
		if(!file.isEmpty()) {
			
			String saveDir = "/Users/WOOSEUNGMI/Desktop/2018/upload/";
			
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
			blogVo.setLogoFile(saveName);
			System.out.println("update blogVo: "+blogVo.toString());
			
			int isExist = blogDao.updateByBlogInfo(blogVo);
			System.out.println(isExist);
			
			UserVo userVo = new UserVo();
			userVo.setId(blogVo.getId());
			userVo.setName(blogVo.getName());
			
			userDao.updateUserInfo(userVo);
			System.out.println("userVo 확인: " + userVo.toString());
			
			boolean result = true;
			if(isExist > 0) {
				result = true;
				System.out.println("블로그 정보 수정성공!");
			} else {
				result = false;
				System.out.println("블로그 정보 수정실패!");
			}
			
		return result;
	}
	
	//메인블로그리스트 출력
	public List<BlogVo> getBlogListAll() {
		return blogDao.getBlogListAll();
	}
	 
	//카테고리 -1일 때 포스트정보 불러오기
	/*public List<PostVo> getPostInfo(Long no) {
		return blogDao.getPost(no);
	}*/
	
	//서재보관함
	/*public boolean addBookmark(StorageVo sVo) {
		int isExist = blogDao.addBookmark(sVo);
		
		boolean result = true;
		if(isExist>0) {
			result = true;
		} else {
			result = false;
		}
		
		return result;
	}
	
	//가져오기
	public List<StorageVo> getStorage(StorageVo sVo) {
		return blogDao.getStorage(sVo);
	}*/
}
