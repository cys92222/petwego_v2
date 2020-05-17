package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.MypageService;
import com.example.demo.vo.Animal_info;
import com.example.demo.vo.MemberInfoVo;

@Controller
public class MyPageController {
	
	@Autowired
	MypageService mypageservice;
	
	//마이페이지 메인
	@RequestMapping("/mypage/mypage")
	public ModelAndView mypage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/mypage");
		MemberInfoVo m = new MemberInfoVo();
		//아이디 임의로 설정
		m.setUser_id("user1");
		//내 정보
		mav.addObject("myinfo", mypageservice.select_myinfo(m));
		
		//내가 작성한 글
		mav.addObject("myboard", mypageservice.search_my_board(m));
		
		//내가 작성한 sns
		mav.addObject("mysns", mypageservice.search_my_sns(m));
		
		//내가 쓴 함께가요
		mav.addObject("mytogether", mypageservice.search_my_together(m));
		System.out.println(mypageservice.select_myinfo(m));
		
		return mav;
	}
	
	//반려동물 등록
	@RequestMapping("/mypage/insert_animal")
	public ModelAndView insert_animal() {
		ModelAndView mav = new ModelAndView();
//		mypageservice.insert_pet(a);
		mav.setViewName("/mypage/insert_animal");
		return mav;
	}
	
	//사람 정보 수정
	@RequestMapping("/mypage/people_info_up")
	public ModelAndView people_info_up(MemberInfoVo m) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/people_info");
		mypageservice.update_myinfo(m);
		return mav;
	}
	
	//사람 사진 수정
	@RequestMapping("/mypage/people_pic_up")
	public ModelAndView people_pic_up(MemberInfoVo m) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/people_pic");
		m.setFname(m.getFname());
		mypageservice.update_myinfo(m);
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
		MemberInfoVo m = new MemberInfoVo();
		m.setUser_id("user1");
		mav.setViewName("/mypage/board_list");
		mav.addObject("myboard", mypageservice.search_my_board(m));
		return mav;
	}
	
	//내 결제 내역
	@RequestMapping("/mypage/pay_list")
	public ModelAndView pay_list() {
		ModelAndView mav = new ModelAndView();
		MemberInfoVo m = new MemberInfoVo();
		m.setUser_id("user1");
		mav.setViewName("/mypage/pay_list");
		return mav;
	}
	
	//내가 쓴 함께가요 리스트
	@RequestMapping("/mypage/together_list")
	public ModelAndView together_list() {
		ModelAndView mav = new ModelAndView();
		MemberInfoVo m = new MemberInfoVo();
		m.setUser_id("user1");
		mav.setViewName("/mypage/together_list");
		mav.addObject("mytogether", mypageservice.search_my_together(m));
		return mav;
	}
	
	//내가 쓴 sns리스트
	@RequestMapping("/mypage/sns_list")
	public ModelAndView sns_list() {
		ModelAndView mav = new ModelAndView();
		MemberInfoVo m = new MemberInfoVo();
		m.setUser_id("user1");
		mav.setViewName("/mypage/sns_list");
		mav.addObject("mysns", mypageservice.search_my_sns(m));
		return mav;
	}
}
