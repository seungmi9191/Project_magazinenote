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
@RequestMapping(value="/user")
public class UserController {
	
	String url;
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinForm() {
		System.out.println("회원가입 폼 진입");
		return "user/joinForm";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(@ModelAttribute UserVo userVo) {
		
		System.out.println("UserVo enter: " + userVo.toString());
		
		if(userService.join(userVo)) {
			
			System.out.println("회원가입 성공!");
			
			//파라미터 숨긴채로 redirect 시키기
			return "redirect:/user/login";	
			
		} else {
			System.out.println("회원가입 실패");
			return "/user/join";
		}
		
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		return "user/loginForm";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST) 
	public String login(@ModelAttribute UserVo userVo, HttpSession session, Model model) {
			System.out.println("컨트롤러 진입");
			System.out.println(userVo.toString());
			UserVo authUser = userService.login(userVo);
			System.out.println("authUser:" + authUser);
			
			//세션처리
			if(authUser != null) { //성공
				session.setAttribute("authUser", authUser);
				
				//권한별 페이지처리
				/*if(authUser.getAuthority().equals("ROLE_USER")) {
					url = "redirect:/";
				} else if(authUser.getAuthority().equals("ROLE_PUBLISHER")) {					
					url = "redirect:/";
				} else if(authUser.getAuthority().equals("ROLE_ADMIN")) {
					url = "redirect:/master/";
				}*/
				
				url = "redirect:/";
				
			} else { //실패
				url = "redirect:/user/login?result=fail";
			}
			return url;
	}
	
	//로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("authUser");
		session.invalidate();
		
		return "redirect:/";
	}
	
	//회원탈퇴
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String userDeleteForm() {
		
		return "user/userDeleteForm";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String userDelete(@RequestParam("userNo") int userNo, HttpSession session) {
		
		System.out.println("받아온 탈퇴usrNo: " + userNo);
		
		userService.userDelete(userNo);
		session.removeAttribute("authUser");
		session.invalidate();
		
		return "redirect:/";
	}
}
