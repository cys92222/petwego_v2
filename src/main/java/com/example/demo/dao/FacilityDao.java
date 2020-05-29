package com.example.demo.dao;

import java.util.List;


import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.FacilityVo;
import com.example.demo.vo.ReservationVo;
import com.example.demo.vo.ReviewVo;
import com.example.demo.vo.RoomVo;


public interface FacilityDao {

	//숙소 리스트
	public List<FacilityVo> listFacility(SearchCriteria scri) throws Exception;
	
	//검색조건과 일치하는 숙소 총 개수
	public int listCount(SearchCriteria scri) throws Exception;
	
	//숙소 상세뷰
	public FacilityVo getFacility(int facility_no) throws Exception;
	 
	//객실 리스트 
	public List<RoomVo> listRoom(int facility_no) throws Exception;
	
	//리뷰 작성
	public void postReview(ReviewVo reviewVo) throws Exception;
	
	//리뷰 리스트
	public List<ReviewVo> listReview(int facility_no) throws Exception;	

	//(+)
	//리뷰 수정
	public void updateReview(ReviewVo reviewVo) throws Exception;

	//리뷰 삭제
	public void deleteReview(int r_no) throws Exception;
	
	//리뷰 GET
	public ReviewVo getReview(int r_no) throws Exception;
	
	//예약
	public void reservePlace(ReservationVo reservation) throws Exception;
	
//	결제안한 예약 조회
	ReservationVo select_reserve(String user_id);
}
