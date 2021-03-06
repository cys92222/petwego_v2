package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.MypageDao;
import com.example.demo.service.FacilityService;
import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.vo.FacilityVo;
import com.example.demo.vo.MemberInfoVo;
import com.example.demo.vo.ReservationVo;
import com.example.demo.vo.RoomVo;
import com.google.gson.Gson;
@Controller
public class ReservationController {
	
	@Autowired
	FacilityService service;
	// submitForm for Reservation : 예약을 위한 submit
	
	@Autowired
	MypageDao my;
	
	@RequestMapping(value = "/facility/reserve")
	@ResponseBody
	public String reserve(HttpServletRequest request,ReservationVo r,Model model) throws Exception{
//		System.out.println("aaaaaasdasdasdasdddddd"+r);
//		System.out.println();
		//model.addAttribute("rm_no",rm_no);
		//@RequestParam int rm_no,@ModelAttribute("reservation") ReservationVo reservation,BindingResult result,Model model
		service.reservePlace(r);
		System.out.println("예약자 아이디" + r.getUser_id());

		MemberInfoVo m = new MemberInfoVo();
		m.setUser_id(r.getUser_id());
		
		MemberInfoVo mi = my.select_myinfo(m);
//		System.out.println("예약자 정보" + mi);
//		model.addAttribute("result", mi);
		
//		Gson gson = new Gson();
//		String str = gson.toJson(mi);
		
		String str = mi.getUser_id();
		
//		return "/payments/paySystem?user_id="+mi.getUser_id()+"&tel="+mi.getTel()+"&name="+mi.getName()+"&email="+mi.getEmail()+"&address="+mi.getAddress();
		return str;
	}
	
	@RequestMapping(value = "/facility/reservationpay")
	public String pay(HttpServletRequest request,ReservationVo r,Model model) throws Exception{
//		System.out.println("aaaaaasdasdasdasdddddd"+r);
//		System.out.println();
		//model.addAttribute("rm_no",rm_no);
		//@RequestParam int rm_no,@ModelAttribute("reservation") ReservationVo reservation,BindingResult result,Model model
		System.out.println("예약자 아이디" + r.getUser_id());

		MemberInfoVo m = new MemberInfoVo();
		m.setUser_id(r.getUser_id());
		
		MemberInfoVo mi = my.select_myinfo(m);
//		System.out.println("예약자 정보" + mi);
//		model.addAttribute("result", mi);
		
//		Gson gson = new Gson();
//		String str = gson.toJson(mi);
		
		String str = mi.getUser_id();
		
//		return "/payments/paySystem?user_id="+mi.getUser_id()+"&tel="+mi.getTel()+"&name="+mi.getName()+"&email="+mi.getEmail()+"&address="+mi.getAddress();
		return "redirect:/facility/pay?str="+str;
	}
	
	//결제창으로 정보 넘기기위한
	@NoLogging
	@RequestMapping("/facility/pay")
	public ModelAndView rr(String str) {
		MemberInfoVo m = new MemberInfoVo();
		//user_id
		m.setUser_id(str);
		
		ModelAndView mav = new ModelAndView();
//		회원정보
		
		mav.addObject("my", my.select_myinfo(m));
//		결제안한 예약조회
//		mav.addObject("to", service.select_reserve(str));
		
//		아이디로 rm_no조회
		ReservationVo rm_no = service.select_rm_no(str);
		mav.addObject("rm_no", rm_no);
		
//		rm_no로 방이름 조회
		RoomVo room = service.select_room_name(rm_no.getRm_no());
		mav.addObject("room", room);
		
//  	rm_no로 호텔 번호 조회
		int facility_no = service.select_facility_no(rm_no.getRm_no());
		mav.addObject("facility_no", facility_no);
		
//		facility_no로 호텔 조회
		FacilityVo Facility = service.select_facility(facility_no);
		mav.addObject("Facility", Facility);
		
		
		mav.setViewName("payments/paySystem");
		
		return mav;
		
	}
	
}
