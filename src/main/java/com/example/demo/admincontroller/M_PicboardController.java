package com.example.demo.admincontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.M_PicboardService;
import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.vo.Pic_BoardVo;
import com.example.demo.vo.Pic_Board_CommentVo;
import com.example.demo.vo.Pic_Board_FileVo;
import com.google.gson.Gson;

//민아) 5/31, admincontroller 는 굳이  nologging 처리 안해도 되서 지움 
@Controller
public class M_PicboardController {

	@Autowired
	private M_PicboardService service;
	
	//리스트
	@RequestMapping("/management/picboard/listPicboard")
	public String picBoardList(Model model){

		model.addAttribute("boardList", service.picboaard_list());
		
		//사진 목록
		model.addAttribute("fileList", service.picboardfile_list());
		return "management/picboard/listPicboard";
	}
	
	//상세보기
	@RequestMapping("/management/picboard/detailPicboard")
	public String picBoardDetail(int photo_no,Model model){
//		System.out.println("상세보기할 번호" + photo_no);
		Pic_BoardVo pb = service.picboaard_detail(photo_no);
		Pic_Board_FileVo pbf = service.picboardfile_detail(photo_no);
		List<Pic_Board_CommentVo> pbc = service.picboardcomment_list(photo_no);
		
		model.addAttribute("pb", pb);
		model.addAttribute("pbf", pbf);
		model.addAttribute("pbc", pbc);
		
//		System.out.println(pb);
//		System.out.println(pbc);
//		System.out.println(pbc);
		return "management/picboard/detailPicboard";
	}
	
	//삭제
	@RequestMapping("/management/picboard/deletePicboard")
	public String deletePicboard(int photo_no,Model model) {
		//좋아요 삭제
		service.like_delete(photo_no);
		
		//댓글 삭제
		service.picboardcomment_Alldelete(photo_no);
		
		//파일 삭제
		service.picboardfile_delete(photo_no);
		
		//게시물 삭제
		service.picboard_delete(photo_no);
		
		return "redirect:/management/picboard/listPicboard";
	}
	
	
	
	//댓글 삭제
	@RequestMapping("/management/picboard/picboardcomment_delete")
	public String picboardcomment_delete(int photo_comm_no, int photo_no) {
//		System.out.println("삭제할 댓글번호" + photo_comm_no);
//		System.out.println("상세보기 글 번호" + photo_no);
		service.picboardcomment_delete(photo_comm_no);
		
		return "redirect:/management/picboard/detailPicboard?photo_no="+photo_no;
	}
}
