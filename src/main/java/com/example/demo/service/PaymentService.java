package com.example.demo.service;

import com.example.demo.vo.PaymentVo;

//민아) 5/22, 결제 서비스 
public interface PaymentService {

	// 결제정보 등록
	int insertPay(PaymentVo p);
}
