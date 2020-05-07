package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.QnaService;
import com.google.gson.Gson;

@RestController
public class QnaController {
	
	//service와 의존관계 설정
	@Autowired
	QnaService qnaService;
	
	@RequestMapping("/admin/index")
	public ModelAndView indexQna() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/index");
		return mav;
	}
	
	//qna 리스트
	@RequestMapping("/admin/listQnA")
	public ModelAndView listQna() {
		ModelAndView mav = new ModelAndView();
		
		Gson gson = new Gson();
		String str = "";
		str = gson.toJson(qnaService.listQna());
		mav.setViewName("/admin/listqna");
		mav.addObject("list", str);
		
		return mav;
	}
	
}
