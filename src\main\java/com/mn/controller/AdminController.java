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

import com.mn.service.AdminService;
import com.mn.service.UserService;
import com.mn.vo.PostVo;
import com.mn.vo.UserVo;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private UserService userService;
	
	   
	   //전체관리자 처리
	   @RequestMapping(value="/page", method=RequestMethod.GET)
	   public String adminPage() {
		   
		   System.out.println("관리자페이지 이동");
		   return "admin/admin-index";
	   }
	     
	   @RequestMapping(value="/logout", method=RequestMethod.GET)
	   public String adminview() {
		   
		   System.out.println("관리자페이지 이동");
		   return "redirect:/";
	   }
	   
	   //관리자 - 신청리스트 불러오기
	   @RequestMapping(value="/applylist", method=RequestMethod.GET)
	   public String applyList(Model model) {
		   
		   List<UserVo> aList = adminService.aList();
		  // System.out.println(aList);
		   model.addAttribute("aList",aList);
		   
		   return "admin/admin-index";
	   }
	   
	   //지원 상세페이지 보기
	   @RequestMapping(value="/view", method=RequestMethod.GET)
	   public String view(@RequestParam("id") String id, Model model) {
		   
		   UserVo vo = adminService.viewId(id);
		   model.addAttribute("vo",vo);
		   
		   return "admin/admin-detail";
	   }
	   
	   //승인처리
	   @RequestMapping(value="/permit", method=RequestMethod.POST)
	   public String applyOk(@ModelAttribute UserVo userVo) {
		   
		   System.out.println("승인시:"+userVo.toString());
		   userService.userpermit(userVo);
		   
		   return "redirect:/admin/applylist";
	   }
}


