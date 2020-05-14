package com.example.demo.controller;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
//영수) 5월12일 공지사항 컨트롤러
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.NoticeService;
import com.example.demo.util.Criteria;
import com.example.demo.util.PageMaker;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.NoticeUpdateVo;
import com.example.demo.vo.NoticeVo;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Controller
//@RestController
public class NoticeController {
	
	@Autowired
	NoticeService service;
	
	@PostMapping(value="/admin/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		
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
	
	
	//공지사항 리스트
	@RequestMapping("/admin/allNotice")
	public ModelAndView allNotice(SearchCriteria scri){
		List<NoticeVo> list = service.allNoticeList(scri);
		PageMaker pageMaker = new PageMaker();
		ModelAndView mav = new ModelAndView();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.countNotice(scri));
		mav.setViewName("/admin/NoticeList");
			
		Gson gson = new Gson();
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("list", gson.toJson(list));
		
		return mav;
	}
	
	//공지사항 등록
	@RequestMapping("/admin/insertNotice")
	@ResponseBody
	public void insertNotice(NoticeVo n) {
		service.insertNotice(n);
	}
	
	//공지사항 삭제
	@RequestMapping("/admin/deleteNotice")
	@ResponseBody
	public String deleteNotice(NoticeVo n) {
		service.deleteNotice(n);
		
		return "a";
	}
	
	//공지사항 수정
	@RequestMapping("/admin/updateNotice")
	@ResponseBody
	public String updateNotice(NoticeUpdateVo nu) {
		System.out.println(nu);
		service.updateNotice(nu);
		
		return "a";
	}
	
	//공지사항 상세보기
	@RequestMapping(value = "/admin/detailNotice", method = RequestMethod.GET)
	@ResponseBody
	public NoticeVo detailNotice(NoticeVo n) {
		NoticeVo dn = service.detailNotice(n);
		service.hit(n);
		System.out.println(dn);
		return dn;
	}
	
	//조회수
	@RequestMapping("/admin/hit")
	@ResponseBody
	public void hit(NoticeVo n) {
		service.hit(n);
	}
	
}