package com.mn.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mn.service.CmtService;
import com.mn.vo.CmtVo;

@Controller
@RequestMapping(value="/{id}")
public class ApiCmtController {

	@Autowired
	private CmtService cmtService;
	
	//포스트별 댓글 리스트 가져오기
	@ResponseBody
	@RequestMapping(value="/listCmt/{postNo}", method=RequestMethod.POST) 
	public List<CmtVo> cmtList(@PathVariable("id") String id, @PathVariable("postNo") int postNo){
		
		System.out.println("넘어온 글번호: " + postNo);
		
		List<CmtVo> cmtList = cmtService.getCmtList(postNo);
		System.out.println("받아온 코멘트: " + cmtList.toString());
		
		return cmtList;
	}
	
	//댓글달기
	@ResponseBody
	@RequestMapping(value="/add", method=RequestMethod.POST) 
	public CmtVo cmtInsert(@PathVariable("id") String id, @ModelAttribute CmtVo cmtVo) {
		return cmtService.cmtInsert(cmtVo);
	}
	
	//댓글삭제
	@ResponseBody
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public boolean cmtRemove(@RequestParam("cmtNo") int cmtNo) {
		boolean result = cmtService.removeCmt(cmtNo);
		
		return result;
	}
	
}
