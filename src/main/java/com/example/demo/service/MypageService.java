package com.example.demo.service;
//영수 5월16일 mypage서비스
import java.util.List;

import com.example.demo.vo.Animal_info;
import com.example.demo.vo.BoardVo;
import com.example.demo.vo.MemberInfoVo;
import com.example.demo.vo.Pic_BoardVo;

public interface MypageService {

	//내 정보
	public MemberInfoVo select_myinfo(MemberInfoVo m);
		
	//내 정보 수정
	public int update_myinfo(MemberInfoVo m);
		
	//반려동물 등록
	public int insert_pet(Animal_info a);
	
	//회원탈퇴
	public int delete_myinfo(MemberInfoVo m);
		
	//내가 쓴 자유게시판 글
	public List<BoardVo> search_my_board(MemberInfoVo m);
		
	//내가 쓴 sns
	public List<Pic_BoardVo> search_my_sns(MemberInfoVo m);
}
