package com.example.demo.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
//봉현) 5/12
public class Pic_BoardVo {
	private int photo_no;
	private Date photo_date;
	private String photo_detail;
	private String user_id;
	
	
	public String getphoto_date()
	{
		return "2020-01-01";
	}
	
}
