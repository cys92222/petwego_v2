package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.QnaService;
import com.example.demo.vo.QnaVo;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@RestController
public class QnaController {
	
	//service와 의존관계 설정
	@Autowired
	QnaService qnaService;
	
	//고객센터 메인
	@RequestMapping("/admin/index")
	public ModelAndView indexQna() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/index");
		return mav;
	}
	
	//섬머노트 사진업로드
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
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
	
	//qna 리스트
	//qna페이징, 검색
		@RequestMapping(value = "/admin/listQnA", method = {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView page(Model model, @ModelAttribute("QnAVo") QnaVo q) {
			Logger logger = LoggerFactory.getLogger(QnaController.class);
			ModelAndView mav = new ModelAndView();
			
			logger.info(">>>> page home start!!");

		    //검색조건, 검색어
		    logger.info("SearchFiled : " + q.getSearchFiled());
		    logger.info("SearchValue : " + q.getSearchValue());
		  
		    //--페이징 처리
		    int totalCount = qnaService.totalrecord(); //게시물 총갯수를 구한다
		    q.setTotalCount(totalCount); //페이징 처리를 위한 setter 호출
//		    model.addAttribute("pageVO", q);
		    mav.addObject("pageVO", q);
		    logger.info("PageSize // 한 페이지에 보여줄 게시글 수 : " + q.getPageSize());
		    logger.info("PageNo // 페이지 번호 : " + q.getPageNo());
		    logger.info("StartRowNo //조회 시작 row 번호 : " + q.getStartRowNo());
		    logger.info("EndRowNo //조회 마지막 now 번호 : " + q.getEndRowNo());
		    logger.info("FirstPageNo // 첫 번째 페이지 번호 : " + q.getFirstPageNo());
		    logger.info("FinalPageNo // 마지막 페이지 번호 : " + q.getFinalPageNo());
		    logger.info("PrevPageNo // 이전 페이지 번호 : " + q.getPrevPageNo());
		    logger.info("NextPageNo // 다음 페이지 번호 : " + q.getNextPageNo());
		    logger.info("StartPageNo // 시작 페이지 (페이징 네비 기준) : " + q.getStartPageNo());
		    logger.info("EndPageNo // 끝 페이지 (페이징 네비 기준) : " + q.getEndPageNo());
		    logger.info("totalCount // 게시 글 전체 수 : " + totalCount);
		    //--페이징 처리
		  
		    Gson gson = new Gson();
		    
		    List<QnaVo> qnaList = qnaService.getQnAList(q);
		    String str2 = gson.toJson(qnaList);
		    mav.addObject("resultList", str2);
//		    mav.addObject("resultList", qnaList);
		    
//		    model.addAttribute("resultList", qnaList);
		    
		    
		    
		    String firstpage = gson.toJson(q.getFirstPageNo());
		    String finalpage = gson.toJson(q.getFinalPageNo());
		    
		    
			
			String str = "";
			
			str = gson.toJson(qnaService.listQna());
//			model.addAttribute("list", str);
			mav.addObject("list", str);
			mav.addObject("insert_result", -1);
			
			mav.addObject("firstpage", firstpage);
			mav.addObject("finalpage", finalpage);
			
			mav.setViewName("/admin/listqna");
		    return mav;
		}
	
	//qna 등록
	@RequestMapping("/admin/insert_qna")
	public ModelAndView insert_qna(QnaVo q, HttpServletRequest request) {

//		String path = request.getRealPath("/test02/src/main/webapp/WEB-INF/views/img");
//		System.out.println(path);
//		String path = "C:\\Users\\cys92\\git\\test02\\src\\main\\webapp\\WEB-INF\\views\\img";
		
		String path = request.getRealPath("/img");

		System.out.println(path);

		
//		String oldFname = q.getinq_file();
//		MultipartFile uploadFile = q.getUploadFile();
//		String fname = null;
//		if(uploadFile != null) {
//			fname = uploadFile.getOriginalFilename();
//			if(fname != null && !fname.equals("")) {
//				q.setinq_file(fname);
//				try {
//					byte []data = uploadFile.getBytes();
//					FileOutputStream fos = new FileOutputStream(path + "/" +fname);
//
//					fos.write(data);
//					fos.close();
//					
//				}catch (Exception e) {
//					// TODO: handle exception
//					System.out.println(e.getMessage());
//				}
//			}
//		}
		
		MultipartFile uploadFile = q.getUploadFile();
		String fname = uploadFile.getOriginalFilename();
		q.setInq_file(fname);
		
		int re = qnaService.insertQna(q);
		if(re <= 0) {
		
		}else {
			try {
				byte[]data = uploadFile.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + fname);
				fos.write(data);
				fos.close();
			}catch (Exception e) {
				// TODO: handle exception
				System.out.println("예외발생:"+e.getMessage());
			}
		}
		
        
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/listqna");
		mav.addObject("insert_result", 1);
		
		Gson gson = new Gson();
	    List<QnaVo> qnaList = qnaService.getQnAList(q);
	    String str2 = gson.toJson(qnaList);
	    mav.addObject("resultList", str2);
		return mav;
	}
	
	//qna삭제
	@RequestMapping("/admin/detele_qna")
	public int delete_qna(QnaVo q) {
		int re = -1;
		
		re = qnaService.deleteQna(q);
		
		return re;
	}
	
	//qna상세보기
	@RequestMapping("/admin/detail_qna")
	public QnaVo detail_qna(QnaVo q) {
		QnaVo detail = qnaService.detailQna(q);
		
		return detail;
	}
	
}
