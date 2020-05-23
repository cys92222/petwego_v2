package com.example.demo.dao;

import com.example.demo.vo.PaymentVo;

// 민아) 5/22, 결제 서비스 
public interface PaymentDao {
	
	// 결제정보 등록 
	int insertPay(PaymentVo p);
}
