package com.example.demo.service;
//영수) 5월12일 공지사항 서비스
import java.util.List;
//영수) 5월12일 공지사항 서비스
import com.example.demo.vo.NoticeVo;

public interface NoticeService {

	//공지사항 리스트
	public List<NoticeVo> allNoticeList();

	//공지사항 등록
	public int insertNotice(NoticeVo n);

	//공지사항 삭제
	public int deleteNotice(NoticeVo n);

	//공지사항 수정
	public int updateNotice(NoticeVo n);
	
	//공지사항 상세보기
	public NoticeVo detailNotice(NoticeVo n);
	
	//조회수
	public int hit(NoticeVo n);
}
