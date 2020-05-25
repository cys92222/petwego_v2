package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.LoginMapperDao;
import com.example.demo.service.FollowService;
import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.vo.FollowVo;
import com.example.demo.vo.MemberInfoVo;

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
	public String insert_follow(HttpServletRequest request,FollowVo f) {
		
		HttpSession session = request.getSession();
		Authentication authentication = (Authentication) session.getAttribute("user");
		MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());
		
		System.out.println("팔로우 컨트로러"+f);
//		f.setUser_id2(m.getUser_id());//팔로우한 아이디에 로그인한 아이디 설정
		followService.insert_follow(f);
		
		return "팔로잉 완료";
	}
	
	@NoLogging
	//맞팔로잉
	public String insert_follow2(FollowVo f) {
		
		
		return "팔로잉 완료";
	}
	
	//언팔로잉
	@NoLogging
	@RequestMapping("/follow/delete_follow")
	@ResponseBody
	public String delete_follow(HttpServletRequest request,FollowVo f) {
		HttpSession session = request.getSession();
		Authentication authentication = (Authentication) session.getAttribute("user");
		MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());
		
		System.out.println("언팔로잉"+f);
		f.setUser_id2(m.getUser_id());
		followService.delete_follow(f);
		
		return "팔로잉 취소 완료";
	}
}
