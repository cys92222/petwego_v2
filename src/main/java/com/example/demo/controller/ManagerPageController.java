package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.BoardService;
import com.example.demo.service.ManagerPageService;
import com.example.demo.service.NoticeService;
import com.example.demo.service.Pic_BoardService;
import com.example.demo.service.QnAService;
import com.example.demo.service.TogetherService;
import com.example.demo.util.PageMaker;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.MemberInfoVo;

@Controller
public class ManagerPageController {

	@Autowired
	private ManagerPageService mp_service;

	@Autowired
	private NoticeService notice_service;
	
	@Autowired
	private QnAService qna_service;
	
	@Autowired
	private BoardService board_service;
	
	@Autowired
	private TogetherService to_service;
	
	@Autowired
	private Pic_BoardService pic_service;

	// 관리자페이지메인
	@RequestMapping("/management/manager_main")
	public void managerPage() {

	}

	// 회원 목록, 검색, 페이징
	@GetMapping("/management/manager_member")
	public void listMember(Model model, @ModelAttribute("scri") SearchCriteria scri) {

		model.addAttribute("listMember", mp_service.listMember(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(mp_service.countMember(scri));
		model.addAttribute("pageMaker", pageMaker);
	}

	// 회원정보 상세보기
	@GetMapping("/management/manager_getMember")
	public void getMember(MemberInfoVo m, Model model) {
		model.addAttribute("detail_Info", mp_service.getMember(m));
	}

	// 회원정보 삭제(강퇴)
	@GetMapping("/management/manager_deleteMember")
	public String deleteMember(MemberInfoVo m) {
		mp_service.deleteMember(m);
		return "redirect:/management/manager_member";
	}
	
	// 공지사항 목록
	

}
