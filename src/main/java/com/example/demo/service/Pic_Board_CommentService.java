package com.example.demo.service;

import java.util.List;

import com.example.demo.util.Criteria;
import com.example.demo.vo.Pic_Board_CommentVo;
//봉현) 5/13
public interface Pic_Board_CommentService {
	// 댓글목록
	List<Pic_Board_CommentVo> listComment(int board_no);

	// 댓글등록
	int insertComment(Pic_Board_CommentVo pbc);

	// 댓글삭제
	int deleteComment(Pic_Board_CommentVo pbc);

	int deleteCommBoard(Pic_Board_CommentVo pbc);

	// 선택한 댓글보기(수정,삭제를 위해)
	Pic_Board_CommentVo selectComment(int photo_no);
}
