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

import com.example.demo.service.FacilityService;
import com.example.demo.vo.ReservationVo;
@Controller
public class ReservationController {
	
	@Autowired
	FacilityService service;
	// submitForm for Reservation : 예약을 위한 submit
	
	@RequestMapping(value = "/facility/detail")
	@ResponseBody
	public String reserve(HttpServletRequest request,ReservationVo reservation,Model model) throws Exception{
		System.out.println("aaaaaasdasdasdasdddddd"+reservation);
		System.out.println();
		//model.addAttribute("rm_no",rm_no);
		//@RequestParam int rm_no,@ModelAttribute("reservation") ReservationVo reservation,BindingResult result,Model model
		service.reservePlace(reservation);		
		return "redirect:/payments/paySystem";
	}
	
}
