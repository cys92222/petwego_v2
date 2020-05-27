package com.example.demo.dao;

import java.util.List;

public interface M_PicboardDao {
	
	//리스트에서 사용할 맵퍼 pic_board, pic_boardfile
	List<String> picBoardList();
	
	//상세보기에서 사용할 맵퍼 ic_board, pic_boardfile, pic_board_comment 조인
	List<String> picBoardDetail(int photo_no);
}
