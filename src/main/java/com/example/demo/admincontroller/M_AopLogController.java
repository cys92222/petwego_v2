package com.example.demo.admincontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ManagerPageService;
import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.vo.ChartVo;
import com.google.gson.Gson;

// 민아) 5/31, admincontroller 는 굳이  nologging 처리 안해도 되서 지움 
@Controller
@RequestMapping("/management/*")
public class M_AopLogController {

	@Autowired
	private ManagerPageService mp_service;

	// 로그 차트 (구글차트 이용해서)	
	@ResponseBody
	@GetMapping(value = "chartLog", produces = "application/json; charset=utf-8")
	public String chartLog() {
		List<ChartVo> chartLog = mp_service.chartLog();
		Gson gson = new Gson();
		// System.out.println("로그차트 동작");
		// System.out.println(chartLog);
		return gson.toJson(chartLog);
	}

	// aopLog 목록
	@GetMapping("listLog")
	public void listLog(Model model) {
		model.addAttribute("listLog", mp_service.listLog());
	} 
}
