package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.MemberInfoVo;
import com.example.demo.vo.MemberInfoVo2;

@Mapper
public interface LoginMapperDao {
	
	//회원정보 조회
	MemberInfoVo getSelectMemberInfo(String user_id);
	//회원가입
	public int setInsertMemberInfo(MemberInfoVo memberInfo);
	//아이디 중복 확인
	public int idCheck(String user_id);
	//닉네임 중복 확인
	public int nickCheck(String nick_name);
	//비밀번호 확인
	public int passCheck(MemberInfoVo memberInfo);

}

