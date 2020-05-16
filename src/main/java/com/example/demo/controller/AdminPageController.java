package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminPageController {
	
	//관리자페이지메인
	@RequestMapping("/adminpage/adminpage")
	public ModelAndView adminpage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/adminpage/adminpage");
		return mav;
	}
	
	//회원목록
	@RequestMapping("/adminpage/member_list")
	public ModelAndView member_list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/adminpage/member_list");
		return mav;
	}
	
	//게시물목록
	@RequestMapping("/adminpage/board_list")
	public ModelAndView board_list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/adminpage/board_list");
		return mav;
	}
}
