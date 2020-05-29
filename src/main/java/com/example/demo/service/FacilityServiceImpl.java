package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.FacilityDao;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.FacilityVo;
import com.example.demo.vo.ReservationVo;
import com.example.demo.vo.ReviewVo;
import com.example.demo.vo.RoomVo;

@Service
public class FacilityServiceImpl implements FacilityService {
	@Autowired
	private FacilityDao dao;
	//숙소 리스트
	public List<FacilityVo> listFacility(SearchCriteria scri) throws Exception {
		return dao.listFacility(scri);
	}
	//검색조건과 일치하는 숙소 총 개수
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	//숙소 상세뷰 
	public FacilityVo getFacility(int facility_no) throws Exception {
		return dao.getFacility(facility_no);
	}

	//객실 리스트
	public List<RoomVo> listRoom(int facility_no) throws Exception {
		return dao.listRoom(facility_no);
	}
	//리뷰 작성
	public void postReview(ReviewVo reviewVo) throws Exception {
		dao.postReview(reviewVo);	
	}
	//리뷰 리스트
	public List<ReviewVo> listReview(int facility_no) throws Exception {
		return dao.listReview(facility_no);
	}
	//리뷰 수정
	public void updateReview(ReviewVo reviewVo) throws Exception {
		dao.updateReview(reviewVo);
		
	}
	//리뷰 삭제
	public void deleteReview(int r_no) throws Exception {
		dao.deleteReview(r_no);
	}
	//리뷰 GET
	public ReviewVo getReview(int r_no) throws Exception {
		return dao.getReview(r_no);
	}
	
	//예약
	public void reservePlace(ReservationVo reservation) throws Exception {
		dao.reservePlace(reservation);
		
	}
	
//	결제안한 예약 조회
	@Override
	public ReservationVo select_reserve(String user_id) {
		// TODO Auto-generated method stub
		ReservationVo rv = dao.select_reserve(user_id);
		return rv;
	}
	
//	아이디로 rm_no조회
	@Override
	public int select_rm_no(String user_id) {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.select_rm_no(user_id);
		return re;
	}
	
//	rm_no로 방이름 조회
	@Override
	public RoomVo select_room_name(int rm_no) {
		// TODO Auto-generated method stub
		RoomVo r = dao.select_room_name(rm_no);
		return r;
	}
	
//	rm_no로 호텔 번호 조회
	@Override
	public int select_facility_no(int rm_no) {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.select_facility_no(rm_no);
		return re;
	}
	
//	facility_no로 호텔 조회
	@Override
	public FacilityVo select_facility(int facility_no) {
		// TODO Auto-generated method stub
		FacilityVo fv = dao.select_facility(facility_no);
		return fv;
	}
	
//	결제하면 rsv_paid를 결제완료로 수정	
	@Override
	public int pay_rsv_paid(String user_id, int rsv_no) {
		// TODO Auto-generated method stub
		int re = -1;
		re = dao.pay_rsv_paid(user_id, rsv_no);
		return re;
	}
	
//	모든 예약 리스트	
	@Override
	public List<ReservationVo> select_reservation_list(String user_id) {
		// TODO Auto-generated method stub
		List<ReservationVo> list = dao.select_reservation_list(user_id);
		return list;
	}
	




}