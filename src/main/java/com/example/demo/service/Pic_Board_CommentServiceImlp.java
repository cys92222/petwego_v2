package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.BoardDao;
import com.example.demo.dao.Board_CommentDao;
import com.example.demo.dao.Pic_Board_CommentDao;
import com.example.demo.dao.Pic_BoardDao;
import com.example.demo.vo.Board_CommentVo;
import com.example.demo.vo.Pic_Board_CommentVo;


@Service
public class Pic_Board_CommentServiceImlp implements Pic_Board_CommentService {
	
	@Autowired
	private Pic_Board_CommentDao pbcDao;
	
	@Autowired
	private Pic_BoardDao snsDao;

	//댓글목록
	@Override
	public List<Pic_Board_CommentVo> listComment(int photo_no) {
		return pbcDao.listPhotoComment(photo_no);
	}
	//댓글등록
	@Override
	public int insertComment(Pic_Board_CommentVo pbc) {
		return pbcDao.insertComment(pbc);
	}
	//댓글삭제
	@Override
	public int deleteComment(Pic_Board_CommentVo pbc) {
		return pbcDao.deleteComment(pbc);
	}
	
	
	@Override
	public int deleteCommBoard(Pic_Board_CommentVo pbc) {
		return pbcDao.deleteCommBoard(pbc);
	}
	
	//선택한 댓글보기
	@Override
	public Pic_Board_CommentVo selectComment(int photo_no) {
		return pbcDao.selectComment(photo_no);
	}
	
}
