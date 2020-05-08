package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.SnsDao;
import com.example.demo.vo.LikeItVo;
import com.example.demo.vo.Pic_BoardVo;
import com.example.demo.vo.Pic_Board_CommentVo;
import com.example.demo.vo.Pic_Board_FileVo;

@Service
public class SnsServiceImpl implements SnsService {

	@Autowired
	private SnsDao snsdao;
	
	@Override
	public List<Pic_Board_FileVo> listAll() {
		// TODO Auto-generated method stub
		List<Pic_Board_FileVo> list = snsdao.listAll();
		return list;
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

}
