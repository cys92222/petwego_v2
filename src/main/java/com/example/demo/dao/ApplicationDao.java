package com.example.demo.dao;

import com.example.demo.vo.ApplicationVo;

//신청하기 기능
public interface ApplicationDao {
	
	public int insertApplication(ApplicationVo av);
	
	public int deleteApplication(ApplicationVo av);
	
	public int checkApplication(ApplicationVo av);
}
