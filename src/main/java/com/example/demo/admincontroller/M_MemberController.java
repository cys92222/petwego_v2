package com.example.demo.admincontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.ManagerPageService;
import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.vo.MemberInfoVo;

//민아) 5/31, admincontroller 는 굳이  nologging 처리 안해도 되서 지움 
@Controller
@RequestMapping("/management/*")
public class M_MemberController {

	@Autowired
	private ManagerPageService mp_service;

	// 회원 결제정보
	@GetMapping("/member/listPay")
	public void listPay(Model model) {
		model.addAttribute("listPay", mp_service.listPay());
	}

	// 회원 목록
	@GetMapping("/member/member_list")
	public void listMember(Model model, MemberInfoVo mv) {

		model.addAttribute("listMember", mp_service.listMember());
	}

	// 회원정보 상세보기
	@GetMapping("/member/member_get")
	public void getMember(MemberInfoVo m, Model model) {
		model.addAttribute("detail_Info", mp_service.getMember(m));
	}

	// 회원 영구정지(휴면계정)
	@GetMapping("/member/update_enabled")
	public String update_enabled(MemberInfoVo m) {

		mp_service.update_enabled(m);
		return "redirect:/management/member/member_list";
	}

	// 휴면계정으로 전환한 회원을 다시 회원으로 전환!
	@GetMapping("/member/rollback_enabled")
	public String rollback_enabled(MemberInfoVo m) {
		
		mp_service.rollback_enabled(m);
		
		return "redirect:/management/member/member_list";
	}

}
