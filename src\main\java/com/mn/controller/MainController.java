package com.mn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mn.service.BlogService;
import com.mn.vo.BlogVo;


@Controller
public class MainController{
	
	@Autowired
	private BlogService blogService;

    @RequestMapping(value="/", method=RequestMethod.GET)
    public String Main(Model model){
        System.out.println("/main");
        List<BlogVo> blogList = blogService.getBlogListAll();
        System.out.println("블로그 출력 " + blogList.toString());
        
        model.addAttribute("blogList", blogList);
        
        return "main/index";
    }
}
