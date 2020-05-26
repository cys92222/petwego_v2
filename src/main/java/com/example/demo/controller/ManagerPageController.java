package com.example.demo.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;


import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.ManagerPageService;


import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.vo.ChartVo;
import com.example.demo.vo.MemberInfoVo;
import com.example.demo.vo.NoticeVo;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

// 민아) 5/19, HttpServletRequest request 이랑 @NoLogging 처리 
// 민아) 5/19, 관리자페이지 하는중 
// log 기록이 필요없는 관리자 페이지 등은 매개변수로 HttpServletRequest request 을 가질필요가 없고
// 제외 처리를 위해 @NoLogging을 꼭 적어야 함! 
@Controller
@RequestMapping("/management/*")
public class ManagerPageController {

	@Autowired
	private ManagerPageService mp_service;

	// 공지사항 목록
	@GetMapping("listNotice")
	@NoLogging
	public void listNotice(Model model) {
		model.addAttribute("listNotice", mp_service.listNotice());
	}

	// 공지사항 등록 폼
	@NoLogging
	@GetMapping("/insertNotice")
	public String insertNotice_form(NoticeVo nv, Model model) {
		//mp_service.insertNotice(nv);
		return "management/insertNotice";
	}
	
	// 공지사항 등록
	@NoLogging
	@RequestMapping(value = "/insertNotice", method = RequestMethod.POST)
	@ResponseBody
	public String insertNotice(NoticeVo nv, Model model) {
		System.out.println(nv);
		mp_service.insertNotice(nv);
		
		return "ok";
	}

	// 공지사항 상세
	@NoLogging
	@GetMapping("/detailNotice")
	public void detailNotice(NoticeVo nv, Model model) {
		// 관리자페이지에서는 공지사항 조회수가 올라갈 필요가 없음
		model.addAttribute("detailNotice", mp_service.detailNotice(nv));
	}

	// 공지사항 수정
	@NoLogging
	@GetMapping(value = "/updateNotice")
	public void updateNotice(NoticeVo nv, Model model) {
		model.addAttribute("up", mp_service.detailNotice(nv));
	}

	@NoLogging
	@PostMapping(value = "/updateNotice")
	@ResponseBody
	public String updateNoticeSubmit(NoticeVo nv, Model model) {

		mp_service.updateNotice(nv);

		// 수정할 글의 번호가 넘어가야함
		model.addAttribute("notice_no", nv.getNotice_no());

		return nv.getNotice_no() + "";
	}

	// 공지사항 삭제
	@NoLogging
	@GetMapping("/deleteNotice")
	public ModelAndView deleteNotice(NoticeVo nv) {
		ModelAndView mav = new ModelAndView("redirect:/management/listNotice");
		mp_service.deleteNotice(nv);
		return mav;
	}

	// 관리자페이지메인
	@RequestMapping("manager_main")
	@NoLogging
	public void managerPage(Model model) {
		model.addAttribute("newM", mp_service.newMember());
		model.addAttribute("newP", mp_service.newPay());
		model.addAttribute("newT", mp_service.newTogether());
	}

	// 로그 차트 (구글차트 이용해서)
	@NoLogging
	@ResponseBody
	@GetMapping(value = "chartLog", produces = "application/json; charset=utf-8")
	public String chartLog() {
		List<ChartVo> chartLog = mp_service.chartLog();
		Gson gson = new Gson();
		// System.out.println("로그차트 동작");
		// System.out.println(chartLog);
		return gson.toJson(chartLog);
	}

	// 회원 목록
	@NoLogging
	@GetMapping("member_list")
	public void listMember(Model model) {

		model.addAttribute("listMember", mp_service.listMember());
	}

	// 회원정보 상세보기
	@NoLogging
	@GetMapping("member_get")
	public void getMember(MemberInfoVo m, Model model) {
		model.addAttribute("detail_Info", mp_service.getMember(m));
	}

	// 회원정보 삭제(강퇴)
	@NoLogging
	@GetMapping("member_delete")
	public String deleteMember(MemberInfoVo m) {

		mp_service.deleteMember(m);
		return "redirect:/management/member_list";
	}

	// aopLog 목록
	@NoLogging
	@GetMapping("listLog")
	public void listLog(Model model) {
		model.addAttribute("listLog", mp_service.listLog());
	}

	// 써머노트
	@NoLogging
	@PostMapping(value = "/uploadNotice", produces = "application/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {

		JsonObject jsonObject = new JsonObject();

		String fileRoot = "C:\\summernote_image\\"; // 저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자

		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

		File targetFile = new File(fileRoot + savedFileName);

		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			jsonObject.addProperty("url", "/summernoteImage/" + savedFileName);
			jsonObject.addProperty("responseCode", "success");

		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}

		return jsonObject;
	}
}
