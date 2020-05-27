package com.example.demo.admincontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.M_PicboardService;
import com.example.demo.util.AopLog.NoLogging;

@Controller
public class M_PicboardController {

	@Autowired
	private M_PicboardService service;
	
	//리스트
	@NoLogging
	@RequestMapping("/management/picboad/listPicboad")
	public String picBoardList(Model model){
		//게시물 목록
		model.addAttribute("boardList", service.picboaard_list());
		//사진 목록
		model.addAttribute("fileList", service.picboardfile_list());
		return "management/picboard/listPicboard";
	}
	
	//디테일
	@NoLogging
	@RequestMapping("/management/picboad/detailPicboad")
	public String picBoardDetail(int photo_no,Model model){
		
		
		return "management/picboard/listPicboard";
	}
}
