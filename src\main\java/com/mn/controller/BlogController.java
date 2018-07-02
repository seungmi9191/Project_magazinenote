package com.mn.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mn.service.BlogService;
import com.mn.service.CateService;
import com.mn.service.PostService;
import com.mn.vo.BlogVo;
import com.mn.vo.CateVo;
import com.mn.vo.PostVo;
import com.mn.vo.StorageVo;
import com.mn.vo.UserVo;

@Controller
public class BlogController {

	@Autowired
	private BlogService	blogService;
	
	@Autowired
	private CateService cateService;
	
	@Autowired
	private PostService postService;

	
	//블로그메인
	@RequestMapping(value="/{id}", method=RequestMethod.GET)
	public String admin(@PathVariable("id") String id, 
						@RequestParam(value="cateNo", required=false, defaultValue="0") int cateNo,
						@RequestParam(value="postNo", required=false, defaultValue="0") int postNo,
						HttpSession session, Model model) {
			
			//UserVo authUser = (UserVo)session.getAttribute("authUser");
			// System.out.println("세션 tostring:" + authUser.toString());
			 
			 //아이디를 통해 userNo 얻어오기
			 Long no = blogService.getUserNo(id);
			 //System.out.println("받아온 userNo: " + no);
			 
			 if(no != null) {
				 
				 //블로그 정보
				 BlogVo blogVo = blogService.getBlog(no);
				 //System.out.println("블로그:" + blogVo);
				 
				 //카테고리 정보
				 List<CateVo> cateList = cateService.getCateList(blogVo.getBlogNo());
				 // System.out.println("카테고리:" + cateList);
				 
				 //선택한 카테고리가 없는 경우 가장 상단의 카테고리 선택
				 if(cateNo == 0) {
					 cateNo = cateList.get(0).getCateNo();
				 }

				 //포스트 정보
				 //선택한 카테고리 없으면 전체 리스트 가져오기
				 List<PostVo> postList = postService.getPostList(cateNo);
				 //System.out.println("postList: " + postList);
				 //System.out.println("postNo: " + postNo);
				 
				 //선택한 포스트 글 출력하기
				 if(postNo == 0 && postList.size() != 0) { //postNo == 0 파라미터에서 넘어온 값이 없을 때, postList.size() != 0 출력된 리스트가 1개 이상일 때
					 //맨 앞의 글 번호 가져옴
					 postNo = postList.get(0).getPostNo();
				 }
				 
				 //파라미터로 넘어온 경우 선택한 포스트 번호
				 //그 외에는 맨 앞의 글 번호로 포스트를 가져옴
				 PostVo postVo = postService.getPost(postNo);
				 System.out.println("포스트vo: "+postVo);
				 
				 //포스트 수 가져오기
				 int postNum = postService.getPostNum(blogVo.getBlogNo());
				 //System.out.println("포스트 수: " + postNum);
				 
				 //즐겨찾기 확인
				 /*StorageVo sVo = new StorageVo();
				 sVo.setBlogNo(blogVo.getBlogNo());
				 sVo.setUserNo(authUser.getUserNo());
				 List<StorageVo> sList = blogService.getStorage(sVo);
				 
				 if(userNo == 0 && blogNo == 0 && sList.size() != 0) {
					 userNo = sList.get(0).getUserNo();
					 blogNo = sList.get(0).getBlogNo();
				 }*/
				 
				 //작성자 이름 가져오기
				 //String name = postService.getUserName(id);
				 //System.out.println("받아온 id값: "+ name);
				 
				// model.addAttribute("sList", sList);
				 model.addAttribute("blogVo", blogVo);
				 model.addAttribute("cateList", cateList);
				 model.addAttribute("postList", postList);
				 model.addAttribute("postVo", postVo);
				 model.addAttribute("newLine", "\r\n"); //줄바꾸기
				 //model.addAttribute("id",id);
				 model.addAttribute("postNum", postNum);
				 //model.addAttribute("name", name);

				 return "library/library-main";
			 } else {
				 return "redirect:/user/login";
			 }
			// model.addAttribute("authUser");
		}
		
	
		//기본 설정 화면
		@RequestMapping(value="/{id}/admin/basic", method=RequestMethod.GET)
		public String adminBasic(@PathVariable("id") String id, HttpSession session, Model model) {
		   
		      //로그인한 사용자 아이디(세션에서 가져오기)
		      UserVo authUser = (UserVo)session.getAttribute("authUser");
		      String loginId = authUser.getId();
		      
		      //로그인했고 자신의 블로그일 때 진행
		      if(authUser != null && id.equals(loginId)) {
		    	  
		    	  	//아이디를 통해 userNo 얻어오기
				    Long no = blogService.getUserNo(id);
					//System.out.println("받아온 userNo: " + no);
					 
			    	//블로그 정보
					BlogVo blogVo = blogService.getBlog(no);
					//System.out.println("블로그:" + blogVo);
					
					//작성자 이름 가져오기
					String name = postService.getUserName(id);
					//System.out.println("받아온 id값: "+ name);
					
					model.addAttribute("blogVo", blogVo);
					model.addAttribute("name",name);
		    	  
		    	return "library/admin/admin-library-basic";
		    } else {
		    	return "error/403";
		    }
               
		}
		
