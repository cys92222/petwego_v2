package com.example.demo.admincontroller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;


import com.example.demo.service.ManagerPageService;

import com.example.demo.vo.ReviewVo;


@Controller
@RequestMapping("/management/*")
public class M_FacilityController {

	@Autowired
	private ManagerPageService mp_service;
	
	// 숙소 리뷰 삭제 
	@GetMapping(value = "/froom/deleteReview")
	public String deleteReview(ReviewVo re, int r_no) {
		mp_service.deleteReview(re);
		return "redirect:/management/froom/review?r_no=" + r_no;
	}
	
	// 숙소 리뷰 목록 
	@GetMapping("/froom/review")
	public void f_review(Model model) {
		model.addAttribute("reviewList", mp_service.f_review());
	}
	
	// 방 정보
	@GetMapping("/froom/infoRoom")
	public void infoRoom(Model model, int facility_no) {
		model.addAttribute("infoRoom", mp_service.infoRoom(facility_no));
	}
	
	// 숙소 목록
	@GetMapping("/froom/listFacility")
	public void listNotice(Model model) {
		model.addAttribute("listFacility", mp_service.listFacility());
	}
}
