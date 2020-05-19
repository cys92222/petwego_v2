package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.ManagerPageService;
import com.example.demo.util.PageMaker;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.MemberInfoVo;

@Controller
@RequestMapping("/management/*")
public class ManagerPageController {

	@Autowired
	private ManagerPageService mp_service;

	public void setMp_service(ManagerPageService mp_service) {
		this.mp_service = mp_service;
	}

	// 관리자페이지메인
	@RequestMapping("/manager_main")
	public void managerPage() {

	}

	// 회원 목록, 검색, 페이징
	@GetMapping("/manager_member")
	public void listMember(Model model, @ModelAttribute("scri") SearchCriteria scri) {

		model.addAttribute("listMember", mp_service.listMember(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(mp_service.countMember(scri));
		model.addAttribute("pageMaker", pageMaker);
	}

	// 회원정보 상세보기
	@GetMapping("/manager_getMember")
	public void getMember(MemberInfoVo m, Model model) {
		model.addAttribute("detail_Info", mp_service.getMember(m));
	}

	// 회원정보 삭제(강퇴)
	@GetMapping("/manager_deleteMember")
	public String deleteMember(MemberInfoVo m) {
		mp_service.deleteMember(m);
		return "redirect:/management/manager_member";
	}

}
