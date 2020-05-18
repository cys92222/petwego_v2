package com.example.demo.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.MypageService;
import com.example.demo.vo.Animal_info;
import com.example.demo.vo.MemberInfoVo;
import com.example.demo.vo.Pic_BoardVo;

@Controller
public class MyPageController {
	
	@Autowired
	MypageService mypageservice;
	
	//마이페이지 메인
	@RequestMapping("/mypage/mypage")
	public ModelAndView mypage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/main");
//		mav.setViewName("/mypage/MypageMain");
		MemberInfoVo m = new MemberInfoVo();
		//아이디 임의로 설정
		m.setUser_id("user1");
		//내 정보
		mav.addObject("myinfo", mypageservice.select_myinfo(m));
		
		//내가 작성한 글
		mav.addObject("myboard", mypageservice.search_my_board(m));
		
		//내가 작성한 sns글
		mav.addObject("mysns", mypageservice.search_my_sns(m));
		
		//내가 작성한 sns글파일
		mav.addObject("mysnspic", mypageservice.search_my_sns_file(m));
		
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
	
	//사람 정보 수정 폼
	@RequestMapping("/mypage/people_info_up_form")
	public ModelAndView people_info_up_form() {
		ModelAndView mav = new ModelAndView();
		MemberInfoVo m = new MemberInfoVo();
		m.setUser_id("user1");
		mav.setViewName("/mypage/people_info");
		mav.addObject("m", mypageservice.select_myinfo(m));
		return mav;
	}
	
	//사람 정보 수정
	@RequestMapping("/mypage/people_info_up")
	public String people_info_up(MemberInfoVo m) {
			
		mypageservice.update_myinfo(m);
		
		//수정 끝나고 리스트 컨트롤러 호출
		return "redirect:/mypage/mypage";
	}
	
	//사람 사진 수정 폼
	@RequestMapping("/mypage/people_pic_up_form")
	public ModelAndView people_pic_up_form() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/people_pic");
		return mav;
	}
	
	//동물 정보 수정 폼
	@RequestMapping("/mypage/animal_indo_up_form")
	public ModelAndView animal_info_up_form() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/animal_info");
		return mav;
	}
	
	//동물 사진 수정 폼
	@RequestMapping("/mypage/animal_pic_up_form")
	public ModelAndView animal_pic_up_form() {
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
	
	//회원탈퇴
	@RequestMapping("/mypage/delete_member")
	public String delete_member(MemberInfoVo m) {
		mypageservice.delete_myinfo(m);
		return "redirect:/MainPage";
	}
	
	//비밀번호 변경
	@RequestMapping("/mypage/update_pwd")
	@ResponseBody
	public String update_pwd(MemberInfoVo m,String o_pwd,String o_user_id) {
//		System.out.println("AAAAAAAAAAAAAAAAA");
		m.setPwd(o_pwd);
		m.setUser_id(o_user_id);
		mypageservice.update_pwd(m);
		return "ok";
	}
}
