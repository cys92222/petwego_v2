package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.QnADao;
import com.example.demo.vo.Criteria;
import com.example.demo.vo.QnAVo;

@Service
public class QnAServiceImpl implements QnAService {
	
	@Autowired
	private QnADao dao;
	
	//모든 qna리스트
	@Override
	public List<QnAVo> allQnAList(Criteria cri) {
		// TODO Auto-generated method stub
		List<QnAVo> list = dao.allQnAList(cri);
		return list;
	}
	
	//qna등록
	@Override
	public int insertQnA(QnAVo q) {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.insertQnA(q);
		return re;
	}
	
	//qna상세보기
	@Override
	public QnAVo detailQnA(QnAVo q) {
		// TODO Auto-generated method stub
		QnAVo d = dao.detailQnA(q);
		return d;
	}
	
	//qna삭제
	@Override
	public int deleteQnA(QnAVo q) {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.deleteQnA(q);
		return re;
	}
	
	//답변등록
	@Override
	public int insertRe(QnAVo q) {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.insertRe(q);
		return re;
	}
	
	//마지막 글번호
	@Override
	public Integer lastNo() {
		// TODO Auto-generated method stub
		int re = -1;
		if(dao.lastNo() != null) {
			re = dao.lastNo();
		}
		return re;
	}
	
	//qna 전체글 수
	@Override
	public int listCount() {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.listCount();
		return re;
	}
	
}
