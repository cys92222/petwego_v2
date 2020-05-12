package com.example.demo.service;

import java.util.List;

import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.LikeItVo;
import com.example.demo.vo.Pic_BoardVo;
import com.example.demo.vo.Pic_Board_CommentVo;
import com.example.demo.vo.Pic_Board_FileVo;

public interface SnsService {
	List<Pic_Board_FileVo> listFile();
	
	List<Pic_BoardVo> listBoard();
	
	int insertsns(Pic_BoardVo pb);
	
	int insertfile(Pic_Board_FileVo pbf);
	
	int insertlikeit(LikeItVo l);
	
	int likecnt(LikeItVo l);
	
	int deletesns(Pic_Board_CommentVo pb);
	
	//모든 글
	Pic_BoardVo detailsns_board(Pic_BoardVo pb);
	
	//모든 사진
	Pic_Board_FileVo detailsns_file(Pic_Board_FileVo pbf);
	
	//상세보기 글
	Pic_BoardVo detailBoard(int photo_no);
		
	//상세보기 사진
	Pic_Board_FileVo detailFile(Pic_Board_FileVo pbf);
	
	//마지막 글번호
	int photo_no();
	
	//게시글 수정
	int updatePic_Board(Pic_BoardVo pb);
	
	//게시글 삭제
	int deletePic_Board(Pic_BoardVo pb);
	//페이징처리
	int listCount(SearchCriteria scri) throws Exception;
}
