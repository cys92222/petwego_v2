package com.example.demo.admincontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ManagerPageService;
import com.example.demo.vo.PaymentVo;
import com.example.demo.vo.RoomVo;

@Controller
@RequestMapping("/management/*")
public class M_FacilityController {

	@Autowired
	private ManagerPageService mp_service;
	
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
