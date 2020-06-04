package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.LoginMapperDao;
import com.example.demo.service.FollowService;
import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.vo.FollowVo;
import com.example.demo.vo.MemberInfoVo;
import com.google.gson.Gson;

@Controller
public class FollowController {
	
	@Autowired
	FollowService followService;
	
	@Autowired
	LoginMapperDao loginMapperDao;

	
	//팔로잉
	@NoLogging
	@RequestMapping("/follow/insert_follow")
	@ResponseBody
	public String insert_follow(HttpServletRequest request,FollowVo f,String in_user_id, String user_id2) {
		f.setUser_id(user_id2);
		System.out.println("팔로우 컨트로러"+f);
		System.out.println("팔로우할 아이디 "+f.getUser_id());
		f.setUser_id2(in_user_id);//팔로우한 아이디에 로그인한 아이디 설정
		followService.insert_follow(f);
		
		return "팔로잉 완료";
	}
	
	@NoLogging
	@RequestMapping(value = "/follow/insert_follow2")
	//맞팔로잉
	public String insert_follow2(FollowVo f) {
		
		followService.insert_follow2(f);
	
		return "redirect:/follow/search_follow?user_id="+f.getUser_id2();
	}
	
	//언팔로잉
	@NoLogging
	@RequestMapping("/follow/delete_follow")
	@ResponseBody
	public String delete_follow(HttpServletRequest request,FollowVo f,String in_user_id) {
		
		
		System.out.println("언팔로잉"+f);
		
		followService.delete_follow(f);
		
		return "팔로잉 취소 완료";
	}
	
//	@NoLogging
//	@RequestMapping(value = "/follow/search_follow")
//	//나를 팔로우한 유저 목록
//	public ModelAndView followList(FollowVo f){
//		List<FollowVo> list = followService.search_follow(f);
//		System.out.println(list);
//		ModelAndView mav = new ModelAndView();
//		Gson gson = new Gson();
//		String str = gson.toJson(list);
//		mav.addObject("followList2", str);
//		mav.addObject("followList", list);
//		
//		f.setUser_id2(f.getUser_id());
//		mav.addObject("count", followService.search_following(f));
//		mav.setViewName("/pic_board/followList2");
//		return mav;
//		 
//	}
//	@NoLogging
//	@RequestMapping(value = "/pic_board/detail")
//	//나를 팔로우한 유저 목록
//	public ModelAndView followList(FollowVo f){
//		List<FollowVo> list = followService.search_follow(f);
//		System.out.println(list);
//		ModelAndView mav = new ModelAndView();
//		Gson gson = new Gson();
//		String str = gson.toJson(list);
//		mav.addObject("followList2", str);
//		mav.addObject("followList", list);
//		
//		f.setUser_id2(f.getUser_id());
//		mav.addObject("count", followService.search_following(f));
//		mav.setViewName("/pic_board/followList2");
//		return mav;
//		 
//	}
}
