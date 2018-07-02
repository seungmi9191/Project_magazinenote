package com.mn.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mn.service.UserService;

@Controller
@RequestMapping(value="/api/user")
public class ApiUserController {
		
	@Autowired
	private UserService userService;
	
	//id 중복체크
	@ResponseBody
	@RequestMapping(value="/idcheck", method=RequestMethod.POST)
	public boolean isCheckOk(@RequestParam("id") String id) {
		
		//System.out.println("ajax id check: " + id);
		boolean isCheckOk = userService.isCheckOk(id);
		//System.out.println("idcheck result: " + isCheckOk);
		
		return isCheckOk;
	}
	
	//이름 중복체크
	@ResponseBody
	@RequestMapping(value="/namecheck", method=RequestMethod.POST)
	public boolean isCheckOkName(@RequestParam("name") String name) {
		
		//System.out.println("ajax id check: " + name);
		boolean isCheckOk = userService.isCheckOkName(name);
		//System.out.println("idcheck result: " + isCheckOk);
		
		return isCheckOk;
	}
}
