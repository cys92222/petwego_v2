package com.example.demo.dao;
//영수 5월16일 MypageDao

import java.util.List;

import com.example.demo.vo.Animal_info;
import com.example.demo.vo.BoardVo;
import com.example.demo.vo.MemberInfoVo;
import com.example.demo.vo.Pic_BoardVo;
import com.example.demo.vo.Pic_Board_FileVo;
import com.example.demo.vo.TogetherVo;

public interface MypageDao {
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
	
	//내가 쓴 함께가요 글
	public List<TogetherVo> search_my_together(MemberInfoVo m);
	
	//내가 쓴 sns글 파일
	public List<Pic_Board_FileVo> search_my_sns_file(MemberInfoVo m);
}
