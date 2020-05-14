//package com.example.demo.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.example.demo.service.Pic_Board_CommentService;
//
//import com.example.demo.vo.Pic_Board_CommentVo;
//import com.google.gson.Gson;
//
//// 봉현) 5/13, 자유게시판 댓글 목록,삭제,입력 완료 
//
//@RestController
//@RequestMapping("/comment/*")
//public class Pic_Board_CommentController {
//	@Autowired
//	private Pic_Board_CommentService comm_service;
//
//	public void setComm_service(Pic_Board_CommentService comm_service) {
//		this.comm_service = comm_service;
//	}
//
//	// 댓글목록
//	@GetMapping(value = "/listPhotoComment", produces = "application/json; charset=utf-8")
//	public String listPhotoComment(Pic_Board_CommentVo pbc) {
//		List<Pic_Board_CommentVo> listComment = comm_service.listComment(pbc.getPhoto_no());
//		Gson gson = new Gson();
//		return gson.toJson(listComment);
//	}
//	
//	// 댓글작성
//	@PostMapping(value = "/insertPhotoComment")
//	public ModelAndView insertPhotoComment(Pic_Board_CommentVo pbc) {
//		ModelAndView mav = new ModelAndView("redirect:/sns/detailsns?photo_no="+pbc.getPhoto_no());
//		comm_service.insertComment(pbc);
//		return mav;
//	}
//
//	// 댓글만 삭제
//	@GetMapping(value = "/commDeleteSubmit")
//	public String commDeleteSubmit(Pic_Board_CommentVo pbc) {	
//		comm_service.deleteComment(pbc);
//		return "redirect:/sns/detailsns";
//	}
//}
