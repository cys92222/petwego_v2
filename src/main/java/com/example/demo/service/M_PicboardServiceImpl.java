package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.M_PicboardDao;
import com.example.demo.vo.Pic_BoardVo;
import com.example.demo.vo.Pic_Board_FileVo;

@Service
public class M_PicboardServiceImpl implements M_PicboardService {
	
	@Autowired
	M_PicboardDao dao;
//	픽보드 리스트 
	@Override
	public List<Pic_BoardVo> picboaard_list() {
		// TODO Auto-generated method stub
		List<Pic_BoardVo> list = dao.picboaard_list();
		return list;
	}
	
//	픽보드파일 리스트
	@Override
	public List<Pic_Board_FileVo> picboardfile_list() {
		// TODO Auto-generated method stub
		List<Pic_Board_FileVo> list = dao.picboardfile_list();
		return list;
	}
	

}
