package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.service.ReplyService;
import com.example.demo.service.TogetherService;
import com.example.demo.util.Criteria;
import com.example.demo.util.PageMaker;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.ReplyVo;
import com.example.demo.vo.ThumbnailVo;
import com.example.demo.vo.TogetherVo;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("/together/*")
public class TogeteherController {
	private static final Logger LOGGER = LoggerFactory.getLogger(TogeteherController.class);
	
	@Autowired
	TogetherService service;
	
	@Autowired
	ReplyService Rservice;
	
	@RequestMapping(value="/write")
	public String boardWrite() {
	  return "together/test";
	}
	//댓글삭제 GET
	@RequestMapping(value="/deleteReplyView",method = RequestMethod.GET)
	public String replyDeleteView(ReplyVo rv,SearchCriteria scri, Model model) throws Exception {
		LOGGER.info("writeReply");
		
		model.addAttribute("deleteReply",Rservice.selectReply(rv.getT_r_num()));
		model.addAttribute("scri",scri);
		
		return "together/deleteReplyView";
	}
	
	//댓글삭제 POST
	@RequestMapping(value="/deleteReply",method = RequestMethod.POST)
	public String replyDelete(ReplyVo rv,SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		LOGGER.info("writeReply");
			
		Rservice.deleteReply(rv);
		
		rttr.addAttribute("t_num",rv.getT_num());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
			
		return "redirect:/together/detailTogether";
	}
	
	
	//댓글수정 GET
	@RequestMapping(value="/updateReplyView",method = RequestMethod.GET)
	public String updateReplyView(ReplyVo rv, SearchCriteria scri, Model model) throws Exception {
		LOGGER.info("writeReply");
		
		model.addAttribute("updateReply",Rservice.selectReply(rv.getT_r_num()));
		System.out.println(rv.getT_r_num());
		model.addAttribute("scri",scri);
		
		return "together/updateReplyView";
	}
	
	//댓글수정 POST
	//댓글 수정 페이지에 접근하기 위한 컨트롤러와 수정한 값을 전송할 수 있는 컨트롤러를 작성
	@RequestMapping(value="/updateReply",method = RequestMethod.POST)
	public String updateReply(ReplyVo rv, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		LOGGER.info("writeReply");
		
		Rservice.updateReply(rv);
		
		rttr.addAttribute("t_num",rv.getT_num());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/together/detailTogether";
	}
	
	
	@RequestMapping(value="writeReply", method = RequestMethod.POST)
	//파라미터로 ReplyVO, SearchCriteria, RedirectAttributes를 넣는다.
	//ReplyVO는 댓글 작성하기위한 데이터, SearchCriteria는 readView에 있던 page, perPageNum, searchType, keyword값을 받아오기 위한것.
	//RedirectAttributes는 redirect했을때 값들을 물고 이동.
	//그래서 SearchCriteria의 값을
	//넣어서 댓글을 저장 한 뒤 원래 페이지로 redirect하여 이동
	public String writeReply(ReplyVo rv, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		LOGGER.info("writeReply");
		
		Rservice.writeReply(rv);
		rttr.addAttribute("t_num",rv.getT_num());
		rttr.addAttribute("page",scri.getPage());
		rttr.addAttribute("perPageNum",scri.getPerPageNum());
		rttr.addAttribute("searchType",scri.getSearchType());
		rttr.addAttribute("keyword",scri.getKeyword());
		
		return "redirect:/together/detailTogether";
	}
	
