package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.M_PicboardDao;
import com.example.demo.vo.Pic_BoardVo;
import com.example.demo.vo.Pic_Board_FileVo;

@Service
public class M_PicboardServiceImpl implements M_PicboardService {
	
	@Autowired
	M_PicboardDao dao;
//	픽보드 리스트 
	@Override
	public List<Pic_BoardVo> picboaard_list() {
		// TODO Auto-generated method stub
		List<Pic_BoardVo> list = dao.picboaard_list();
		return list;
	}
	
//	픽보드파일 리스트
	@Override
	public List<Pic_Board_FileVo> picboardfile_list() {
		// TODO Auto-generated method stub
		List<Pic_Board_FileVo> list = dao.picboardfile_list();
		return list;
	}
	
//	픽보드 상세보기
	@Override
	public Pic_BoardVo picboaard_detail(int photo_no) {
		// TODO Auto-generated method stub
		Pic_BoardVo pb = dao.picboaard_detail(photo_no);
		return pb;
	}

//	픽보드파일 상세보기
	@Override
	public Pic_Board_FileVo picboardfile_detail(int photo_no) {
		// TODO Auto-generated method stub
		Pic_Board_FileVo pbc = dao.picboardfile_detail(photo_no);
		return pbc;
	}
	
//	픽보드 삭제
	@Override
	public int picboard_delete(int photo_no) {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.picboard_delete(photo_no);
		return re;
	}
	
//	픽보드파일 삭제 
	@Override
	public int picboardfile_delete(int photo_no) {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.picboardfile_delete(photo_no);
		return re;
	}

//	픽보드댓글 삭제	
	@Override
	public int picboardcomment_delete(int photo_no) {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.picboardcomment_delete(photo_no);
		return re;
	}
	
//	좋아요 삭제
	@Override
	public int like_delete(int photo_no) {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.like_delete(photo_no);
		return re;
	}
	

}
