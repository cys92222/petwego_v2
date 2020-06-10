package com.example.demo.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.service.MypageService;
import com.example.demo.service.SecurityService;
import com.example.demo.util.AopLog.NoLogging;
//import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.vo.MemberInfoVo;

@Controller
public class LoginController {
   
   //Logger 기록 남길 때 사용
   
   @Autowired
   SecurityService securityService;
   
   @Autowired
   PasswordEncoder passwordEncoder;
   
   @Autowired
   MypageService ms;
   
   private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

  
   //로그인
   @NoLogging
   @RequestMapping(value="/login/login")
   public ModelAndView login(HttpServletRequest request, @RequestParam(value="msg", required=false) String msg) throws Exception {
      ModelAndView mav = new ModelAndView();
      mav.addObject("msg", msg);
      mav.setViewName("/login/login");
	// 예약 내역 24시간 지나면 예약취소로 바꿈
	ms.cancle_reservation();
//	System.out.println("예약 내역 24시간 지나면 예약취소로 바꿈 컨트롤러 동작");
      
      return mav;
   }

   
   //로그아웃
   @NoLogging
   @RequestMapping("/login/logout")
   public String logout(HttpServletRequest request) {
      return "/login/logout";
   }
 
   //로그아웃
   @NoLogging
   @RequestMapping(value = "/login/logout", method = RequestMethod.POST) 
   public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception { 
      Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
      if (auth != null){ 
         new SecurityContextLogoutHandler()
            .logout(request, response, auth); 
      } 
      return "redirect:/MainPage"; 
   }

   /*
   //로그인 에러페이지 이동
   @GetMapping("/login-error")
   public String error() {
      return "login/error";
   }
   */
  
   
   //아이디 중복 확인
   @NoLogging//
   @RequestMapping(value="/join/idCheck", method=RequestMethod.GET, produces="application/text; charset=utf8")
   @ResponseBody
   public String idCheck(HttpServletRequest request) throws Exception{
      LOGGER.info("get idCheck");
      int result = 0;
      String user_id = request.getParameter("user_id");
      int idUseYn = securityService.idCheck(user_id);
      
      if(idUseYn > 0) {   //아이디 있을 경우
         result = -1;
      }else {
         result = 0;
      }
      return Integer.toString(result);
	
   }
   
   //닉네임 중복 확인
   @NoLogging//
   @RequestMapping(value="/join/nickCheck", method=RequestMethod.GET, produces="application/text; charset=utf8")
   @ResponseBody
   public String nickCheck(HttpServletRequest request) throws Exception{
      LOGGER.info("get nickCheck");
      int result = 0;
      String nick_name = request.getParameter("nick_name");
      System.out.println(nick_name);
      int nickUseYn = securityService.nickCheck(nick_name);
      System.out.println(nickUseYn);
      
      if(nickUseYn > 0) {   //아이디 있을 경우
         result = -1;
      }else {
         result = 0;
      }
      return Integer.toString(result);
	
   }
   
   
   //회원가입 페이지 이동
   @NoLogging
   @RequestMapping("/join/join")
   public String join(HttpServletRequest request) {
      return "login/join";
   }
   
   //회원가입
   @NoLogging
   @RequestMapping("/join/insert")
   public String setInertMemberInfo(HttpServletRequest req, HttpServletResponse res, MemberInfoVo member) throws Exception{
	   System.out.println(member);
      //memberInfo.setPwd(pass);
      //DB에는 Date타입, vo에는 String 타입, 가져올 땐 다시 TO_CHAR
      
	  String encPassword = passwordEncoder.encode(member.getPwd());
	  member.setPwd(encPassword);
      
      int re = securityService.setInsertMemberInfo(member);
      
      System.out.println(member);
      if( re > 0 ) {
         return "/login/login";
      }else {
         return "/login/join";
      }
   }
   
   
   
}