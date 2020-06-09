package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.annotation.Repeatable;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.dao.LoginMapperDao;
import com.example.demo.service.AlarmService;
import com.example.demo.service.ApplicationService;
import com.example.demo.service.ReplyService;
import com.example.demo.service.TogetherService;
import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.util.Criteria;
import com.example.demo.util.PageMaker;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.AlarmVo;
import com.example.demo.vo.Animal_infoVo;
import com.example.demo.vo.ApplicationVo;
import com.example.demo.vo.MemberInfoVo;
import com.example.demo.vo.ReplyVo;
import com.example.demo.vo.ThumbnailVo;
import com.example.demo.vo.TogetherVo;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

// 민아) 5/21, 로그 처리 
@Controller
@RequestMapping("/together/*")
public class TogeteherController {
	private static final Logger LOGGER = LoggerFactory.getLogger(TogeteherController.class);
	
	@Autowired
	TogetherService service;
	
	@Autowired
	ReplyService Rservice;
	
	@Autowired
	ApplicationService Aservice;
	
	@Autowired
	AlarmService alarmService;
	
	@Autowired
	LoginMapperDao loginMapperDao;

	
	//함께가요 신청자 목록에서 그 사람 반려동물 정보 보기
	@RequestMapping("chk_animal_list")
	@ResponseBody
	@NoLogging
	public List<Animal_infoVo> chk_animal_list(String user_id,Model model) {
		System.out.println("chk_animal_list 컨트롤러");
		List<Animal_infoVo> alist = service.chk_animal_list(user_id);
		model.addAttribute("alist", alist);
		return alist;
	}
	
