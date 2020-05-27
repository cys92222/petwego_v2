package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ManagerPageDao;
import com.example.demo.util.Criteria;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.Aop_LogVo;
import com.example.demo.vo.ChartVo;
import com.example.demo.vo.MemberInfoVo;
import com.example.demo.vo.NoticeVo;
import com.example.demo.vo.PaymentVo;
import com.example.demo.vo.QnAVo;

//민아) 5/19, 관리자페이지
@Service
public class ManagerPageServiceImpl implements ManagerPageService {

	@Autowired
	private ManagerPageDao mDao;

	// 회원 / 결제정보
	@Override
	public List<PaymentVo> listPay() {
		return mDao.listPay();
	}

	// 공지사항 / 목록,글쓰기,상세보기,삭제,수정
	@Override
	public List<NoticeVo> listNotice() {
		return mDao.listNotice();
	}

	@Override
	public int insertNotice(NoticeVo nv) {
		return mDao.insertNotice(nv);
	}

	@Override
	public NoticeVo detailNotice(NoticeVo nv) {
		return mDao.detailNotice(nv);
	}

	@Override
	public int deleteNotice(NoticeVo nv) {
		return mDao.deleteNotice(nv);
	}

	@Override
	public int updateNotice(NoticeVo nv) {
		return mDao.updateNotice(nv);
	}

	// 관리자메인 - 일주일 - 신규회원수, 결제된금액, 개설모임수, 게시판새글수(게시판쿼리생각중)
	@Override
	public int newMember() {
		return mDao.newMember();
	}

	@Override
	public Integer newPay() {
		if (mDao.newPay() == null) {
			return 0;
		}
		return mDao.newPay();
	}

	@Override
	public int newTogether() {
		return mDao.newTogether();
	}

	// 로그 차트
	@Override
	public List<ChartVo> chartLog() {
		return mDao.chartLog();
	}

	// 로그 기록(등록)
	@Override
	public int insertLog(Aop_LogVo al) {
		return mDao.insertLog(al);
	}

	// 로그 목록
	@Override
	public List<Aop_LogVo> listLog() {
		return mDao.listLog();
	}

	// 회원목록
	@Override
	public List<MemberInfoVo> listMember() {
		return mDao.listMember();
	}

	// 회원정보 상세보기
	@Override
	public MemberInfoVo getMember(MemberInfoVo m) {
		return mDao.getMember(m);
	}

	// 회원삭제(강퇴)
	@Override
	public int deleteMember(MemberInfoVo m) {
		return mDao.deleteMember(m);
	}
	
	//QnA 리스트
	@Override
	public List<QnAVo> listQnA() {
		// TODO Auto-generated method stub
		List<QnAVo> list = mDao.listQnA();
		return list;
	}
	
	//QnA 상세
	@Override
	public QnAVo detailQnA() {
		// TODO Auto-generated method stub
		QnAVo detail = mDao.detailQnA();
		return detail;
	}

}
