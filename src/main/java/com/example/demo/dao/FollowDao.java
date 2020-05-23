package com.example.demo.dao;

import java.util.List;

import com.example.demo.vo.FollowVo;

public interface FollowDao {
	//나를 팔로잉한 회원 조회
	List<FollowVo> search_follow(FollowVo f);
		
	//나를 팔로잉한 회원 수
	int search_follow_count(FollowVo f);
			
	//내가 팔로잉한 회원 조회
	List<FollowVo> search_following(FollowVo f);
		
	//팔로우하기
	int insert_follow(FollowVo f);
	
	//맞팔로우하기
	int insert_follow2(FollowVo f);

	//언팔로우
	int delete_follow(FollowVo f);
	
	//팔로잉 확인
	int follow_chk(FollowVo f);
}
