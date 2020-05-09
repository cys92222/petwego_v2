package com.example.demo.service;

import java.util.List;

import com.example.demo.vo.QnAVo;

public interface QnAService {

	//모든 qna리스트
	public List<QnAVo> allQnAList();
		
	//qna등록
	public int insertQnA(QnAVo q);
		
	//qna상세보기
	public QnAVo detailQnA(QnAVo q);
		
	//qna삭제
	public int deleteQnA(QnAVo q);
	//qna수정
		
	//답변등록
}
