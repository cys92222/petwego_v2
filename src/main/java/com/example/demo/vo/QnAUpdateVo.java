package com.example.demo.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnAUpdateVo {
	private int up_inq_no;
	private int up_cs_no;
	private String up_inq_title;
	private String up_inq_content;
	private Date up_inq_date;
	private String up_user_id;
	private String up_inq_file;
	private int up_ref;				//부모글 그룹
	private int up_ref_step;			//부모글 그룹안에서 정렬 순서,답변의 답변
	private int up_ref_level;			//들여쓰기
}