package com.example.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MainController {
	
	//사이트 메인페이지
	@RequestMapping("/MainPage")
	public static ModelAndView mainPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main");
		
		return mav;
	}
}
