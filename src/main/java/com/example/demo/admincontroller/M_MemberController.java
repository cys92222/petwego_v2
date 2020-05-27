package com.example.demo.admincontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.ManagerPageService;
import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.vo.MemberInfoVo;

@Controller
@RequestMapping("/management/*")
public class M_MemberController {

	@Autowired
	private ManagerPageService mp_service;

	// 회원 결제정보
	@NoLogging
	@GetMapping("/member/listPay")
	public void listPay(Model model) {
		model.addAttribute("listPay",mp_service.listPay());
	}
	
	 
	// 회원 목록
	@NoLogging
	@GetMapping("/member/member_list")
	public void listMember(Model model) {

		model.addAttribute("listMember", mp_service.listMember());
	}

	// 회원정보 상세보기
	@NoLogging
	@GetMapping("/member/member_get")
	public void getMember(MemberInfoVo m, Model model) {
		model.addAttribute("detail_Info", mp_service.getMember(m));
	}

	// 회원정보 삭제(강퇴)
	@NoLogging
	@GetMapping("/member/member_delete")
	public String deleteMember(MemberInfoVo m) {

		mp_service.deleteMember(m);
		return "redirect:/management/member/member_list";
	}

}
