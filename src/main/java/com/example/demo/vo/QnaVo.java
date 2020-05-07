package com.example.demo.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaVo {
	
	private int inq_no;
	private int cs_no;
	private String inq_title;
	private String inq_content;
	private Date inq_date;
	private String user_id;
	private String inq_file;
}
