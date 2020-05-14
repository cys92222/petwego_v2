package com.example.demo.dao;
import java.util.List;
import com.example.demo.util.Criteria;
import com.example.demo.vo.LikeItVo;
import com.example.demo.vo.Pic_BoardVo;
import com.example.demo.vo.Pic_Board_CommentVo;
import com.example.demo.vo.Pic_Board_FileVo;

public interface Pic_BoardDao {
	
	public List<Pic_Board_FileVo> listFile();
	
	public List<Pic_BoardVo> listBoard(Criteria cri) throws Exception;
	
	//페이징
	 int listCount() throws Exception;
		
	//게시물등록
	 int insert(Pic_BoardVo pb);	
	
	//사진파일
	 int insertfile(Pic_Board_FileVo pbf);
	
	//좋아요
	 int insertlikeit(LikeItVo l);
	
	//좋아요 수
	 int likecnt(LikeItVo l);
	
	//상세보기 
	 Pic_BoardVo detailPic_Board(int photo_no);

	//상세보기 사진
	 Pic_Board_FileVo detailFile(Pic_Board_FileVo pbf);
	
	//마지막 글번호
	 int photo_no();
	
	//게시글 삭제
	 int deletePic_Board(Pic_BoardVo pb);
	
	//게시글 수정
	 int updatePic_Board(Pic_BoardVo pb);
	
	
}
