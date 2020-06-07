package com.example.demo.service;

import java.util.List;

import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.FacilityVo;
import com.example.demo.vo.ReservationVo;
import com.example.demo.vo.ReviewVo;
import com.example.demo.vo.RoomVo;

public interface FacilityService {
	//숙소 리스트
	public List<FacilityVo> listFacility(SearchCriteria scri) throws Exception;
	
	//검색조건과 일치하는 숙소 총 개수
	public int listCount(SearchCriteria scri) throws Exception;
	
	//숙소 조회
	public FacilityVo getFacility(int facility_no) throws Exception;
	 
	//객실 리스트
	public List<RoomVo> listRoom(int facility_no) throws Exception;
	//리뷰 작성
	public void postReview(ReviewVo reviewVo) throws Exception;


	
	//리뷰 리스트
	public List<ReviewVo> listReview(int facility_no) throws Exception;

	//리뷰 수정
	public void updateReview(ReviewVo reviewVo) throws Exception;
	//리뷰 삭제
	public void deleteReview(int r_no) throws Exception;
	//리뷰 GET
	public ReviewVo getReview(int r_no) throws Exception;
	//예약
	//public void reservePlace(int rm_no) throws Exception;
	public void reservePlace(ReservationVo reservation) throws Exception;
	
//	결제안한 예약 조회
	ReservationVo select_reserve(String user_id);
	
//	아이디로 rm_no조회
	ReservationVo select_rm_no(String user_id);

//	rm_no로 방이름 조회
	RoomVo select_room_name(int rm_no);

//	rm_no로 호텔 번호 조회
	int select_facility_no(int rm_no);
	
//	facility_no로 호텔 조회
	FacilityVo select_facility(int facility_no);
	
//	결제하면 rsv_paid를 결제완료로 수정
	int pay_rsv_paid(String user_id, int rsv_no);	
	
//	모든 예약 리스트	
	List<ReservationVo> select_reservation_list(String user_id);	
	
	//리뷰 개수
	public int countReview(int facility_no);
	
	//예약 상세
	public ReservationVo detail_reservation(int rsv_no);
	
}