package com.example.demo.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.service.BoardService;
import com.example.demo.service.Board_CommentService;
import com.example.demo.service.Board_fileService;
import com.example.demo.vo.BoardVo;
import com.example.demo.vo.Board_CommentVo;
import com.example.demo.vo.Board_fileVo;
import com.example.demo.util.Criteria;
import com.example.demo.util.PageMaker;
import com.example.demo.util.SearchCriteria;
import com.google.gson.JsonObject;

import lombok.AllArgsConstructor;

// 민아) 5월9일, service 방식으로 새로 시작

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger LOGGER = LoggerFactory.getLogger(BoardController.class);

	String savedFile;

	// dao대신 서비스와 의존관계 설정, setter를 만들어야 하는건지는 잘 모르겠음.
	@Autowired
	private BoardService service;

	public void setService(BoardService service) {
		this.service = service;
	}

	Board_fileService bfservice;

	@Autowired
	private Board_fileService bf_service;

	public void setBf_service(Board_fileService bf_service) {
		this.bf_service = bf_service;
	}

	@Autowired
	private Board_CommentService comm_service;

	public void setComm_service(Board_CommentService comm_service) {
		this.comm_service = comm_service;
	}

	// 게시물 목록, 검색, 페이징
	@GetMapping("/list")
	public void listBoard(Model model, @ModelAttribute("scri") SearchCriteria scri) {

		LOGGER.info("list");
		model.addAttribute("listBoard", service.listBoard(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.boardCount(scri));
		model.addAttribute("pageMaker", pageMaker);
	}

	// 게시물 등록
	@GetMapping(value = "/insert")
	public void insertForm(Model model, @RequestParam(value = "board_no", defaultValue = "0") int board_no) {
		model.addAttribute("no", board_no);
	}

	@PostMapping(value = "/insert")
	public ModelAndView insertSubmit(BoardVo b, Board_fileVo bf) {
		ModelAndView mav = new ModelAndView("redirect:/board/list");
		service.insertBoard(b);
		// 게시물 등록시 이미지파일은 따로 파일 테이블에 저장
		// 이미지파일이 없으면 파일테이블에 저장 안됨!
		if (!bf.getFile_name().equals("")) {
			bf.setBoard_no(service.lastBoard());
			System.out.println("마지막 글번호" + service.lastBoard());
			// service.insert(bf);
			bf_service.insert(bf);
		}
		return mav;
	}

	// 게시물 상세보기
	@GetMapping("/get")
	public void getBoard(BoardVo b, Model model) {
		service.updateHit(b.getBoard_no()); // 게시물 조회수 증가
		model.addAttribute("detail", service.getBoard(b));

		// 댓글목록, 컨트롤러 따로 만들었음
//		List<Board_CommentVo> listComment = comm_service.listComment(b.getBoard_no());
//		model.addAttribute("listComment", listComment);
	}

	// 게시글 수정
	@GetMapping(value = "/update")
	public void updateForm(BoardVo b, Model model) {
		model.addAttribute("up", service.getBoard(b));
	}

	@PostMapping(value = "/update")
	public ModelAndView updateSubmit(BoardVo b, Board_fileVo bf) {
		ModelAndView mav = new ModelAndView("redirect:/board/list");

		service.updateBoard(b);
		System.out.println(bf.getFile_name());

		// 글만 있는데 수정시 사진을 추가할때, 추가한 사진이 board_file에 insert 되도록! 
		if (!b.getBoard_content().equals("")) {
			if (!bf.getFile_name().equals("")) {
				bf_service.insert(bf);
			}
		}

		// 게시글 수정시, 원래는 이미지가 있었는데 사진을 변경하거나 사진을 지우고 텍스트로만 글을쓰면
		// board_file테이블에 있던 사진정보를 update해줌
		if (bf.getFile_name().equals("")) {
			bf_service.delbord_no(bf.getBoard_no());
		} else {
			bf_service.updateFile(bf);
		}

		return mav;
	}

	// 게시글 삭제
	@GetMapping("/delete")
	public ModelAndView deleteSubmit(BoardVo b, Board_CommentVo bc, Board_fileVo bf) {
		ModelAndView mav = new ModelAndView("redirect:/board/list");

		// 첨부파일이 있는 글이라면, 첨부파일 먼저 지워줘!
		bf_service.delbord_no(bf.getBoard_no());

		// 댓글달린 글이라면 댓글 먼저 지우고 게시글을 지워줘!
		comm_service.deleteComment(bc); // where comm_num = #{comm_num}
		comm_service.deleteCommBoard(bc); // where board_no = #{board_no}
		service.deleteBoard(b);

		return mav;
	}

	// summernote 사진업로드
	@PostMapping(value = "/boardUpload", produces = "application/json;charset=utf-8")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {

		JsonObject jsonObject = new JsonObject();

		String fileRoot = "C:\\summernote_image\\"; // 저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자

		// UUID란 데이터를 고유하게 식별하는데 사용되는 16바이트 길이의 랜덤한 숫자
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

		savedFile = savedFileName;
		File targetFile = new File(fileRoot + savedFileName);

		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			jsonObject.addProperty("url", "/summernoteImage/" + savedFileName);
			jsonObject.addProperty("responseCode", "success");

			// 서머노트에서 이미지업로드시, 파일테이블에 저장되도록 데이터를 전송한다.
			jsonObject.addProperty("originalFileName", originalFileName); // 실제 파일 이름
			jsonObject.addProperty("fileRoot", fileRoot); // 파일 저장 경로
			jsonObject.addProperty("savedFileName", savedFileName); // uuid

		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}

		return jsonObject;
	}

}