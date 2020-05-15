package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {

	@RequestMapping("/mypage/mypage")
	public ModelAndView mypage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/mypage");
		
		return mav;
	}
}
