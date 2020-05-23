package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.FollowDao;
import com.example.demo.vo.FollowVo;
@Service
public class FollowServiceImpl implements FollowService {

	@Autowired
	FollowDao FollowDao;
	
	//나를 팔로잉한 회원 조회
	@Override
	public List<FollowVo> search_follow(FollowVo f) {
		// TODO Auto-generated method stub
		List<FollowVo> list = FollowDao.search_follow(f);
		return list;
	}

	//나를 팔로잉한 회원 수
	@Override
	public int search_follow_count(FollowVo f) {
		// TODO Auto-generated method stub
		int re = -1;
		re = FollowDao.search_follow_count(f);
		return re;
	}

	//내가 팔로잉한 회원 조회
	@Override
	public List<FollowVo> search_following(FollowVo f) {
		// TODO Auto-generated method stub
		List<FollowVo> list = FollowDao.search_following(f);
		return list;
	}

	//팔로우하기
	@Override
	public int insert_follow(FollowVo f) {
		// TODO Auto-generated method stub
		int re = -1;
		re = FollowDao.insert_follow(f);
		return re;
	}

	//맞팔로우하기
	@Override
	public int insert_follow2(FollowVo f) {
		// TODO Auto-generated method stub
		int re = -1;
		re = FollowDao.insert_follow2(f);
		return re;
	}
	
	//언팔로우
	@Override
	public int delete_follow(FollowVo f) {
		// TODO Auto-generated method stub
		int re = -1;
		re = FollowDao.delete_follow(f);
		return re;
	}
	
	//팔로잉 확인
	@Override
	public int follow_chk(FollowVo f) {
		// TODO Auto-generated method stub
		int re = -1;
		re = FollowDao.follow_chk(f);
		return re;
	}

}
