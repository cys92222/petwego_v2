package com.example.demo.dao;

import java.util.List;

import com.example.demo.vo.Pic_BoardVo;
import com.example.demo.vo.Pic_Board_CommentVo;
import com.example.demo.vo.Pic_Board_FileVo;

public interface M_PicboardDao {
	
//	픽보드 리스트 
	List<Pic_BoardVo> picboaard_list();

//	픽보드파일 리스트
	List<Pic_Board_FileVo> picboardfile_list();
	
//	 픽보드 상세보기
	Pic_BoardVo picboaard_detail(int photo_no);

//	픽보드파일 상세보기 
	Pic_Board_FileVo picboardfile_detail(int photo_no);
	
//	픽보드 삭제
	int picboard_delete(int photo_no);

//	픽보드파일 삭제 
	int picboardfile_delete(int photo_no);

//	픽보드댓글 삭제
	int picboardcomment_Alldelete(int photo_no);

//	좋아요 삭제
	int like_delete(int photo_no);
	
//	댓글 리스트
	List<Pic_Board_CommentVo> picboardcomment_list(int photo_no);
	
//	댓글 한개씩 삭제
	int picboardcomment_delete(int photo_comm_no);
}
