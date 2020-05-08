package com.example.demo.controller;


import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.service.TogetherService;
import com.example.demo.vo.Criteria;
import com.example.demo.vo.PageMaker;
import com.example.demo.vo.SearchCriteria;
import com.example.demo.vo.TogetherVo;
import com.google.gson.Gson;

@Controller
@RequestMapping("/together/*")
public class TogeteherController {
	private static final Logger LOGGER = LoggerFactory.getLogger(TogeteherController.class);
	
	@Autowired
	TogetherService service;
	
	//함께가요 글 작성 화면
	@RequestMapping(value="/together/writeTogetherView",method = RequestMethod.GET)
//	@RequestMapping(value="writeTogetherView",method = RequestMethod.GET)
	public void writeTogetherView() throws Exception{
		LOGGER.info("writeTogetherView");
	}
	
	//함께가요 글 작성
	@RequestMapping(value="/together/writeTogether",method = RequestMethod.POST)
//	@RequestMapping(value="writeTogether",method = {RequestMethod.GET,RequestMethod.POST})
	public String write(TogetherVo togetherVo) throws Exception{
		LOGGER.info("writeTogether");
		service.writeTogether(togetherVo);
		return "redirect:/together/listTogether";
	}
	
	//함께가요 목록
	@RequestMapping(value="/together/listTogether", method = RequestMethod.GET)
	public String listTogether(Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception{
		LOGGER.info("listTogether");
		
		model.addAttribute("listTogether",service.listTogether(scri));
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
		return "/together/detailTogether";
	}
	
	//함께가요 수정 뷰
	@RequestMapping(value="/together/updateTogetherView", method = RequestMethod.GET)
	public String updateTogetherView(TogetherVo togetherVo,@ModelAttribute("scri") SearchCriteria scri,Model model) throws Exception{
		LOGGER.info("updateTogetherView");
		model.addAttribute("updateTogether", service.detailTogether(togetherVo.getT_num()));
		model.addAttribute("scri",scri);
		System.out.println(togetherVo.getT_num());
		return "/together/updateTogetherView";
	}
	
	//함께가요 수정
	@RequestMapping(value="/together/updateTogether",method = RequestMethod.POST)
	public String updateTogether(TogetherVo togetherVo,@ModelAttribute("scri") SearchCriteria scri,RedirectAttributes rttr) throws Exception{
		LOGGER.info("updateTogether");
		service.updateTogether(togetherVo);
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
		service.deleteTogether(togetherVo.getT_num());
		rttr.addAttribute("page",scri.getPage());
		rttr.addAttribute("perPageNum",scri.getPerPageNum());
		rttr.addAttribute("searchType",scri.getSearchType());
		rttr.addAttribute("keyword",scri.getKeyword());
		System.out.println(togetherVo.getT_num());
		return "redirect:/together/listTogether";
	}
}
