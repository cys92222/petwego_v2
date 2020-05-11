package com.example.demo.dao;

import java.util.List;

import com.example.demo.vo.Criteria;
import com.example.demo.vo.QnAVo;

public interface QnADao {
	
	//모든 qna리스트
	public List<QnAVo> allQnAList(Criteria cri);
	
	//qna등록
	public int insertQnA(QnAVo q);
	
	//qna상세보기
	public QnAVo detailQnA(QnAVo q);
	
	//qna삭제
	public int deleteQnA(QnAVo q);
	//qna수정
	
	//답변등록
	public int insertRe(QnAVo q);
	
	//마지막 글번호
	public Integer lastNo();
	
	//qna 전체글 수
	public int listCount();
}
