package com.example.demo.dao;

import java.util.List;

import com.example.demo.util.Criteria;
import com.example.demo.vo.Pic_Board_CommentVo;

public interface Pic_Board_CommentDao {
	// 댓글목록
	List<Pic_Board_CommentVo> listComment(int photo_no);

	// 댓글등록
	int insertComment(Pic_Board_CommentVo pc);

	// 댓글삭제
	int deleteComment(Pic_Board_CommentVo pc);

	int deleteCommBoard(Pic_Board_CommentVo pc);

	// 선택한 댓글보기(수정,삭제를 위해)
	Pic_Board_CommentVo selectComment(int comm_num);
}
