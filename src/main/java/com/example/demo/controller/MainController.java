package com.example.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

//import com.example.demo.util.AopLog.NoLogging;

//민아) 5/19, 메인페이지 @NoLogging 처리 
@RestController
public class MainController {
	
	//사이트 메인페이지
//	@NoLogging
	@RequestMapping("/MainPage")
	public static ModelAndView mainPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main");
		
		return mav;
	}
}
