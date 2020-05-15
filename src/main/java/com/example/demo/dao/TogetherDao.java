package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.example.demo.util.Criteria;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.ReplyVo;
import com.example.demo.vo.ThumbnailVo;
import com.example.demo.vo.TogetherVo;


public interface TogetherDao {

	//함께가요 작성
	public int writeTogether(TogetherVo togetherVo) throws Exception;
	
	//함께가요 목록
	public List<TogetherVo> listTogether(SearchCriteria scri) throws Exception;
	
	//게시물 총 개수
	public int listCount(SearchCriteria scri) throws Exception;
	
	//함께가요 상세
	public TogetherVo detailTogether(int t_num) throws Exception;
	
	//함께가요 수정
	public int updateTogether(TogetherVo togetherVo) throws Exception;
	
	//함께가요 삭제
	public void deleteTogether(int t_num) throws Exception;
	
	//함께가요 조회수
	public void togetherHit(int t_num) throws Exception;
	
	//첨부파일 업로드
	public void insertFile(Map<String, Object> map) throws Exception;

	//썸네일 등록
	public int insertThumbnail(ThumbnailVo t);
	
	//함께가요 마지막 글번호
	public int last_no();
	
	//썸네일 리스트
	public List<ThumbnailVo> listThumbnail(SearchCriteria scri);

}