	//함께가요 글 작성 화면
	@RequestMapping(value="/together/writeTogetherView",method = RequestMethod.GET)
//	@RequestMapping(value="writeTogetherView",method = RequestMethod.GET)
	public void writeTogetherView() throws Exception{
		LOGGER.info("writeTogetherView");
	}
	
////	함께가요 글 작성
//	@RequestMapping(value="/together/writeTogether",method = RequestMethod.POST)
////	@RequestMapping(value="writeTogether",method = {RequestMethod.GET,RequestMethod.POST})
//	public String write(TogetherVo togetherVo,ThumbnailVo t ,HttpSession session, HttpServletRequest request) throws Exception{
//		LOGGER.info("writeTogether");
//		
//		//첨부한 파일 불러옴
//		MultipartFile thumbnailFile = t.getThumbnailFile();
//		String t_thumbnail = thumbnailFile.getOriginalFilename();
//		t.setFile_name(t_thumbnail);
//		
//		//함께가요 등록
//		int re = service.writeTogether(togetherVo);
//	
//		//마지막 글번호
//		int no = service.last_no();
//		
//		//썸네일 등록
//		//썸네일이랑 글연결을 위해 t_num을 마지막 글번호(새로등록한 게시물 번호)로 설정
//		t.setT_num(no);
//		int tr = service.insertThumbnail(t);
//		
//		//썸네일 파일 업로드
//		if(tr>0) {
//			try {
//				
//				String path = request.getRealPath("t_thumbnailUpload");
//				System.out.println("path : " + path);
//				
//				byte[] data = thumbnailFile.getBytes();
//				FileOutputStream thumnailfos = new FileOutputStream(path + "/" + t_thumbnail);
//				thumnailfos.write(data);
//			} catch (Exception e) {
//				// TODO: handle exception
//				System.out.println("예외발생:" + e.getMessage());
//			}
//			
//		}
//		
//		return "redirect:/together/listTogether";
//	}
	
	//함께가요 등록
	@RequestMapping(value="/together/writeTogether",method = RequestMethod.POST)
//@RequestMapping(value="writeTogether",method = {RequestMethod.GET,RequestMethod.POST})
	public String write(TogetherVo togetherVo ,HttpSession session, HttpServletRequest request) throws Exception{
	LOGGER.info("writeTogether");
	
	//첨부한 파일 불러옴
	MultipartFile thumbnailFile = togetherVo.getThumbnailFile();
	System.out.println("thumbnailFile  " + thumbnailFile);
	String t_thumbnail = thumbnailFile.getOriginalFilename();
	System.out.println("t_thumbnail   " + t_thumbnail);
	togetherVo.setThumbnail(t_thumbnail);
	System.out.println("togetherVo.setThumbnail   "+togetherVo.getThumbnail());
	//함께가요 등록
	int re = service.writeTogether(togetherVo);


	
	//썸네일 파일 업로드
	if(re>0) {
		try {
			
			String path = request.getRealPath("t_thumbnailUpload");
			System.out.println("path : " + path);
			
			byte[] data = thumbnailFile.getBytes();
			FileOutputStream thumnailfos = new FileOutputStream(path + "/" + t_thumbnail);
			thumnailfos.write(data);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("예외발생:" + e.getMessage());
		}
		
	}
	
	return "redirect:/together/listTogether";
}
	