		//기본정보수정
		@RequestMapping(value="/{id}/admin/basicModify", method=RequestMethod.POST)
		public String blogAdminBasicModify(@RequestParam("file") MultipartFile file, @ModelAttribute BlogVo blogVo, HttpSession session, Model model) {
			
			//현재 방문한 블로그 주인 id
			String id = blogVo.getId();
			
			//로그인한 사용자 아이디(세션에서 가져오기)
		    UserVo authUser = (UserVo)session.getAttribute("authUser");
		    String loginId = authUser.getId();
			
			//로그인했고 자신의 블로그일 때 진행
		    if(authUser != null && id.equals(loginId)) {
		    	
		    	//System.out.println("수정폼에서 받아온 blogVo: " + blogVo.toString());
		    
		    	//기본 정보 수정 (blog 정보 수정 / users의 name 수정)
		    	authUser.setName(blogVo.getName()); //세션도 이름 같이 업데이트 시켜주기
		    	blogService.blogAdminBasicModify(blogVo, file);
		    	
		    	return "redirect:/" + blogVo.getId() + "/admin/basic";
		    	
		    } else { //타인의 블로그 설정페이지 수정을 시도한 경우
		    	return "error/403";
		    } 
		      
		}
		
		//카테고리 화면
		//등록 수정 ajax는 ApiCateController 확인
		@RequestMapping(value="/{id}/admin/cate", method=RequestMethod.GET)
		public String AdminCate(@PathVariable("id") String id, HttpSession session, Model model) {
			 
			  //로그인한 사용자 아이디(세션에서 가져오기)
		      UserVo authUser = (UserVo)session.getAttribute("authUser");
		      String loginId = authUser.getId();
		      
		      //로그인했고 자신의 블로그일 때 진행
		      if(authUser != null && id.equals(loginId)) {
		    	  
		    	  	//아이디를 통해 userNo 얻어오기
				    Long no = blogService.getUserNo(id);
					//System.out.println("받아온 userNo: " + no);
					 
			    	//블로그 정보
					BlogVo blogVo = blogService.getBlog(no);
					//System.out.println("블로그:" + blogVo);
					
					//카테고리정보 가져오기
					List<CateVo> cateList = cateService.getCateList(blogVo.getBlogNo());
					//System.out.println("카테고리화면 출력: " + cateList.toString());
					
					model.addAttribute("blogVo", blogVo);
					model.addAttribute("cateList", cateList);
					
		    	return "library/admin/admin-library-category";
		   } else {
		    	return "error/403";
		   }
		}
		   
		//포스트
		@RequestMapping(value="/{id}/admin/write", method=RequestMethod.GET)
		public String AdminWritefrom(@PathVariable("id") String id, HttpSession session, Model model) {
			  
			  //로그인한 사용자 아이디(세션에서 가져오기)
		      UserVo authUser = (UserVo)session.getAttribute("authUser");
		      String loginId = authUser.getId();
		      
		      //로그인했고 자신의 블로그일 때 진행
		      if(authUser != null && id.equals(loginId)) {
		    	  
		    	  	//아이디를 통해 userNo 얻어오기
				    Long no = blogService.getUserNo(id);
					//System.out.println("받아온 userNo: " + no);
					 
			    	//블로그 정보
					BlogVo blogVo = blogService.getBlog(no);
					//System.out.println("블로그:" + blogVo);
					
					//카테고리정보 가져오기
					List<CateVo> cateList = cateService.getCateList(blogVo.getBlogNo());
					//System.out.println("카테고리화면 출력: " + cateList.toString());
					
					model.addAttribute("blogVo", blogVo);
					model.addAttribute("cateList", cateList);
					
		    	return "library/admin/admin-library-write";
		    	
		   } else {
		    	return "error/403";
		   }
		}
		   
	   //포스트 입력하기
	   @RequestMapping(value="/{id}/admin/write", method=RequestMethod.POST)
	   public String AdminWrite(@PathVariable("id") String id, HttpSession session, 
	    		 		@ModelAttribute PostVo postVo, @RequestParam("file") MultipartFile file) {
		    	 
			 // System.out.println("form에서 받아온 정보: " + postVo.toString());
			  boolean result = postService.write(postVo, file);
					
			 return "redirect:/"+id+"/admin/write";
	 }
		 
	  //포스트 삭제하기
	   @RequestMapping(value="/{id}/admin/postDelete", method=RequestMethod.GET)
		public String blogAdminPostModify(@PathVariable("id") String id, @RequestParam("postNo") int postNo, Model model) {
			System.out.println("받아온 Qㅡㄹ" + postNo);
			
			//포스트No로 수정 글 불러오기
			boolean postVo = postService.postRemove(postNo);
			
			return "redirect:/"+id;
		}
	   
	   
	   
		
}
