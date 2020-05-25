package com.example.demo.service;

import java.util.List;

import com.example.demo.util.Criteria;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.Aop_LogVo;
import com.example.demo.vo.ChartVo;
import com.example.demo.vo.MemberInfoVo;

//민아) 5/19, 관리자페이지
public interface ManagerPageService {
	
	// 관리자메인 - 일주일 - 신규회원수, 결제된금액, 개설모임수, 게시판새글수(게시판쿼리생각중)
	int newMember();
	int newPay();
	int newTogether();
		
	// 로그 차트 
	List<ChartVo> chartLog();
	
	// 로그 기록(등록)
	int insertLog(Aop_LogVo al);

	// 로그 목록
	List<Aop_LogVo> listLog(Criteria cri);
	
	// 로그 총 개수
	int countLog(Criteria cri);

	// 회원목록
	List<MemberInfoVo> listMember(SearchCriteria scri);

	// 총 회원 수
	int countMember(SearchCriteria scri);

	// 회원정보 상세보기
	MemberInfoVo getMember(MemberInfoVo m);

	// 회원삭제(강퇴)
	int deleteMember(MemberInfoVo m);
}
