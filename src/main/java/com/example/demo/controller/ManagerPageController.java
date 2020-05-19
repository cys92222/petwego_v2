package com.example.demo.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


import com.example.demo.service.ManagerPageService;

import com.example.demo.util.Criteria;
import com.example.demo.util.PageMaker;
import com.example.demo.util.SearchCriteria;

import com.example.demo.vo.MemberInfoVo;

@Controller
public class ManagerPageController {

	@Autowired
	private ManagerPageService mp_service;

	// 관리자페이지메인
	@RequestMapping("/management/manager_main")
	public void managerPage(HttpServletRequest request) {

	}

	// 회원 목록, 검색, 페이징
	@GetMapping("/management/manager_member")
	public void listMember(HttpServletRequest request,Model model, @ModelAttribute("scri") SearchCriteria scri) {

		model.addAttribute("listMember", mp_service.listMember(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(mp_service.countMember(scri));
		model.addAttribute("pageMaker", pageMaker);
	}

	// 회원정보 상세보기
	@GetMapping("/management/manager_getMember")
	public void getMember(HttpServletRequest request,MemberInfoVo m, Model model) {
		model.addAttribute("detail_Info", mp_service.getMember(m));
	}

	// 회원정보 삭제(강퇴)
	@GetMapping("/management/manager_deleteMember")
	public String deleteMember(HttpServletRequest request,MemberInfoVo m) {
		mp_service.deleteMember(m);
		return "redirect:/management/manager_member";
	}
	
	// aopLog 목록
	@GetMapping("/management/listLog")
	public void listLog(HttpServletRequest request, Model model, Criteria cri) {
		model.addAttribute("listLog", mp_service.listLog(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(mp_service.countLog(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
	

}
