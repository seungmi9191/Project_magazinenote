package com.mn.api.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mn.service.BlogService;
import com.mn.service.CateService;
import com.mn.vo.BlogVo;
import com.mn.vo.CateVo;
import com.mn.vo.UserVo;

@Controller
public class ApiCateController {
	
	@Autowired
	private CateService cateService;
	
	@Autowired
	private BlogService blogService;
	
	
	//회원(블로그)별 카테고리 리스트 가져오기
	@ResponseBody
	@RequestMapping(value="/api/cate/list", method=RequestMethod.POST)
	public List<CateVo> cateList(HttpSession session, Model model) {
		
		  //로그인한 사용자 아이디(세션에서 가져오기)
	      UserVo authUser = (UserVo)session.getAttribute("authUser");
	      String loginId = authUser.getId();
	      
	      //아이디를 통해 userNo 얻어오기
		  Long no = blogService.getUserNo(loginId);
	    
		  //블로그 정보
		  BlogVo blogVo = blogService.getBlog(no);
		  System.out.println("블로그:" + blogVo);
	      
	      //카테고리정보 가져오기
		  List<CateVo> cateList = cateService.getCateList(blogVo.getBlogNo());
		  System.out.println("받아온 카테고리: " + cateList.toString());
		  
		
		  return cateList;
	}
	
	
	//카테고리 추가
	@ResponseBody
	@RequestMapping(value="/api/cate/add", method=RequestMethod.POST)
	public CateVo cateAdd(@ModelAttribute CateVo cateVo) {
		
		System.out.println("넘어온 카테고리: " + cateVo);
		CateVo cateAdd = cateService.insertCate(cateVo);
		System.out.println("삽입 후 불러온 카테고리: " + cateVo);
		
		return cateAdd;
	}
	
	//카테고리 삭제
	@ResponseBody
	@RequestMapping(value="/api/cate/remove", method=RequestMethod.POST)
	public boolean cateRemove(@RequestParam("cateNo") int cateNo) {
		
		System.out.println("넘어온 카테번호: " + cateNo);
		boolean result = cateService.removeCate(cateNo);
		
		return result;
	} 

}
