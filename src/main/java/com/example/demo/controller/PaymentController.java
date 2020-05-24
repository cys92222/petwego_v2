package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.PaymentService;
import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.vo.Board_fileVo;
import com.example.demo.vo.PaymentVo;

// 민아) 5/22, 결제 구현완료
// 민아) 5/23, 결제 성공이나 오류시 이동할 페이지 만들어야함 
@Controller
@RequestMapping("/payments/*")
public class PaymentController {

	@Autowired
	PaymentService pay_service;

	public void setPay_service(PaymentService pay_service) {
		this.pay_service = pay_service;
	}

	// 결제 창
	@NoLogging
	@GetMapping(value = "/paySystem")
	public void paySystem() {

	}

	// 결제정보 등록
	@PostMapping(value = "/insertPay", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String insertSubmit(HttpServletRequest request, @RequestBody List<PaymentVo> listPay) {
		
		
		for (PaymentVo pv : listPay) {
			
			// 결제 수단과 결제상태 한글로 저장되도록!  
			if (pv.getPay_method().equals("card")) {
				pv.setPay_method("카드 결제");
			}
			// 어차피 결제 성공해야만 테이블에 저장되니까 결제완료로 하나만 치환하면 될듯 
			if(pv.getStatus().equals("paid")) {
				pv.setStatus("결제 완료");
			}
			
			pay_service.insertPay(pv);
		}

		System.out.println("결제컨트롤러 동작함");

		return "등록ok";
	}

	@NoLogging
	@GetMapping(value = "/okayPay")
	public String okay() {
		return "결제가 성공하였습니다.";
	}

}
