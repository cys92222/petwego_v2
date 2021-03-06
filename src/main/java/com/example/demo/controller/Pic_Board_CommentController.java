package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.Pic_Board_CommentService;

import com.example.demo.vo.Pic_Board_CommentVo;
import com.google.gson.Gson;

// 봉현) 5/13, Pic_board 목록,삭제,입력 완료 
// 민아) 5/19, HttpServletRequest request 이랑 @NoLogging 처리 
@RestController
@RequestMapping("/pcomment/*")
public class Pic_Board_CommentController {
   @Autowired
   private Pic_Board_CommentService pcomm_service;

   public void setComm_service(Pic_Board_CommentService pcomm_service) {
      this.pcomm_service = pcomm_service;
   }
   // 댓글목록
   @GetMapping(value = "/plistComment", produces = "application/json; charset=utf-8")
   public String plistComment(HttpServletRequest request,Pic_Board_CommentVo pbc) {   
      List<Pic_Board_CommentVo> plistComment = pcomm_service.plistComment(pbc.getPhoto_no());
      
      Gson gson = new Gson();
      String comm_list = gson.toJson(plistComment);
      return gson.toJson(plistComment);
   }
 
   // 댓글작성
   @RequestMapping(value = "/pinsertComment")
   public ModelAndView pinsertComment(HttpServletRequest request,Pic_Board_CommentVo pbc) {
	  System.out.println("aaaaaaaaaaaaaaa 댓글 작성 컨트롤러");
      ModelAndView mav = new ModelAndView("redirect:/pic_board/detail?photo_no=" + pbc.getPhoto_no()+"&user_id="+pbc.getUser_id()+"&in_user_id="+pbc.getUser_id());
      // System.out.println(pbc.getPhoto_comm_cont() + "\t" + pbc.getUser_id() + "\t"
      // + pbc.getPhoto_no());
      System.out.println("게시물 번호" + pbc.getPhoto_no());
      pcomm_service.pinsertComment(pbc);
      return mav;
   }

   // 댓글만 삭제
   @GetMapping(value = "/pcommDeleteSubmit")
   public String pcommDeleteSubmit(HttpServletRequest request,Pic_Board_CommentVo pbc,String user_id2) {
	   System.out.println("댓글삭제 컨트롤러" + pbc);
      pcomm_service.pdeleteComment(pbc);
      return "ok";
   }
}