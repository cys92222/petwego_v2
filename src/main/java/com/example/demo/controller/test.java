package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.util.AopLog.NoLogging;

@Controller
public class test {

	@RequestMapping("/test")
	@NoLogging
	public String test() {
		
		return "test";
	}
}
