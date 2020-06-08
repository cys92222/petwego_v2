package com.example.demo.controller;


import javax.servlet.http.HttpServletRequest;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.FacilityService;
import com.example.demo.service.MypageService;

import com.example.demo.util.PageMaker;
import com.example.demo.util.SearchCriteria;

import com.example.demo.vo.FacilityVo;
import com.example.demo.vo.MemberInfoVo;

import com.example.demo.vo.ReviewVo;
import com.example.demo.vo.RoomVo;
import com.google.gson.Gson;

@Controller
@RequestMapping("/facility/*")
public class FacilityController{
	private static final Logger LOGGER = LoggerFactory.getLogger(FacilityController.class);
	
	@Autowired
	FacilityService service;
	
	@Autowired
	MypageService ms;
	
		
	//숙소 목록	
	@RequestMapping(value="/facility/list",method = RequestMethod.GET)
	public String listFacility(HttpServletRequest request,Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception{
		LOGGER.info("listFacility");		
		model.addAttribute("listFacility",service.listFacility(scri));
		model.addAttribute("keyword",scri);
		return "facility/list";
	}
		
	//검색결과
	@RequestMapping(value="/facility/search",method = RequestMethod.GET)
	public String get(HttpServletRequest request,Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception{
		LOGGER.info("search");
		model.addAttribute("listFacility",service.listFacility(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		model.addAttribute("pageMaker",pageMaker);		
		return "facility/search";
	}	
	

	
	//숙소 상세(객실목록 및 리뷰목록)
	@RequestMapping(value="/facility/detail",method = RequestMethod.GET)
	public String get(HttpServletRequest request,@RequestParam("facility_no") int facility_no,FacilityVo facilityVo,RoomVo roomVo, ReviewVo reviewVo, Model model, String user_id) throws Exception{
		LOGGER.info("getFacility");
		model.addAttribute("getFacility",service.getFacility(facilityVo.getFacility_no()));
		model.addAttribute("listRoom",service.listRoom(roomVo.getFacility_no()));
		model.addAttribute("listReview",service.listReview(reviewVo.getFacility_no()));
		//리뷰 카운트
		model.addAttribute("countReview",service.countReview(facility_no));
		
		//버튼에 rm_no붙이려고 씀
		Gson gson = new Gson();
		String arr = gson.toJson(service.listRoom(roomVo.getFacility_no()));
		model.addAttribute("arr", arr);
		
		//회원 정보
		MemberInfoVo m = new MemberInfoVo();
		m.setUser_id(user_id);
		model.addAttribute("my", ms.select_myinfo(m));
		return "facility/detail";
	}	


	
	//리뷰등록
	@RequestMapping("/detail/review")
	@ResponseBody
	public String create(HttpServletRequest request,ReviewVo review,Model model) throws Exception{
		System.out.println("리뷰등록 컨트롤러");
		System.out.println(review);
		System.out.println("user_id aaaaaaaaaaaaaaaaa"+review.getUser_id());
		MemberInfoVo m = new MemberInfoVo();
		m.setUser_id(review.getUser_id());
		model.addAttribute("my", ms.select_myinfo(m));		
		service.postReview(review);		
		return "asd";
	}
	

	


	
	
	
	
	

	
	
	
	
	
	

	
	
	
	
	


	
}