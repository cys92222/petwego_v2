package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 민아) 6/3, 관리자페이지에서 시설 - 방 정보를 보기위해 만든 vo

@AllArgsConstructor
@NoArgsConstructor
@Data
public class M_froomVo {
	
	private int facility_no;
	private String facility_name;
	private String facility_addr;
	private String f_phone;
	private int f_minprice;
	private String f_feature;
	private String f_intro;
	private String f_pic;
	private String f_checkin;
	private String f_checkout;
	
	private int rm_no;
	private String rm_name;
	private String rm_max;
	private String rm_pic;
	private int rm_ok;
	private int rm_sn;
	private String rm_cost;
	private String rm_info;
}
