package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.service.Board_CommentService;
import com.example.demo.vo.Board_CommentVo;
import com.google.gson.Gson;

// 민아) 5/10, 자유게시판 댓글 목록,삭제,입력 완료 
// 댓글 페이징 남음 
@RestController
@RequestMapping("/comment/*")
public class Board_CommentController {
	@Autowired
	private Board_CommentService comm_service;

	public void setComm_service(Board_CommentService comm_service) {
		this.comm_service = comm_service;
	}
	
	// 댓글목록
	@GetMapping(value = "/listComment", produces = "application/json; charset=utf-8")
	public String listComment(Board_CommentVo bc) {
		List<Board_CommentVo> listComment = comm_service.listComment(bc.getBoard_no());
		Gson gson = new Gson();
		//System.out.println("댓글목록 컨트롤러 동작함");
		return gson.toJson(listComment);
	}
	
	// 댓글작성
	@RequestMapping(value = "/insertComment", method = RequestMethod.POST)
	public String insertComment(Board_CommentVo bc, RedirectAttributes rttr) {
		//System.out.println("댓글작성 컨트롤러 동작함");
		comm_service.insertComment(bc);
		rttr.addAttribute("board_no", bc.getBoard_no()); // 댓글이 달린 게시글의 번호 받아와야함
		return "redirect:/board/get";
	}

	// 댓글만 삭제
	@GetMapping(value = "/commDeleteSubmit")
	public String commDeleteSubmit(Board_CommentVo bc) {	
		comm_service.deleteComment(bc);
		// System.out.println("댓글삭제 컨트롤러 동작");
		return "redirect:/board/get";
	}
}
