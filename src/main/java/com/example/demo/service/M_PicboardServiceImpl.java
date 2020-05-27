package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.M_PicboardDao;

@Service
public class M_PicboardServiceImpl implements M_PicboardService {
	
	@Autowired
	M_PicboardDao dao;
	
	//리스트에서 사용할 맵퍼 pic_board, pic_boardfile
	@Override
	public List<String> picBoardList() {
		// TODO Auto-generated method stub
		List<String> list = dao.picBoardList();
		return list;
	}
	
	//상세보기에서 사용할 맵퍼 ic_board, pic_boardfile, pic_board_comment 조인
	@Override
	public List<String> picBoardDetail(int photo_no) {
		// TODO Auto-generated method stub
		List<String> detail = dao.picBoardDetail(photo_no);
		return detail;
	}

}
