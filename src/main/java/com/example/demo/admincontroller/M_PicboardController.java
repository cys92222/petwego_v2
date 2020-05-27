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
import com.example.demo.vo.Pic_Board_FileVo;
import com.google.gson.Gson;

@Controller
public class M_PicboardController {

	@Autowired
	private M_PicboardService service;
	
	//리스트
	@NoLogging
	@RequestMapping("/management/picboad/listPicboad")
	public String picBoardList(Model model){
		//게시물 목록
//		Gson gson = new Gson();
//		String str = gson.toJson(service.picboaard_list());
//		model.addAttribute("boardList", str);
//		System.out.println(str);
		
		model.addAttribute("boardList", service.picboaard_list());
		//사진 목록
		model.addAttribute("fileList", service.picboardfile_list());
		return "management/picboard/listPicboard";
	}
	
	//상세보기
	@NoLogging
	@RequestMapping("/management/picboad/detailPicboad")
	public String picBoardDetail(int photo_no,Model model){
		System.out.println("상세보기할 번호" + photo_no);
		Pic_BoardVo pb = service.picboaard_detail(photo_no);
		Pic_Board_FileVo pbc = service.picboardfile_detail(photo_no);
		
		model.addAttribute("pb", pb);
		model.addAttribute("pbc", pbc);
		
		System.out.println(pb);
		System.out.println(pbc);
		return "management/picboard/detailPicboard";
	}
	
	//삭제
	@NoLogging
	@RequestMapping("/management/picboad/deletePicboard")
	public String deletePicboard(int photo_no,Model model) {
		//좋아요 삭제
		service.like_delete(photo_no);
		
		//댓글 삭제
		service.picboardcomment_delete(photo_no);
		
		//파일 삭제
		service.picboardfile_delete(photo_no);
		
		//게시물 삭제
		service.picboard_delete(photo_no);
		
		return "redirect:/management/picboad/listPicboad";
	}
}
