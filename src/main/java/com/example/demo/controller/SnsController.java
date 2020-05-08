package com.example.demo.controller;

import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.SnsService;
import com.example.demo.vo.Pic_BoardVo;
import com.example.demo.vo.Pic_Board_FileVo;
import com.google.gson.Gson;

@RestController
public class SnsController {
	@Autowired
	SnsService snsService;
	
	//자신이 등록한 모든사진
	@RequestMapping("/sns/listAll")
	public ModelAndView listAll() {
		ModelAndView mav = new ModelAndView();
		List<Pic_Board_FileVo> list_file = snsService.listFile();
		
		List<Pic_BoardVo> list_board = snsService.listBoard();
		
		String str_file = "";
		String str_board = "";
		
		Gson gson = new Gson();
		str_file = gson.toJson(list_file);
		str_board = gson.toJson(list_board);
		
		mav.setViewName("/sns/listsns");
		mav.addObject("file", str_file);
		mav.addObject("board", str_board);
		return mav;
	}
	
	//sns 글 등록 폼
	@RequestMapping("/sns/insertsnsform")
	public ModelAndView insertsnsform() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/sns/insertsns");
		return mav;
	}
	
	//sns 글 등록
//	@RequestMapping("/sns/insertsns")
//	public int insertsns(Pic_BoardVo pb,Pic_Board_FileVo pbf, MultipartFile multipartFile) {
//		int re = -1;
//		re = snsService.insertsns(pb);
//		System.out.println("파일명"+pb.getPhoto_file_name());
//		pbf.setPhoto_file_name(pb.getPhoto_file_name());
//		re = snsService.insertfile(pbf);
//		return re;
//	}
	@RequestMapping("/sns/insertsns")
	public ModelAndView insertsns(Pic_BoardVo pb, Pic_Board_FileVo pbf,MultipartFile multipartFile, HttpServletRequest request) {
		int re = -1;
		re = snsService.insertsns(pb); // sns 글 등록
//		pbf.setPhoto_no(re); //글등록하고 시퀀스로 생성된 글번호를 Photo_no에 설정, 안됨 전부 1로 들어감
		System.out.println("마지막 글번호:" + snsService.photo_no());
		pbf.setPhoto_no(snsService.photo_no());
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaa"+pbf.getPhoto_no());
		
		String path = request.getRealPath("/img");

		System.out.println(path);

		
		String oldFname = pbf.getPhoto_file_name();
		MultipartFile uploadFile = pbf.getUploadFile();
		String fname = null;
		if(uploadFile != null) {
			fname = uploadFile.getOriginalFilename();
			if(fname != null && !fname.equals("")) {
				pbf.setPhoto_file_name(fname);
				try {
					byte []data = uploadFile.getBytes();
					FileOutputStream fos = new FileOutputStream(path + "/" +fname);

					fos.write(data);
					fos.close();
					
				}catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
				}
			}
		}
			
	
		
		//파일 업로드
		uploadFile = pbf.getUploadFile();
		fname = uploadFile.getOriginalFilename();
		pbf.setPhoto_file_name(fname);
		
		//파일 테이블 등록
		re = snsService.insertfile(pbf);
		ModelAndView mav = new ModelAndView();
	
		Gson gson = new Gson();
		String str_file = "";
		str_file = gson.toJson(snsService.listFile());
		
		String str_board = "";
		str_board = gson.toJson(snsService.listBoard());
		
		mav.addObject("file", str_file);
		mav.addObject("board", str_board);
		mav.setViewName("/sns/listsns");
		return mav;
	}
	
	
	
	
	
	//좋아요
	
	//좋아요 수
	
	//sns 글 삭제
	
	//상세보기
	@GetMapping("/sns/detail")
//	@RequestMapping("/sns/detail")
	public ModelAndView detail(int photo_no) {
		 
//		ModelMap model = new ModelMap();
//		model.addAttribute("board", snsService.detailBoard(no));
//		model.addAttribute("file", snsService.detailFile(no));
//		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("board", snsService.detailBoard(photo_no));
		mav.addObject("file", snsService.detailFile(photo_no));
		mav.setViewName("/sns/detailsns");
		
		return mav;
	}
}
