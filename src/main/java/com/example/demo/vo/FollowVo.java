package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FollowVo {
	private int f_no;			//팔로우 번호
	private String f_type;		//팔로잉
	private String user_id;		//팔로잉 당할 아이디
	private String user_id2;	//팔로워
}


//F_NO                                      NOT NULL NUMBER
//F_TYPE                                             VARCHAR2(225)
//USER_ID                                            VARCHAR2(225)
//USER_ID2                                           VARCHAR2(225)