	//함께가요 목록
	@RequestMapping(value="/together/listTogether", method = RequestMethod.GET)
	public String listTogether(Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception{
		LOGGER.info("listTogether");
		//썸네일
//		model.addAttribute("listTogether", service.listThumbnail(scri));
//		model.addAttribute("listTogether", service.listThumbnail(scri));
//		System.out.println("썸네일" + service.listThumbnail(scri));
		
		model.addAttribute("listTogether",service.listTogether(scri));
		System.out.println("함께가요" + service.listTogether(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		model.addAttribute("pageMaker",pageMaker);
		
		return "/together/listTogether";
	}
	
	
	
	//함께가요 상세
//	@RequestMapping(value="detailTogether",method = {RequestMethod.GET , RequestMethod.POST})
	@RequestMapping(value="/together/detailTogether",method = RequestMethod.GET)
	public String detailTogether(TogetherVo togetherVo,@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		LOGGER.info("detailTogether");
		model.addAttribute("detailTogether",service.detailTogether(togetherVo.getT_num()));
		//값이 안가져와서 테스트해봄
		System.out.println(togetherVo.getT_num());
		//list에서 가져온 SearchCriteria값을 사용하기 위해 매개변수에 파라미터를 통해 값을 받고 model을 이용하여 scri를 보내준다.
		model.addAttribute("scri",scri);
		
		List<ReplyVo> replyList = Rservice.togetherReply(togetherVo.getT_num());
		model.addAttribute("replyList",replyList);
		return "together/detailTogether";
	}
	
	//함께가요 수정 뷰
	@RequestMapping(value="/together/updateTogetherView", method = RequestMethod.GET)
	public String updateTogetherView(TogetherVo togetherVo,@ModelAttribute("scri") SearchCriteria scri,Model model) throws Exception{
		LOGGER.info("updateTogether");
		model.addAttribute("updateTogether", service.detailTogether(togetherVo.getT_num()));
		model.addAttribute("scri",scri);
		System.out.println(togetherVo.getT_num());
		return "together/updateTogetherView";
	}
	
	//함께가요 수정
	@RequestMapping(value="/together/updateTogether",method = RequestMethod.POST)
	public String updateTogether(TogetherVo togetherVo,ThumbnailVo t,@ModelAttribute("scri") SearchCriteria scri,RedirectAttributes rttr,HttpServletRequest request) throws Exception{
		LOGGER.info("updateTogether");
		System.out.println("AAAAAAAAAAAAAAAAAAAAA" +t.getUp_thumbnailFile());
		
		//썸네일 파일을 수정할경우
		if(t.getUp_thumbnailFile() != null) {
			//첨부한 파일 불러옴
			System.out.println("썸네일 수정 함");
			MultipartFile thumbnailFile = t.getUp_thumbnailFile();
//			System.out.println("thumbnailFile  " + thumbnailFile);
			String t_thumbnail = thumbnailFile.getOriginalFilename();
//			System.out.println("t_thumbnail   " + t_thumbnail);
			togetherVo.setThumbnail(t_thumbnail);
//			System.out.println("togetherVo.setThumbnail   "+togetherVo.getThumbnail());
			
			int re = service.updateTogether(togetherVo);
			
			//썸네일 파일 업로드
			if(re>0) {
				try {
					
					String path = request.getRealPath("t_thumbnailUpload");
					System.out.println("path : " + path);
					
					byte[] data = thumbnailFile.getBytes();
					FileOutputStream thumnailfos = new FileOutputStream(path + "/" + t_thumbnail);
					thumnailfos.write(data);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println("예외발생:" + e.getMessage());
				}
				
			}
		}
		//썸네일 수정하지 않을경우
		else {
			System.out.println("원본 썸네일 " + togetherVo.getThumbnail());
			System.out.println("썸네일 수정 안함");
		}
		
		
		
		
		
		
		rttr.addAttribute("page",scri.getPage());
		rttr.addAttribute("perPageNum",scri.getPerPageNum());
		rttr.addAttribute("searchType",scri.getSearchType());
		rttr.addAttribute("keyword",scri.getKeyword());	
		
		return "redirect:/together/listTogether";
	}
	
	//함께가요 삭제
	@RequestMapping(value="/together/deleteTogether",method = RequestMethod.POST)
	public String deleteTogether(TogetherVo togetherVo,@ModelAttribute("scri") SearchCriteria scri , RedirectAttributes rttr) throws Exception{
		LOGGER.info("deleteTogether");
		Rservice.deleteAll(togetherVo);
		service.deleteTogether(togetherVo.getT_num());
		rttr.addAttribute("page",scri.getPage());
		rttr.addAttribute("perPageNum",scri.getPerPageNum());
		rttr.addAttribute("searchType",scri.getSearchType());
		rttr.addAttribute("keyword",scri.getKeyword());
		System.out.println(togetherVo.getT_num());
		return "redirect:/together/listTogether";
	}
	
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = "C:\\summernote_together_detail_image\\";	//저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
			jsonObject.addProperty("t_fname", savedFileName);
			jsonObject.addProperty("t_org_fname", originalFileName);
			
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject;
	}
	
	
	//썸네일 삭제
	
	//썸네일 수정
	
}