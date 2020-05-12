package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.SnsDao;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.LikeItVo;
import com.example.demo.vo.Pic_BoardVo;
import com.example.demo.vo.Pic_Board_CommentVo;
import com.example.demo.vo.Pic_Board_FileVo;

@Service
public class SnsServiceImpl implements SnsService {

	@Autowired
	private SnsDao snsdao;
	
	@Override
	public List<Pic_Board_FileVo> listFile() {
		// TODO Auto-generated method stub
		List<Pic_Board_FileVo> list = snsdao.listFile();
		return list;
	}
	
	@Override
	public List<Pic_BoardVo> listBoard() {
		// TODO Auto-generated method stub
		List<Pic_BoardVo> list = snsdao.listBoard();
		return null;
	}

	@Override
	public int insertsns(Pic_BoardVo pb) {
		// TODO Auto-generated method stub
		int re = -1;
		re = snsdao.insertsns(pb);
		return re;
	}

	@Override
	public int insertfile(Pic_Board_FileVo pbf) {
		// TODO Auto-generated method stub
		int re = -1;
		re = snsdao.insertfile(pbf);
		return re;
	}

	@Override
	public int insertlikeit(LikeItVo l) {
		// TODO Auto-generated method stub
		int re = -1;
		re = snsdao.insertlikeit(l);
		return re;
	}

	@Override
	public int likecnt(LikeItVo l) {
		// TODO Auto-generated method stub
		int re = -1;
		re = snsdao.likecnt(l);
		return re;
	}

	@Override
	public int deletesns(Pic_Board_CommentVo pb) {
		// TODO Auto-generated method stub
		int re = -1;
		re = snsdao.deletesns(pb);
		return re;
	}

	@Override
	public Pic_BoardVo detailsns_board(Pic_BoardVo p) {
		// TODO Auto-generated method stub
		Pic_BoardVo pb = snsdao.detailsns_board(p);
		
		return pb;
	}

	@Override
	public Pic_Board_FileVo detailsns_file(Pic_Board_FileVo p) {
		// TODO Auto-generated method stub
		Pic_Board_FileVo pbf = snsdao.detailsns_file(p);
		
		return pbf;
	}

	@Override
	public Pic_BoardVo detailBoard(int photo_no) {
		// TODO Auto-generated method stub
		Pic_BoardVo pb = snsdao.detailBoard(photo_no);
		return pb;
	}

	@Override
	public Pic_Board_FileVo detailFile(Pic_Board_FileVo p) {
		// TODO Auto-generated method stub
		Pic_Board_FileVo pbf = snsdao.detailFile(p);
		return pbf;
	}

	
	//마지막 글번호
	@Override
	public int photo_no() {
		// TODO Auto-generated method stub
		int re = snsdao.photo_no();
		return re;
	}
	
	//페이징처리
	public int listCount(SearchCriteria scri) throws Exception{
		return snsdao.listCount(scri);
	}

	@Override
	public int updatePic_Board(Pic_BoardVo pb) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePic_Board(Pic_BoardVo pb) {
		// TODO Auto-generated method stub
		return 0;
	}
	



	

}
