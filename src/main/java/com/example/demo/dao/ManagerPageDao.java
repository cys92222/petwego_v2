package com.example.demo.dao;

import java.util.List;

import com.example.demo.util.Criteria;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.Aop_LogVo;
import com.example.demo.vo.BoardVo;
import com.example.demo.vo.Board_CommentVo;
import com.example.demo.vo.Board_fileVo;
import com.example.demo.vo.ChartVo;
import com.example.demo.vo.MemberInfoVo;
import com.example.demo.vo.NoticeVo;
import com.example.demo.vo.PaymentVo;
import com.example.demo.vo.QnAVo;

// 민아) 5/19, 관리자페이지
public interface ManagerPageDao {
	
	
	// 자유게시판, 댓글 목록/삭제
	List<Board_CommentVo> listComment(Board_CommentVo bc);
	int deleteComment(Board_CommentVo bc);
	int deleteCommBoard(Board_CommentVo bc);
	int delboard_no(Board_fileVo bf);
	
	// 자유게시판, 목록/상세/삭제
	List<BoardVo> listBoard();
	BoardVo detailBoard(BoardVo b);
	int deleteBoard(BoardVo b);
	
	// 회원 / 결제정보
	List<PaymentVo> listPay();
	
	// 공지사항 / 목록,글쓰기,상세보기,삭제,수정
	List<NoticeVo> listNotice();
	int insertNotice(NoticeVo nv);
	NoticeVo detailNotice(NoticeVo nv);
	int deleteNotice(NoticeVo nv);
	int updateNotice(NoticeVo nv);
	
	
	// 관리자메인 - 일주일 - 신규회원수, 결제된금액, 개설모임수, 게시판새글수(게시판쿼리생각중)
	int newMember();
	Integer newPay();
	int newTogether();
	int newBoard();
	int newPic();
	 
	// 로그 차트 
	List<ChartVo> chartLog();
	
	// 로그 기록(등록)
	int insertLog(Aop_LogVo al);
	
	// 로그 목록
	List<Aop_LogVo> listLog();
	
	// 회원목록
	List<MemberInfoVo> listMember();

	// 회원정보 상세보기
	MemberInfoVo getMember(MemberInfoVo m);

	// 회원삭제(강퇴)
	int deleteMember(MemberInfoVo m);
	
	//QnA 리스트
	List<QnAVo> listQnA();
	
	//QnA 상세
	QnAVo detailQnA(QnAVo q);
	
	//QnA 답변등록
	int anwerQnA(QnAVo q);
}
