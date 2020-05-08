package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.QnaDao;
import com.example.demo.vo.QnaVo;
//service 구현체
//service 어노테이션
@Service
public class QnaServiceImpl implements QnaService {
	
	//dao와 의존관계 자동설정
	@Autowired
	private QnaDao qnaDao;
	
	@Override
	public List<QnaVo> listQna() {
		// TODO Auto-generated method stub
		List<QnaVo> list = qnaDao.listQna();
		return list;
	}

	@Override
	public int insertQna(QnaVo q) {
		// TODO Auto-generated method stub
		int re = -1;
		re = qnaDao.insertQna(q);
		return re;
	}

	@Override
	public int deleteQna(QnaVo q) {
		// TODO Auto-generated method stub
		int re = -1;
		re = qnaDao.deleteQna(q);
		return re;
	}

	@Override
	public QnaVo detailQna(QnaVo q) {
		// TODO Auto-generated method stub
		QnaVo detail = qnaDao.detailQna(q);
		return detail;
	}

	@Override
	public int getQnAListCount(QnaVo q) {
		// TODO Auto-generated method stub
		int re = -1;
		re = qnaDao.getQnAListCount(q);
	
		return re;
	}

	@Override
	public List<QnaVo> getQnAList(QnaVo q) {
		// TODO Auto-generated method stub
		List<QnaVo> list = qnaDao.getQnAList(q);
		
		return list;
	}

	@Override
	public int totalrecord() {
		// TODO Auto-generated method stub
		int re = -1;
		re = qnaDao.totalrecord();
		
		return re;
	}
	
	
	

}
