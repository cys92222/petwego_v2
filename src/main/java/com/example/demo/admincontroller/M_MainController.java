package com.example.demo.admincontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.ManagerPageService;
import com.example.demo.util.AopLog.NoLogging;

//민아) 5/19, HttpServletRequest request 이랑 @NoLogging 처리 
//민아) 5/19, 관리자페이지 하는중 
//민아) 5/31, admincontroller 는 굳이  nologging 처리 안해도 되서 지움 
@Controller
@RequestMapping("/management/*")
public class M_MainController {

	@Autowired
	private ManagerPageService mp_service;

	// 관리자페이지메인
	@RequestMapping("manager_main")
	public void managerPage(Model model) {
		// sns+자유게시판 새글 수 , 새 회원 수 , 총 결제금액, 모임개설수 (일주일)
		model.addAttribute("newPic",mp_service.newPic());
		model.addAttribute("newBoard", mp_service.newBoard());
		model.addAttribute("newM", mp_service.newMember());
		model.addAttribute("newP", mp_service.newPay());
		model.addAttribute("newT", mp_service.newTogether());
		model.addAttribute("newQnA", mp_service.newQnA());
		model.addAttribute("allfacility", mp_service.allfacility());
		model.addAttribute("newReservation", mp_service.newReservation());
	} 
}
