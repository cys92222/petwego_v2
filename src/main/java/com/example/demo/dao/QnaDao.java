package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.vo.QnaVo;
//mapper.xml과 연동됨
public interface QnaDao {
	
	List<QnaVo> listQna();
	
	int insertQna(QnaVo q);
	
	int deleteQna(QnaVo q);
	
	QnaVo detailQna(QnaVo q);
	
	int getQnAListCount(QnaVo q);
	
	List<QnaVo> getQnAList(QnaVo q);
	
	int totalrecord();
}