	//댓글삭제 POST
	@RequestMapping(value="/deleteReply",method = RequestMethod.GET)
	public String replyDelete(HttpServletRequest request, ReplyVo rv,SearchCriteria scri, RedirectAttributes rttr) throws Exception {
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
	@NoLogging
	@RequestMapping(value="/updateReplyView",method = RequestMethod.GET)
	public String updateReplyView(ReplyVo rv, SearchCriteria scri, Model model) throws Exception {
		LOGGER.info("writeReply");
		
		model.addAttribute("updateReply",Rservice.selectReply(rv.getT_r_num()));
		System.out.println(rv.getT_r_num());
		System.out.println(rv.getT_r_content());
		model.addAttribute("scri",scri);
		
		return "together/updateReplyView";
	}
	
	//댓글수정 POST
	//댓글 수정 페이지에 접근하기 위한 컨트롤러와 수정한 값을 전송할 수 있는 컨트롤러를 작성
	@RequestMapping(value="/updateReply",method = RequestMethod.POST)
	public String updateReply(HttpServletRequest request,ReplyVo rv, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		LOGGER.info("writeReply");
		
		Rservice.updateReply(rv);
	
		
		rttr.addAttribute("t_num",rv.getT_num());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/together/detailTogether";
	}
	

	@RequestMapping(value="writeReply", method = RequestMethod.GET)
	@ResponseBody
	//파라미터로 ReplyVO, SearchCriteria, RedirectAttributes를 넣는다.
	//ReplyVO는 댓글 작성하기위한 데이터, SearchCriteria는 readView에 있던 page, perPageNum, searchType, keyword값을 받아오기 위한것.
	//RedirectAttributes는 redirect했을때 값들을 물고 이동.
	//그래서 SearchCriteria의 값을
	//넣어서 댓글을 저장 한 뒤 원래 페이지로 redirect하여 이동
	public String writeReply(HttpServletRequest request,String c_user_id,ReplyVo rv, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		LOGGER.info("writeReply");
		rv.setUser_id(c_user_id);
		
		System.out.println("댓글작성 rv.setUser_id(c_user_id)" + c_user_id);
		Rservice.writeReply(rv);
		rttr.addAttribute("t_num",rv.getT_num());
		rttr.addAttribute("page",scri.getPage());
		rttr.addAttribute("perPageNum",scri.getPerPageNum());
		rttr.addAttribute("searchType",scri.getSearchType());
		rttr.addAttribute("keyword",scri.getKeyword());
		
		return "redirect:/together/detailTogether?user_id="+c_user_id;
	}
	
	//함께가요 글 작성 화면
	@NoLogging
	@RequestMapping(value="/writeTogetherView",method = RequestMethod.GET)
//	@RequestMapping(value="writeTogetherView",method = RequestMethod.GET)
	public void writeTogetherView() throws Exception{
		LOGGER.info("writeTogetherView");
	}

	
	//함께가요 등록
	@RequestMapping(value="/writeTogether",method = RequestMethod.POST)
	public String write(HttpServletRequest request,TogetherVo togetherVo ,HttpSession session) throws Exception{
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
	ApplicationVo av = new ApplicationVo();
	av.setUser_id(togetherVo.getUser_id());
	av.setT_num(service.last_no());
	Aservice.insertApplication(av);
	
	return "redirect:/together/listTogether";
}
	
	//함께가요 목록
	@RequestMapping(value="/listTogether", method = RequestMethod.GET)
	public String listTogether(HttpServletRequest request, Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception{
		LOGGER.info("listTogether");
		
		model.addAttribute("listTogether",service.listTogether(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		model.addAttribute("pageMaker",pageMaker);
		
		return "/together/listTogether";
	}
	
	
	
	   //함께가요 상세
  @RequestMapping(value="/detailTogether",method = RequestMethod.GET)
  public String detailTogether(HttpServletRequest request, TogetherVo togetherVo,ApplicationVo applicationVo,@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
     LOGGER.info("detailTogether");
     HttpSession session = request.getSession();
     Authentication authentication = (Authentication) session.getAttribute("user");
     MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();
     MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());

     togetherVo.setUser_id(m.getUser_id());
     
     //함께가요 작성자가 상세보기하면 알람 확인해서 알람 안가게
     //로그인되면 로그인 아이디로 셋팅
     AlarmVo alarm = new AlarmVo();
     alarm.setUser_id(togetherVo.getUser_id());
     System.out.println("상세togetherVo.getUser_id()" + togetherVo.getUser_id());
     alarm.setT_num(togetherVo.getT_num());
     System.out.println("상세togetherVo.getT_num()" + togetherVo.getT_num());
     alarmService.chk_together_alarm(alarm);
     
     model.addAttribute("detailTogether",service.detailTogether(togetherVo.getT_num()));
     //값이 안가져와서 테스트해봄

     //list에서 가져온 SearchCriteria값을 사용하기 위해 매개변수에 파라미터를 통해 값을 받고 model을 이용하여 scri를 보내준다.
     model.addAttribute("scri",scri);
     
     //신청자 목록
     List<ApplicationVo> userList = Aservice.userApplication(applicationVo.getT_num());
     System.out.println("ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇ" + applicationVo.getUser_id());
     for(ApplicationVo av : userList) {
    	 
     }
     
     
     Gson gson = new Gson();
     String g_userList = gson.toJson(userList);
     model.addAttribute("g_userList", g_userList);
     
     model.addAttribute("userList",userList);
     
     //댓글목록
     List<ReplyVo> replyList = Rservice.togetherReply(togetherVo.getT_num());
     
     //비밀댓글일 경우
     for(ReplyVo rv : replyList) {

     }   

     
     model.addAttribute("replyList",replyList);
     return "together/detailTogether";
  }
	
	//함께가요 수정 뷰
  	@NoLogging
	@RequestMapping(value="/updateTogetherView", method = RequestMethod.GET)
	public String updateTogetherView(TogetherVo togetherVo,@ModelAttribute("scri") SearchCriteria scri,Model model) throws Exception{
		LOGGER.info("updateTogether");
		model.addAttribute("updateTogether", service.detailTogether(togetherVo.getT_num()));
		model.addAttribute("scri",scri);
		System.out.println(togetherVo.getT_num());
		return "together/updateTogetherView";
	}
	
	//함께가요 수정
	@RequestMapping(value="/updateTogether",method = RequestMethod.POST)
	public String updateTogether(HttpServletRequest request,TogetherVo togetherVo,ThumbnailVo t,@ModelAttribute("scri") SearchCriteria scri,RedirectAttributes rttr) throws Exception{
		LOGGER.info("updateTogether");
		System.out.println("bbbbbbbbbbbbbbbbbbb" +t.getUp_thumbnailFile());
		
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
			service.updateTogether(togetherVo);
		}
		
		
		rttr.addAttribute("page",scri.getPage());
		rttr.addAttribute("perPageNum",scri.getPerPageNum());
		rttr.addAttribute("searchType",scri.getSearchType());
		rttr.addAttribute("keyword",scri.getKeyword());	
		
		return "redirect:/together/listTogether";
	}
	
	//함께가요 삭제
	@RequestMapping(value="/deleteTogether",method = RequestMethod.POST)
	public String deleteTogether(HttpServletRequest request, TogetherVo togetherVo,@ModelAttribute("scri") SearchCriteria scri , RedirectAttributes rttr,String in_user_id) throws Exception{
		LOGGER.info("deleteTogether");
		System.out.println(togetherVo);
		//알람 삭제
		AlarmVo alarm = new AlarmVo();
		alarm.setUser_id(in_user_id);
		//함께가요 글 번호로 셋팅
		alarm.setT_num(togetherVo.getT_num());
		alarmService.delete_together_alarm(alarm);
		
		//댓글 삭제
		Rservice.deleteAll(togetherVo);
		
		//함께가요  삭제
		ApplicationVo applicationVo = new ApplicationVo();
//		applicationVo.setUser_id(in_user_id);
		applicationVo.setT_num(togetherVo.getT_num());
		alarmService.delete_application(applicationVo);
		
		
		service.deleteTogether(togetherVo.getT_num());
		rttr.addAttribute("page",scri.getPage());
		rttr.addAttribute("perPageNum",scri.getPerPageNum());
		rttr.addAttribute("searchType",scri.getSearchType());
		rttr.addAttribute("keyword",scri.getKeyword());
		System.out.println(togetherVo.getT_num());
		return "redirect:/together/listTogether";
	}
	
	@NoLogging
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
	
	//신청하기 누른적이 있는지 판단
	@NoLogging
	@GetMapping("/okApplication")
	@ResponseBody
	public String checkApplication(ApplicationVo av) {
		String re = "0";
		System.out.println("신청한 아이디 " + av.getUser_id());
		int t_attendee_cnt = Aservice.checkApplication(av);
		if ( t_attendee_cnt > 0) {
			re = "1";
		}
		return re;
	}
	
	//신청하기 
	@GetMapping("/insertApplication")
	@ResponseBody
	public String insertApplication(HttpServletRequest request,ApplicationVo av, TogetherVo togetherVo,String in_user_id) {
		av.setUser_id(in_user_id);
		//		System.out.println("신청한 아이딤ㅁㅁㅁㅁㅁㅁㅁㅁ"+av.getUser_id());
		int re = Aservice.checkApplication(av);
		
		
		int totalCnt = togetherVo.getT_size();
		int attendeeCnt = togetherVo.getT_attendee_cnt();
		
		String str = "";
		
		if(re > 0) {
			str = "이미 신청하셨습니다";
		}else if(attendeeCnt == totalCnt) {
			str = "이미 마감되었습니다.";
		}else{
			Aservice.insertApplication(av);
			
			//신청 알람 등록
			//함께가요 원본글 작성자 id
			String to_id = service.select_together_id(av.getT_num());
			AlarmVo alarm = new AlarmVo();
			alarm.setUser_id(to_id);
			System.out.println("alarm.setUser_id(to_id)" + to_id);
			alarm.setIn_user_id(in_user_id);
			System.out.println("alarm.setIn_user_id(in_user_id) "+ in_user_id);
			alarm.setT_num(av.getT_num());
			System.out.println("alarm.setT_num(av.getT_num() " + av.getT_num());
			int result = alarmService.insert_together_alarm(alarm);
			System.out.println(result);
			if(result > 0) {
				System.out.println("알람등록");
			}else {
				System.out.println("알람등록 실패");
			}
			str = "신청하기 완료";
		}
		System.out.println(str);
		return str;
	}  
	
	//신청하기 취소
	@GetMapping("/deleteApplication")
	@ResponseBody
	public String deleteApplication(HttpServletRequest request,ApplicationVo av,String in_user_id) {
		System.out.println(in_user_id);
		String re = "0";

		String str = alarmService.together_id(av);
		AlarmVo alarm = new AlarmVo();
		alarm.setUser_id(str);
		alarm.setIn_user_id(in_user_id);
		//함께가요 글 번호 
		alarm.setT_num(av.getT_num());
		alarmService.cancle_insert_together_alarm(alarm);
		av.setUser_id(in_user_id);
		int r = Aservice.deleteApplication(av);
		if (r > 0) {
			re = "1";
		}

		return re;
	}
	
}