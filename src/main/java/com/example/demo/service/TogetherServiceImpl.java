package com.example.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.web.multipart.MultipartHttpServletRequest;


import com.example.demo.dao.TogetherDao;
import com.example.demo.util.Criteria;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.Animal_infoVo;
import com.example.demo.vo.ReplyVo;
import com.example.demo.vo.TogetherVo;

@Service
public class TogetherServiceImpl implements TogetherService {
	
	@Autowired
	private TogetherDao dao;
	
	//함께가요 등록
	@Override
	public int writeTogether(TogetherVo togetherVo) throws Exception {
		return dao.writeTogether(togetherVo);
		
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
	
	
	//함께가요 수정
	@Override
	public int updateTogether(TogetherVo togetherVo) throws Exception{
		return dao.updateTogether(togetherVo);
	}
	
	//함께가요 삭제
	@Override
	public void deleteTogether(int t_num) throws Exception{
		dao.deleteTogether(t_num);
	}
	
	//함께가요 상세 및 조회수
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public TogetherVo detailTogether(int t_num) throws Exception {
		dao.togetherHit(t_num);
		return dao.detailTogether(t_num);
	}
	
	//함께가요 원본글 작성자 id
	@Override
	public String select_together_id(int t_num) {
		// TODO Auto-generated method stub
		String str = "";
		str = dao.select_together_id(t_num);
		return str;
	}

	@Override
	public Integer last_no() {
		// TODO Auto-generated method stub
		Integer re = dao.last_no();
		return re;
	}

	@Override
	public List<Animal_infoVo> chk_animal_list(String user_id) {
		// TODO Auto-generated method stub
		List<Animal_infoVo> list = dao.chk_animal_list(user_id);
		return list;
	}
	
	
	
	
}
