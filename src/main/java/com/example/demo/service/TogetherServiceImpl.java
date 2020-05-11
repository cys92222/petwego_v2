package com.example.demo.service;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dao.TogetherDao;
import com.example.demo.util.Criteria;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.TogetherVo;

@Service
public class TogetherServiceImpl implements TogetherService {

	@Autowired
	private TogetherDao dao;
	
	//함께가요 등록
	@Override
	public void writeTogether(TogetherVo togetherVo) throws Exception {
		dao.writeTogether(togetherVo);
		
	}
	
	//함께가요 목록
	@Override
	public List<TogetherVo> listTogether(SearchCriteria scri) throws Exception{
		return dao.listTogether(scri);
	}
	
	//게시물 총 개수
	public int listCount(SearchCriteria scri) throws Exception{
		return dao.listCount(scri);
	}
	
	//함께가요 상세
	@Override
	public TogetherVo detailTogether(int t_num) throws Exception{
		return dao.detailTogether(t_num);
	}
	
	//함께가요 수정
	@Override
	public void updateTogether(TogetherVo togetherVo) throws Exception{
		dao.updateTogether(togetherVo);
	}
	
	//함께가요 삭제
	@Override
	public void deleteTogether(int t_num) throws Exception{
		dao.deleteTogether(t_num);
	}

}
