package com.example.demo.service;
//영수) 5월12일 공지사항 서비스임플리먼츠
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.NoticeDao;
import com.example.demo.vo.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao dao;
	
	//공지사항 리스트
	@Override
	public List<NoticeVo> allNoticeList() {
		// TODO Auto-generated method stub
		List<NoticeVo> list = dao.allNoticeList();
		return list;
	}

	//공지사항 등록
	@Override
	public int insertNotice(NoticeVo n) {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.insertNotice(n);
		return re;
	}

	//공지사항 삭제
	@Override
	public int deleteNotice(NoticeVo n) {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.deleteNotice(n);
		return re;
	}
	
	//공지사항 수정
	@Override
	public int updateNotice(NoticeVo n) {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.updateNotice(n);
		return re;
	}
	
	//공지사항 상세보기
	@Override
	public NoticeVo detailNotice(NoticeVo n) {
		// TODO Auto-generated method stub
		NoticeVo dn = dao.detailNotice(n);
		return dn;
	}

}
