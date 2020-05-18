package com.example.demo.service;
//영수 5월16일 mypage서비스임플리먼츠
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MypageDao;
import com.example.demo.vo.Animal_info;

import com.example.demo.vo.BoardVo;
import com.example.demo.vo.MemberInfoVo;
import com.example.demo.vo.Pic_BoardVo;
import com.example.demo.vo.Pic_Board_FileVo;
import com.example.demo.vo.TogetherVo;
@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageDao mypagedao;
	
	//내 정보
	@Override
	public MemberInfoVo select_myinfo(MemberInfoVo m) {
		// TODO Auto-generated method stub
		MemberInfoVo my = mypagedao.select_myinfo(m);
		return my;
	}

	//내 정보 수정
	@Override
	public int update_myinfo(MemberInfoVo m) {
		// TODO Auto-generated method stub
		int re = -1;
		re = mypagedao.update_myinfo(m);
		return re;
	}
	
	//반려동물 등록
	@Override
	public int insert_pet(Animal_info a) {
		// TODO Auto-generated method stub
		int re = -1;
		re = mypagedao.insert_pet(a);
		return re;
	}

	//회원탈퇴
	@Override
	public int delete_myinfo(MemberInfoVo m) {
		// TODO Auto-generated method stub
		int re = -1;
		re = mypagedao.delete_myinfo(m);
		return re;
	}

	//내가 쓴 자유게시판 글
	@Override
	public List<BoardVo> search_my_board(MemberInfoVo m) {
		// TODO Auto-generated method stub
		List<BoardVo> list = mypagedao.search_my_board(m);
		return list;
	}

	//내가 쓴 sns글
	@Override
	public List<Pic_BoardVo> search_my_sns(MemberInfoVo m) {
		// TODO Auto-generated method stub
		List<Pic_BoardVo> list = mypagedao.search_my_sns(m);
		return list;
	}
	
	//내가 쓴 함께가요 글
	@Override
	public List<TogetherVo> search_my_together(MemberInfoVo m) {
		// TODO Auto-generated method stub
		List<TogetherVo> list = mypagedao.search_my_together(m);
		return list;
	}
	
	//내가 쓴 sns 파일
	@Override
	public List<Pic_Board_FileVo> search_my_sns_file(MemberInfoVo m) {
		// TODO Auto-generated method stub
		List<Pic_Board_FileVo> list = mypagedao.search_my_sns_file(m);
		return list;
	}
	
	//비밀번호 변경
	@Override
	public int update_pwd(MemberInfoVo m) {
		// TODO Auto-generated method stub
		int re =-1;
		re = mypagedao.update_pwd(m);
		return re;
	}

}
