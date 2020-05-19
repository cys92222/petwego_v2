package com.example.demo.service;

import com.example.demo.vo.ApplicationVo;

//신청하기 기능
public interface ApplicationService {
	int insertApplication(ApplicationVo av);
	
	int deleteApplication(ApplicationVo av);
	
	int checkApplication(ApplicationVo av);
}
