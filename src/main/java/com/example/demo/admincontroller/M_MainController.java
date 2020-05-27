package com.example.demo.admincontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.ManagerPageService;
import com.example.demo.util.AopLog.NoLogging;

//민아) 5/19, HttpServletRequest request 이랑 @NoLogging 처리 
//민아) 5/19, 관리자페이지 하는중 
//log 기록이 필요없는 관리자 페이지 등은 매개변수로 HttpServletRequest request 을 가질필요가 없고
//제외 처리를 위해 @NoLogging을 꼭 적어야 함! 
@Controller
@RequestMapping("/management/*")
public class M_MainController {

	@Autowired
	private ManagerPageService mp_service;

	// 관리자페이지메인
	@RequestMapping("manager_main")
	@NoLogging
	public void managerPage(Model model) {
		// sns+자유게시판 새글 수 , 새 회원 수 , 총 결제금액, 모임개설수 (일주일)
		model.addAttribute("totBoard", mp_service.newBoard() + mp_service.newPic());
		model.addAttribute("newM", mp_service.newMember());
		model.addAttribute("newP", mp_service.newPay());
		model.addAttribute("newT", mp_service.newTogether());
	} 
}
