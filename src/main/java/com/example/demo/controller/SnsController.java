package com.example.demo.controller;

import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
		List<Pic_Board_FileVo> list = snsService.listAll();
		
		String str = "";
		
		Gson gson = new Gson();
		str = gson.toJson(list);
		
		mav.setViewName("/sns/listsns");
		mav.addObject("list", str);
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
	public int insertsns(Pic_BoardVo pb, MultipartFile multipartFile, HttpServletRequest request) {
		int re = -1;
		re = snsService.insertsns(pb); // sns 글 등록
		pb.setPhoto_no(re); //글등록하고 시퀀스로 생성된 글번호를 Photo_no에 설정
		
		String path = request.getRealPath("/img");

		System.out.println(path);

		
		String oldFname = pb.getPhoto_file_name();
		MultipartFile uploadFile = pb.getUploadFile();
		String fname = null;
		if(uploadFile != null) {
			fname = uploadFile.getOriginalFilename();
			if(fname != null && !fname.equals("")) {
				pb.setPhoto_file_name(fname);
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
		uploadFile = pb.getUploadFile();
		fname = uploadFile.getOriginalFilename();
		pb.setPhoto_file_name(fname);
		
		//파일파일 테이블 등록
		re = snsService.insertfile(pb);
		return re;
	}
	
//	//sns 파일 등록
//	@RequestMapping("/sns/insertfile")
//	public int insertfile(Pic_Board_FileVo pbf) {
//		int re = -1;
//		re = snsService.insertfile(pbf);
//		return re;
//	}
	
	//좋아요
	
	//좋아요 수
	
	//sns 글 삭제
}
