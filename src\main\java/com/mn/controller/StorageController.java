package com.mn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mn.service.BlogService;
import com.mn.vo.StorageVo;
@Controller
@RequestMapping(value="/{id}")
public class StorageController {
	
	@Autowired
	private BlogService blogService;

	@RequestMapping(value="/", method=RequestMethod.GET)
	public String publisherStorage() {
		
		return "user/storage/publisher-storage";
	}
	
	@RequestMapping(value="/storage", method=RequestMethod.GET)
	public String userStorage(@PathVariable("id") String id, 
			@RequestParam("blogNo") int blogNo, @RequestParam("userNo") int userNo, StorageVo sVo) {
		
		sVo.setBlogNo(blogNo);
		sVo.setUserNo(userNo);
		System.out.println(sVo.toString());
		System.out.println(blogNo + "- " + userNo);
		//blogService.addBookmark(sVo);
		
		return "redirect:/";
	}
}
