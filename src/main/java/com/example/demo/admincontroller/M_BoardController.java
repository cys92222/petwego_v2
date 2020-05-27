package com.example.demo.admincontroller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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
import com.example.demo.vo.AlarmVo;
import com.example.demo.vo.BoardVo;
import com.example.demo.vo.Board_CommentVo;
import com.example.demo.vo.ChartVo;
import com.example.demo.vo.MemberInfoVo;
import com.example.demo.vo.NoticeVo;
import com.example.demo.vo.QnAVo;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("/management/*")
public class M_BoardController {

	@Autowired
	private ManagerPageService mp_service;

	
	// 자유게시판 - 댓글목록
	@NoLogging
	@GetMapping(value = "/freeBoard/listComment", produces = "application/json; charset=utf-8")
	public String listComment(Board_CommentVo bc) {
		List<Board_CommentVo> listComment = mp_service.listComment();
		Gson gson = new Gson();
		return gson.toJson(listComment);
	}

	// 자유게시판 - 댓글만 삭제
	@NoLogging
	@GetMapping(value = "/freeBoard/commDeleteSubmit")
	public String commDeleteSubmit(Board_CommentVo bc) {
		mp_service.deleteComment(bc);// where comm_num = #{comm_num}
		return "redirect:/freeBoard/detailBoard";
	}

	// 자유게시판 목록
	@NoLogging
	@GetMapping("/freeBoard/listBoard")
	public void listBoard(Model model) {
		model.addAttribute("listBoard", mp_service.listBoard());
	}

	// 자유게시판 상세
	@NoLogging
	@GetMapping("/freeBoard/detailBoard")
	public void detaiBoard(BoardVo b, Model model) {
		model.addAttribute("detailBoard", mp_service.detailBoard(b));
	}

	// 자유게시판 삭제
	@NoLogging
	@GetMapping("/freeBoard/deleteBoard")
	public ModelAndView deleteBoard(BoardVo b, Board_CommentVo bc) {
		ModelAndView mav = new ModelAndView("redirect:/management/freeBoard/listBoard");
		
		//댓글, 사진 지우고 게시글 지워줘
		mp_service.deleteCommBoard(bc);
		mp_service.deleteBoard(b);
		return mav;
	}

	// 공지사항 목록
	@GetMapping("/notice/listNotice")
	@NoLogging
	public void listNotice(Model model) {
		model.addAttribute("listNotice", mp_service.listNotice());
	}

	// 공지사항 등록 폼
	@NoLogging
	@GetMapping("/notice/insertNotice")
	public String insertNotice_form(NoticeVo nv, Model model) {
//		System.out.println("공지사항 폼 컨틀로러 동작");
		return "management/notice/insertNotice";
	}

	// 공지사항 등록
	@NoLogging
	@RequestMapping(value = "/notice/insertNotice", method = RequestMethod.POST)
	@ResponseBody
	public String insertNotice(NoticeVo nv, Model model) {
//		System.out.println("공지사항 등록 컨트롤러 동작");
//		System.out.println(nv);
		mp_service.insertNotice(nv);
		return "ok";
	}

	// 공지사항 상세
	@NoLogging
	@GetMapping("/notice/detailNotice")
	public void detailNotice(NoticeVo nv, Model model) {
		// 관리자페이지에서는 공지사항 조회수가 올라갈 필요가 없음
		model.addAttribute("detailNotice", mp_service.detailNotice(nv));
	}

	// 공지사항 수정
	@NoLogging
	@GetMapping(value = "/notice/updateNotice")
	public void updateNotice(NoticeVo nv, Model model) {
		model.addAttribute("up", mp_service.detailNotice(nv));
	}

	@NoLogging
	@PostMapping(value = "/notice/updateNotice")
	@ResponseBody
	public String updateNoticeSubmit(NoticeVo nv, Model model) {
		System.out.println("NoticeVo nv " + nv);
		mp_service.updateNotice(nv);

		// 수정할 글의 번호가 넘어가야함
		model.addAttribute("notice_no", nv.getNotice_no());

//		return nv.getNotice_no() + "";
		return "redirect:/management/notice/detailNotice?notice_no=" + nv.getNotice_no();
	}

	// 공지사항 삭제
	@NoLogging
	@GetMapping("/notice/deleteNotice")
	public ModelAndView deleteNotice(NoticeVo nv) {
		ModelAndView mav = new ModelAndView("redirect:/management/notice/listNotice");
		mp_service.deleteNotice(nv);
		return mav;
	}

	// 써머노트
	@NoLogging
	@PostMapping(value = "/notice/uploadNotice", produces = "application/json")
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

	// QnA리스트
	@NoLogging
	@RequestMapping(value = "/qna/listQnA")
	public void listQnA(Model model) {
		model.addAttribute("listQnA", mp_service.listQnA());
	}

	// QnA상세
	@NoLogging
	@RequestMapping(value = "qna/detailQnA")
	public String detailQnA(QnAVo q, Model model) {
		QnAVo detail = mp_service.detailQnA(q);
		model.addAttribute("detailQnA", detail);

		return "/management/qna/detailQnA";
	}

	
	//답변달기
	@NoLogging
	@RequestMapping(value = "qna/anwerQnA")
	public String anwerQnA(QnAVo q,int a_ref, int a_ref_step, int a_ref_level) {
		q.setRef(a_ref);
		q.setRef_step(a_ref_step+1);
		q.setRef_level(a_ref_level+1);
		q.setUser_id("manager");
		System.out.println("답변 정보 " + q);
		
		mp_service.anwerQnA(q);
		System.out.println("답변드으록");
		return "redirect:/management/qna/listQnA";
	}

}
