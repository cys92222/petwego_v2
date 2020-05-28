package com.example.demo.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.service.FacilityService;
import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.util.PageMaker;
import com.example.demo.util.SearchCriteria;

import com.example.demo.vo.FacilityVo;
import com.example.demo.vo.ReservationVo;
import com.example.demo.vo.ReviewVo;
import com.example.demo.vo.RoomVo;

@Controller
@RequestMapping("/facility/*")
public class FacilityController{
	private static final Logger LOGGER = LoggerFactory.getLogger(FacilityController.class);
	
	
	@Autowired
	FacilityService service;
	
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
		//pageMaker.makeKeywordSearch(page);
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		model.addAttribute("pageMaker",pageMaker);
		return "facility/search";
	}	
	

	
	//숙소 상세(객실목록 및 리뷰목록)
	@RequestMapping(value="/facility/detail",method = RequestMethod.GET)
	public String get(HttpServletRequest request,@RequestParam("facility_no") int facility_no,FacilityVo facilityVo,RoomVo roomVo, ReviewVo reviewVo, Model model) throws Exception{
		LOGGER.info("getFacility");
		model.addAttribute("getFacility",service.getFacility(facilityVo.getFacility_no()));
		model.addAttribute("listRoom",service.listRoom(roomVo.getFacility_no()));
		model.addAttribute("listReview",service.listReview(reviewVo.getFacility_no()));
		return "facility/detail";
	}	
	
	
	//리뷰등록
	@PostMapping("/facility/detail/review")
	public void create(HttpServletRequest request,@RequestParam("facility_no") int facility_no,ReviewVo review) throws Exception{
		service.postReview(review);
		System.out.println("1");
	}

	
	//(+)
	//리뷰수정
	@PutMapping("/facility/detail")
	public void modify(HttpServletRequest request,ReviewVo review) throws Exception{
		service.updateReview(review);
		System.out.println("2");
	}
	//리뷰삭제
	@DeleteMapping("/facility/detail")
	public void delete(HttpServletRequest request,@RequestParam int r_no,ReviewVo reviewVo, Model model) throws Exception{
		//model.addAttribute(r_no);
		System.out.println(r_no);
		service.deleteReview(r_no);
		System.out.println("3");
	}
	


	
	
	
	
	

	
	
	
	
	
	

	
	
	
	
	


	
}
