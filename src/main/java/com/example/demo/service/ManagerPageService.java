package com.example.demo.service;

import java.util.List;

import com.example.demo.vo.Aop_LogVo;
import com.example.demo.vo.BoardVo;
import com.example.demo.vo.Board_CommentVo;
import com.example.demo.vo.Board_fileVo;
import com.example.demo.vo.ChartVo;
import com.example.demo.vo.FacilityVo;
import com.example.demo.vo.M_froomVo;
import com.example.demo.vo.MemberInfoVo;
import com.example.demo.vo.NoticeVo;
import com.example.demo.vo.PaymentVo;
import com.example.demo.vo.QnAVo;
import com.example.demo.vo.ReviewVo;
import com.example.demo.vo.RoomVo;

//민아) 5/19, 관리자페이지
public interface ManagerPageService {
	// 숙소 리뷰 삭제
	int deleteReview(ReviewVo re);

	// 숙소 리뷰목록
	List<ReviewVo> f_review();

	// 방정보
	List<M_froomVo> infoRoom(int facility_no);

	// 숙소목록
	List<FacilityVo> listFacility();

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

	// 관리자메인 - 카드들
	int newMember();

	Integer newPay();

	int newTogether();

	int newBoard();

	int newPic();

	int newQnA();

	int allfacility();

	int newReservation();

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

	// QnA 리스트
	List<QnAVo> listQnA();

	// QnA 상세
	QnAVo detailQnA(QnAVo q);

	// QnA 답변등록
	int anwerQnA(QnAVo q);

	// QnA 삭제
	int deleteQnA(QnAVo q);
}
