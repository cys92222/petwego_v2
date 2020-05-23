package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.FollowService;
import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.vo.FollowVo;

@Controller
public class FollowController {
	
	@Autowired
	FollowService followService;
	
	//팔로잉
	@NoLogging
	@RequestMapping("/follow/insert_follow")
	@ResponseBody
	public String insert_follow(FollowVo f) {
		System.out.println("팔로우 컨트로러"+f);
		f.setUser_id2("로그인한 아이디로 변경해야됨");
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
	public String delete_follow(FollowVo f) {
		System.out.println("언팔로잉"+f);
		f.setUser_id2("로그인한 아이디로 변경해야됨");
		followService.delete_follow(f);
		
		return "팔로잉 취소 완료";
	}
}
