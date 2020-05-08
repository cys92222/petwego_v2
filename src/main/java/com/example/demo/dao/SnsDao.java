package com.example.demo.dao;

import java.util.List;

import com.example.demo.vo.LikeItVo;
import com.example.demo.vo.Pic_BoardVo;
import com.example.demo.vo.Pic_Board_CommentVo;
import com.example.demo.vo.Pic_Board_FileVo;

public interface SnsDao {
	List<Pic_Board_FileVo> listAll();
	
	int insertsns(Pic_BoardVo pb);
	
	int insertfile(Pic_Board_FileVo pbf);
	
	int insertlikeit(LikeItVo l);
	
	int likecnt(LikeItVo l);
	
	int deletesns(Pic_Board_CommentVo pb);
}
