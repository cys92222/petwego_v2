package com.example.demo.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReservationVo {
	private int rsv_no;
	private String user_id;
	private int rsv_price;
	private String rsv_date;
	private String check_in;
	private String check_out;
	private int human_num;
	private int pet_num;
	private int rm_no;
	
	private String rsv_paid;	//예약 상태 : 결제대기/결제완료
	private String guest_name;	//투숙객 이름
	private String guest_tel;	//투숙객 전화번호
}

