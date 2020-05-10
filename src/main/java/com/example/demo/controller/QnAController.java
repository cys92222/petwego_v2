package com.example.demo.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.QnAService;
import com.example.demo.vo.QnAVo;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@RestController
public class QnAController {
	
	@Autowired
	QnAService service;
	
	//고객센터 메인
	@RequestMapping("/admin/index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/index");
		
		return mav;
	}
	
	//모든 qna리스트
	@RequestMapping("/admin/List")
	public ModelAndView allQnAList(){
		ModelAndView mav = new ModelAndView();
		
		Gson gson = new Gson();
		mav.addObject("list", gson.toJson(service.allQnAList()));
		
//		mav.addObject("list", service.allQnAList());
		
		mav.setViewName("/admin/QnAList");
		
		return mav;
	}
	
	//qna등록
	@RequestMapping("/admin/insertQnA")
	public void insertQnA(QnAVo q) {
		
		if( service.allQnAList() == null ) {
			q.setRef(1);
		}else if( service.lastNo() == null){
			q.setRef(1);
		}else {
			q.setRef(service.lastNo()+1);
		}
		
		service.insertQnA(q);
	}
	
	//섬머노트 사진업로드
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("inq_file") MultipartFile multipartFile) {
			
		JsonObject jsonObject = new JsonObject();
			
		String fileRoot = "C:\\summernote_image\\";	//저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
					
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
			
		File targetFile = new File(fileRoot + savedFileName);	
			
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
					
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
			
		return jsonObject;
	}
	
	//qna상세보기
	@RequestMapping("/admin/detailQnA")
	public QnAVo detailQnA(QnAVo q) {
		QnAVo detail = service.detailQnA(q);
		return detail;
	}
	
	//qna삭제
	@RequestMapping("/admin/deleteQnA")
	public void deleteQnA(QnAVo q) {
		service.deleteQnA(q);
	}
	
	//답변등록
	@RequestMapping("/admin/insertRe")
	public void insertRe(QnAVo q) {
		//부모글 번호로 묶음
		q.setRef(q.getInq_no());
		//정렬순서
		q.setRef_step(q.getRef_step()+1);
		//들여쓰기
		q.setRef_level(q.getRef_level()+1);
		service.insertRe(q);
	}
}
