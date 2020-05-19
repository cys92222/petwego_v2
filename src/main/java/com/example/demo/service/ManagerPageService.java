package com.example.demo.service;

import java.util.List;

import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.MemberInfoVo;

//민아) 5/19, 관리자페이지
public interface ManagerPageService {
	// 회원목록
	List<MemberInfoVo> listMember(SearchCriteria scri);

	// 총 회원 수
	int countMember(SearchCriteria scri);

	// 회원정보 상세보기
	MemberInfoVo getMember(MemberInfoVo m);

	// 회원삭제(강퇴)
	int deleteMember(MemberInfoVo m);
}
