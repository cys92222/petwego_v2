package com.example.demo.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
//영수 5월16일 MemberinfoVo
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberInfoVo {
	private String user_id;
	private String pwd;
	private String tel;
	private Date birth;
	private String name;
	private String address;
	private String gender;
	private String fname;
	private String intro;
	private Date info_createdate;
	private Date info_updatedate;
	private String nick_name;
	private int role;
	
	MultipartFile uploadfile;
}
