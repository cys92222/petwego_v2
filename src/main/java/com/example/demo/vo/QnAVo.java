package com.example.demo.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnAVo {
	
	private int inq_no;
	private int cs_no;
	private String inq_title;
	private String inq_content;
	private Date inq_date;
	private String user_id;
	private String inq_file;
	private int ref;				//부모글 그룹
	private int ref_step;			//부모글 그룹안에서 정렬 순서
	private int ref_level;			//답변의 답변일 경우 순서
}


//INQ_NO                                    NOT NULL NUMBER
//CS_NO                                              NUMBER
//INQ_TITLE                                          VARCHAR2(225)
//INQ_CONTENT                                        CLOB
//INQ_DATE                                           DATE
//USER_ID                                            VARCHAR2(225)
//INQ_FILE                                           VARCHAR2(500)
//REF                                                NUMBER
//REF_STEP                                           NUMBER
//REF_LEVEL                                          NUMBER