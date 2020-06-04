package com.example.demo.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVo {
	private int r_no;
	private String review_content;
	private int r_grade;
	private Date r_insert_date;
	private Date r_update_date;
	private int r_open_status;
	private int facility_no;
	private String user_id;
}

 