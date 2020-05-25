package com.example.demo.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ManagerPageService;

import com.example.demo.util.Criteria;
import com.example.demo.util.PageMaker;
import com.example.demo.util.SearchCriteria;
import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.vo.BoardVo;
import com.example.demo.vo.ChartVo;
import com.example.demo.vo.MemberInfoVo;
import com.example.demo.vo.NoticeVo;
import com.google.gson.Gson;
// 민아) 5/19, HttpServletRequest request 이랑 @NoLogging 처리 
// 민아) 5/19, 관리자페이지 하는중 
// log 기록이 필요없는 관리자 페이지 등은 매개변수로 HttpServletRequest request 을 가질필요가 없고
// 제외 처리를 위해 @NoLogging을 꼭 적어야 함! 
@Controller
@RequestMapping("/management/*")
public class ManagerPageController  {

	@Autowired
	private ManagerPageService mp_service;
	
	// 공지사항 목록
	@GetMapping("listNotice")
	@NoLogging
	public void listNotice(Model model) {
		model.addAttribute("listNotice", mp_service.listNotice());		
	}
	
	// 공지사항 등록
	@NoLogging
	@PostMapping(value = "/insertNotice")
	@ResponseBody
	public void insertNotice(NoticeVo nv,Model model) {
		mp_service.insertNotice(nv);
	}
	
	// 공지사항 상세
	
	// 공지사항 수정
	
	// 공지사항 삭제

	// 관리자페이지메인
	@RequestMapping("manager_main")
	@NoLogging
	public void managerPage(Model model) {
		model.addAttribute("newM", mp_service.newMember());
		model.addAttribute("newP", mp_service.newPay());
		model.addAttribute("newT", mp_service.newTogether());
	}
	
	// 로그 차트 (구글차트 이용해서)
	@NoLogging
	@ResponseBody
	@GetMapping(value = "chartLog", produces = "application/json; charset=utf-8")
	public String chartLog() {
		List<ChartVo> chartLog = mp_service.chartLog();
		Gson gson = new Gson();
		//System.out.println("로그차트 동작");
		//System.out.println(chartLog);
		return gson.toJson(chartLog);
	}
	
	// 회원 목록, 검색, 페이징
	@NoLogging
	@GetMapping("member_list")
	public void listMember(Model model, @ModelAttribute("scri") SearchCriteria scri) {

		model.addAttribute("listMember", mp_service.listMember(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(mp_service.countMember(scri));
		model.addAttribute("pageMaker", pageMaker);
	}

	// 회원정보 상세보기
	@NoLogging
	@GetMapping("member_get")
	public void getMember(MemberInfoVo m, Model model) {
		model.addAttribute("detail_Info", mp_service.getMember(m));
	}

	// 회원정보 삭제(강퇴)
	@NoLogging
	@GetMapping("member_delete")
	public String deleteMember(MemberInfoVo m) {
		
		mp_service.deleteMember(m);
		return "redirect:/management/member_list";
	}
	
	// aopLog 목록
	@NoLogging
	@GetMapping("listLog")
	public void listLog( Model model, Criteria cri) {
		model.addAttribute("listLog", mp_service.listLog(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(mp_service.countLog(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
	

}
