package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {
	
	//마이페이지 메인
	@RequestMapping("/mypage/mypage")
	public ModelAndView mypage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/mypage");
		
		return mav;
	}
	
	
	//사람 정보 수정
	@RequestMapping("/mypage/people_info_up")
	public ModelAndView people_info_up() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/people_info");
		return mav;
	}
	
	//사람 사진 수정
	@RequestMapping("/mypage/people_pic_up")
	public ModelAndView people_pic_up() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/people_pic");
		return mav;
	}
	
	//동물 정보 수정
	@RequestMapping("/mypage/animal_indo_up")
	public ModelAndView animal_info_up() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/animal_info");
		return mav;
	}
	
	//동물 사진 수정
	@RequestMapping("/mypage/animal_pic_up")
	public ModelAndView animal_pic_up() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/animal_pic");
		return mav;
	}
	
	//내가 작성한 글
	@RequestMapping("/mypage/board_list")
	public ModelAndView board_list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/board_list");
		return mav;
	}
	
	//내 결제 내역
	@RequestMapping("/mypage/pay_list")
	public ModelAndView pay_list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/pay_list");
		return mav;
	}
	
	//내가 신청한 함께가요 리스트
	@RequestMapping("/mypage/together_list")
	public ModelAndView together() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/together_list");
		return mav;
	}
}
