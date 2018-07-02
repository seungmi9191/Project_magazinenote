package com.mn.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mn.service.UserService;
import com.mn.vo.UserVo;

@Controller
@RequestMapping(value="/publisher")
public class PublisherController {
	
	String url;
	
	@Autowired
	private UserService userService;
	
	//메거진퍼블리셔등록 소개
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String publishMain(HttpSession session, Model model) {
		
	   UserVo authUser = (UserVo)session.getAttribute("authUser");
	   System.out.println("세션 tostring:" + authUser.toString());
	   model.addAttribute("authUser");
		
		return "publisher/publisher-intro";
	}
	//퍼블리셔 등록폼 이동
	@RequestMapping(value="/apply", method=RequestMethod.GET)
	public String applyForm(@RequestParam("id") String id, HttpSession session, Model model) {
		
		boolean result = userService.applyCheck(id);
		System.out.println("지원결과:"+result);
		
		
		if(result == true) {
			url = "publisher/publisher-apply"; 
			
		} else {
			url = "redirect:/";
		}
		
		return url;
	}
	
	//퍼블리셔 등록하기
	@RequestMapping(value="/apply", method=RequestMethod.POST)
	public String publishApply(@ModelAttribute UserVo userVo) {
		
		userService.userUpdate(userVo);
	
		return "redirect:/";
	}
	
	
}
