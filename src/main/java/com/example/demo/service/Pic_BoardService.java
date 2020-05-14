package com.example.demo.service;

import java.util.List;

import com.example.demo.util.Criteria;
import com.example.demo.vo.LikeItVo;
import com.example.demo.vo.Pic_BoardVo;
import com.example.demo.vo.Pic_Board_CommentVo;
import com.example.demo.vo.Pic_Board_FileVo;
import com.google.gson.JsonElement;
//봉현) 5/12
public interface Pic_BoardService {
	
public List<Pic_Board_FileVo> listFile(Criteria cri)throws Exception;
	
	public List<Pic_BoardVo> listPic_Board(Criteria cri) throws Exception;
	
	//페이징처리
	public int listCount() throws Exception;
	
	//게시물등록
	public int insertPic_Board(Pic_BoardVo pb);
	
	//사진파일
	public int insertfile(Pic_Board_FileVo pbf);
	
	//좋아요
	public int insertlikeit(LikeItVo l);
	
	//좋아요수
	public int likecnt(LikeItVo l);
	
	//상세보기 
	public Pic_BoardVo detailPic_Board(int photo_no);
		
	//상세보기 사진
	public Pic_Board_FileVo detailFile(Pic_Board_FileVo pbf);
	
	//마지막 글번호
	public int photo_no();
	
	//게시글 삭제
	public int deletePic_Board(Pic_BoardVo pb);

	//게시글 수정
	public int updatePic_Board(Pic_BoardVo pb);
		
	//모든 글
	//	public Pic_BoardVo detailsns_board(Pic_BoardVo pb);
	
	//모든 사진
	//public Pic_Board_FileVo detailsns_file(Pic_Board_FileVo pbf);	
}
