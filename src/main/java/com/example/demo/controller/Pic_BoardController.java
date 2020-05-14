package com.example.demo.controller;

import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.service.Pic_BoardService;
import com.example.demo.util.Criteria;
import com.example.demo.util.PageMaker;
import com.example.demo.vo.Pic_BoardVo;
import com.example.demo.vo.Pic_Board_FileVo;
import com.google.gson.Gson;

//봉현) 5/12
@RestController
public class Pic_BoardController {
	@Autowired
	Pic_BoardService pic_boardService;
	
	//자신이 등록한 모든사진
	@RequestMapping(value="/pic_board/list",method = RequestMethod.GET)
	public ModelAndView listAll(Criteria cri) throws Exception {	
		ModelAndView mav = new ModelAndView();
		List<Pic_Board_FileVo> list_file = pic_boardService.listFile();
		
		List<Pic_BoardVo> list_board = pic_boardService.listPic_Board(cri);
		
		String str_file = "";
		String str_board = "";
		
		Gson gson = new Gson();
		mav.addObject("listAll",gson.toJson(pic_boardService.listPic_Board(cri)));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(pic_boardService.listCount());
		mav.addObject("pageMaker",pageMaker);
		mav.setViewName("/pic_board/list");
		return mav;
	}
	
	//sns 글 등록 폼
	@RequestMapping("/pic_board/insertsnsform")
	public ModelAndView insertform() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/pic_board/insert");
		return mav;
	}
	

	@RequestMapping("/pic_board/insert")
	public ModelAndView insertsns(Pic_BoardVo pb, Pic_Board_FileVo pbf,MultipartFile multipartFile, HttpServletRequest request, Criteria cri) throws Exception {
		int re = -1;
		re = pic_boardService.insertPic_Board(pb); //sns글등록
		System.out.println("마지막 글번호:" + pic_boardService.photo_no());
		pbf.setPhoto_no(pic_boardService.photo_no());
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
		re = pic_boardService.insertfile(pbf);
		ModelAndView mav = new ModelAndView();
	
		Gson gson = new Gson();
		String str_file = "";
		str_file = gson.toJson(pic_boardService.listFile());
		
		String str_board = "";
		
		str_board = gson.toJson(pic_boardService.listPic_Board(cri));
		
		mav.addObject("file", str_file);
		mav.addObject("board", str_board);
		mav.setViewName("/pic_board/list");
		return mav;
	}
	
	//좋아요
	
	//좋아요 수
	
	//sns수정
//	@GetMapping("/sns/updatesns")
//	public void updateForm(Pic_BoardVo pb ) {
//		model.addAttribute("up",snsService.detailBoard());
//	}
	
	
	//sns 글 삭제
	@RequestMapping("/pic_board/delete")
	public void deletePic_Board(Pic_BoardVo pb) {
		pic_boardService.deletePic_Board(pb);
	}
	
	
		//첨부파일 먼저 삭제
	
		
		//댓글 먼저 삭제 
	
	
	
	
	//상세보기
	@GetMapping("/pic_board/detail")
	public ModelAndView detail(Pic_BoardVo pb,Pic_Board_FileVo pbf) {		
		ModelAndView mav = new ModelAndView();
		mav.addObject("Board", pic_boardService.detailBoard(pb.getPhoto_no()));
		mav.addObject("file", pic_boardService.detailFile(pbf));
		mav.setViewName("/pic_board/detail");
		
		return mav;
	}
}
