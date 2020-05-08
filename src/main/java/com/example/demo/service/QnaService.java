package com.example.demo.service;

import java.util.List;

import com.example.demo.vo.QnaVo;

public interface QnaService {
	
	List<QnaVo> listQna();
	
	int insertQna(QnaVo q);
	
	int deleteQna(QnaVo q);
	
	QnaVo detailQna(QnaVo q);
	
	int getQnAListCount(QnaVo q);
	
	List<QnaVo> getQnAList(QnaVo q);
	
	int totalrecord();
}
