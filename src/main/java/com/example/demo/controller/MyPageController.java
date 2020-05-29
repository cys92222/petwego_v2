package com.example.demo.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.LoginMapperDao;
import com.example.demo.service.AlarmService;
import com.example.demo.service.MypageService;
import com.example.demo.service.SecurityService;
import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.vo.AlarmVo;
import com.example.demo.vo.Animal_infoVo;
import com.example.demo.vo.MemberInfoVo;
import com.example.demo.vo.PaymentVo;
import com.example.demo.vo.Pic_BoardVo;

//민아) 5/19, HttpServletRequest request 이랑 @NoLogging 처리 
//수인) 5/25 만약에 오류날 경우 각 메소드에 session 처리 추가할 계획
@Controller
public class MyPageController {
	
	@Autowired
	LoginMapperDao loginMapperDao;
	
	@Autowired
	SecurityService securityService;
	
	@Autowired
	MypageService mypageservice;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	 
	@Autowired
	AlarmService alarmSerivce;
	
	//마이페이지 메인
	@RequestMapping("/mypage/mypage")
	public ModelAndView mypage(HttpServletRequest request) {

		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/main");
//		mav.setViewName("/mypage/MypageMain");

		//아이디 임의로 설정
		m.setUser_id(m.getUser_id());
		//내 정보
		mav.addObject("myinfo", mypageservice.select_myinfo(m));
		
		//내가 작성한 글
		mav.addObject("myboard", mypageservice.search_my_board(m));
		
		//내가 작성한 sns글
		mav.addObject("mysns", mypageservice.search_my_sns(m));
		
		//내가 작성한 sns글파일
		mav.addObject("mysnspic", mypageservice.search_my_sns_file(m));
		
		//내가 쓴 함께가요
		mav.addObject("mytogether", mypageservice.search_my_together(m));
//		System.out.println(mypageservice.select_myinfo(m));
		
		//반려동물 리스트
		mav.addObject("animal_list", mypageservice.search_my_animal(m));
//		System.out.println("동물리스트" + mypageservice.search_my_animal(m));

		
		AlarmVo alarm = new AlarmVo();
		alarm.setUser_id(m.getUser_id());
		
		//신청알림수
		mav.addObject("search_insert_together_count", alarmSerivce.search_insert_together_count(alarm));
//		System.out.println("search_insert_together_count" + alarmSerivce.search_insert_together_count(alarm));
		
		//신청알림 있는지 조회
		mav.addObject("search_insert_together_alarm", alarmSerivce.search_insert_together_alarm(alarm));
//		System.out.println("search_insert_together_alarm" + alarmSerivce.search_insert_together_alarm(alarm));
		
		//취소알림수
		mav.addObject("search_cancle_together_count", alarmSerivce.search_cancle_together_count(alarm));
//		System.out.println("search_cancle_together_count" + alarmSerivce.search_cancle_together_count(alarm));
		
		//취소알림 있는지 조회
		mav.addObject("search_cancle_together_alarm", alarmSerivce.search_cancle_together_alarm(alarm));
//		System.out.println("search_cancle_together_alarm" + alarmSerivce.search_cancle_together_alarm(alarm));
		
		//자유게시판 댓글 등록 알람 조회
		mav.addObject("search_insert_board_alarm", alarmSerivce.search_insert_board_alarm(alarm));
//		System.out.println("search_insert_board_alarm" + alarmSerivce.search_insert_board_alarm(alarm));
		
		//자유게시판 댓글 삭제 알람 조회
		mav.addObject("search_cancle_board_alarm", alarmSerivce.search_cancle_board_alarm(alarm));
//		System.out.println("search_cancle_board_alarm" + alarmSerivce.search_cancle_board_alarm(alarm));
		
		//자유게시판 댓글 등록  수
		mav.addObject("search_insert_board_alarm_count", alarmSerivce.search_insert_board_alarm_count(alarm));
//		System.out.println("search_insert_board_alarm_count" + alarmSerivce.search_insert_board_alarm_count(alarm));
		
		//자유게시판  댓글 취소 수
		mav.addObject("search_cancle_board_alarm_count", alarmSerivce.search_cancle_board_alarm_count(alarm));
//		System.out.println("search_cancle_board_alarm_count" + alarmSerivce.search_cancle_board_alarm_count(alarm));
		
		//결제 정보
		mav.addObject("search_pay", mypageservice.search_pay(m));
		
		return mav;
		
	}
	
	//함께가요 신청 알람 확인
	@RequestMapping("/mypage/check_alarm_in")
	public String check_alarm_in(HttpServletRequest request, AlarmVo a) {
			alarmSerivce.check_alarm_in(a);
		return "redirect:/mypage/mypage";
	}
	
	//함께가요 취소 알람 확인
	@RequestMapping("/mypage/check_alarm_cancle")
	public String check_alarm_cancle(HttpServletRequest request, AlarmVo a) {
			alarmSerivce.check_alarm_cancle(a);
		return "redirect:/mypage/mypage";
	}

	
	//반려동물 관리폼
	@RequestMapping("/mypage/animal_info_up_form")
	public ModelAndView update_animal_info_form(HttpServletRequest request,MemberInfoVo m) {
//		System.out.println(m.getUser_id());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/animal_info");
		
		//나의 반려동물 리스트
		mav.addObject("animal_list", mypageservice.search_my_animal(m));
		mav.addObject("user_id", mypageservice.select_myinfo(m));
//		System.out.println("동물 리스트 "+mypageservice.search_my_animal(m));
		
		return mav;
	}
	
	//반려동물 등록
	@RequestMapping(value = "/mypage/animal_info_up", method = RequestMethod.POST)
	public String update_animal_info(HttpServletRequest request,Animal_infoVo a, /*MemberInfoVo m,*/ MultipartFile aa) {
		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());
		
//		m.setUser_id(user.getUser_id());
		
		//		System.out.println("반려동물 등록 컨트롤러");
		String str = aa.getOriginalFilename();
//		System.out.println("업로드 파일 이름"+str);
		
		String path = request.getRealPath("/img/animalImg");
		System.out.println(path);
		
		if(str != null && !str.equals("")) {
			System.out.println("사진  첨부함");
			System.out.println("업로드 파일 이름"+str);
			a.setPet_pic(str);
			
			try {
				byte []data = aa.getBytes();
				FileOutputStream fos = new FileOutputStream(path+"/"+str);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
		}else {
			System.out.println("사진 첨부 안함");
			a.setPet_pic("사진없음");
		}
//		System.out.println("동물등록");
		
//		System.out.println(a.getPet_date());
		
		
		
		ModelAndView mav = new ModelAndView();
		mypageservice.insert_pet(a);
		//나의 반려동물 리스트
		mav.addObject("animal_list", mypageservice.search_my_animal(m));
		
		return "redirect:/mypage/animal_info_up_form?user_id="+m.getUser_id();
	}
	
/* 영수 원본	
	//사람 정보 수정 폼
	@NoLogging
	@RequestMapping("/mypage/people_info_up_form")
	public ModelAndView people_info_up_form() {
		ModelAndView mav = new ModelAndView();
		MemberInfoVo m = new MemberInfoVo();
		m.setUser_id("user1");
		mav.setViewName("/mypage/people_info");
		mav.addObject("m", mypageservice.select_myinfo(m));
		return mav;
	}
	
	//사람 정보 수정
	@RequestMapping(value = "/mypage/people_info_up", method = RequestMethod.POST)
	public String people_info_up(HttpServletRequest request,MemberInfoVo m, MultipartFile aa) {
		String str = aa.getOriginalFilename();
		String o_str = m.getFname();
		String path = request.getRealPath("/img/peopleImg");
		System.out.println(path);
		
		if(str != null && !str.equals("")) {
			System.out.println("사진첨부함");
			m.setFname(str);
			
			try {
				byte []data = aa.getBytes();
				FileOutputStream fos = new FileOutputStream(path+"/"+str);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
			int re = -1;
			re = mypageservice.update_myinfo(m);
			
			if(re > 0 && str != null && !str.equals("") && o_str != null && !o_str.equals("")) {
				File file = new File(path + "/" + o_str);
				file.delete();
			}
			
		}else {
			System.out.println("사진첨부안함");
			m.setFname("사진없음");
		}
		
		mypageservice.update_myinfo(m);
		
		//수정 끝나고 리스트 컨트롤러 호출
		return "redirect:/mypage/mypage";
	}
*/
	//수인 수정버전 문제있으면 다시 바꾸기
	//사람 정보 수정 폼
	@NoLogging
	@RequestMapping("/mypage/people_info_up_form")
	public ModelAndView people_info_up_form(HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();		
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());
		
		ModelAndView mav = new ModelAndView();
		m.setUser_id(user.getUser_id());
		mav.setViewName("/mypage/people_info");
		mav.addObject("m", mypageservice.select_myinfo(m));
		return mav;
	}
	
	//사람 정보 수정
	@RequestMapping(value = "/mypage/people_info_up", method = RequestMethod.POST)
	public String people_info_up(HttpServletRequest request, MultipartFile aa, MemberInfoVo m) {
		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo memberInfo = (MemberInfoVo) authentication.getPrincipal();

		String user_id = m.getUser_id();

		memberInfo = loginMapperDao.getSelectMemberInfo(user_id);
		memberInfo.setUser_id(user_id);

		String str = aa.getOriginalFilename();
		String o_str = m.getFname();
		String path = request.getRealPath("/img/peopleImg");
		System.out.println(path);
		
		if(str != null && !str.equals("")) {
			System.out.println("사진첨부함");
			m.setFname(str);
			
			try {
				byte []data = aa.getBytes();
				FileOutputStream fos = new FileOutputStream(path+"/"+str);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
			int re = -1;
						
			re = mypageservice.update_myinfo(m);
			
			if(re > 0 && str != null && !str.equals("") && o_str != null && !o_str.equals("")) {
				File file = new File(path + "/" + o_str);
				file.delete();
			}
			
		}else {
			System.out.println("사진첨부안함");
			m.setFname("사진없음");
		}
		
		mypageservice.update_myinfo(m);
//		session.invalidate();
		//수정 끝나고 리스트 컨트롤러 호출
		return "redirect:/mypage/mypage";
	}
	//근데!!!!!!!!!!!!정보를 수정하고 나면 다시 로그인 페이지로 감....왜지? 안 가게 어떻게 하지? 
	
	//내가 작성한 글
	@RequestMapping("/mypage/board_list")
	public ModelAndView board_list(HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();	
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());
		
		m.setUser_id(user.getUser_id());
		
		ModelAndView mav = new ModelAndView();
//		MemberInfoVo m = new MemberInfoVo();
//		m.setUser_id("user1");
		m.setUser_id(user.getUser_id());
		mav.setViewName("/mypage/board_list");
		mav.addObject("myboard", mypageservice.search_my_board(m));
		return mav;
	}
	
	//내 결제 내역
	@RequestMapping("/mypage/pay_list")
	public ModelAndView pay_list(HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());

		m.setUser_id(user.getUser_id());
		
		ModelAndView mav = new ModelAndView();
//		MemberInfoVo m = new MemberInfoVo();
//		m.setUser_id("user1");
		m.setUser_id(m.getUser_id());
		mav.setViewName("/mypage/pay_list");
		mav.addObject("search_pay", mypageservice.search_pay(m));
		return mav;
	}
	
	//내가 쓴 함께가요 리스트
	@RequestMapping("/mypage/together_list")
	public ModelAndView together_list(HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());
		
		ModelAndView mav = new ModelAndView();
//		MemberInfoVo m = new MemberInfoVo();
//		m.setUser_id(user.getUser_id());
		m.setUser_id(m.getUser_id());
		mav.setViewName("/mypage/together_list");
		mav.addObject("mytogether", mypageservice.search_my_together(m));
		return mav;
	}
	
	//내가 쓴 sns리스트
	@RequestMapping("/mypage/sns_list")
	public ModelAndView sns_list(HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo m = (MemberInfoVo) authentication.getPrincipal();
		
		m.setUser_id(m.getUser_id());
		ModelAndView mav = new ModelAndView();
//		MemberInfoVo m = new MemberInfoVo();
//		m.setUser_id("user1");
		m.setUser_id(m.getUser_id());
		mav.setViewName("/mypage/sns_list");
		mav.addObject("mysns", mypageservice.search_my_sns(m));
		return mav;
	}
	
	//회원탈퇴
	@RequestMapping("/mypage/delete_member")
	@ResponseBody
	public String delete_member(HttpServletRequest request,MemberInfoVo m) {
		System.out.println("탈퇴할  id"+m.getUser_id());
		mypageservice.delete_myinfo(m);
//		return "redirect:/MainPage";
		return "/MainPage";
	}

	/* 영수 원본
	//비밀번호 변경
	@NoLogging
	@RequestMapping("/mypage/update_pwd")
	@ResponseBody
	public String update_pwd(MemberInfoVo m,String o_pwd,String o_user_id) {
//		System.out.println("AAAAAAAAAAAAAAAAA");
		m.setPwd(o_pwd);
		m.setUser_id(o_user_id);
		mypageservice.update_pwd(m);
		return "ok";
	}
	*/
	
	//비밀번호 변경 - 아래 메소드 2개 : 수인 수정 버전
	//패스워드 체크
	@NoLogging
	@RequestMapping(value="/join/passCheck", method=RequestMethod.POST)
	@ResponseBody
	public boolean passCheck(MemberInfoVo vo) throws Exception {
		String user_id = vo.getUser_id();
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user_id);
		boolean pwdChk = passwordEncoder.matches(vo.getPwd(), m.getPwd());
		return pwdChk;
		
	}
	
	//비밀번호 변경
	@NoLogging
	@RequestMapping("/mypage/update_pwd")
	@ResponseBody
	public String update_pwd(HttpServletRequest request, HttpServletResponse response, MemberInfoVo m, String o_pwd,String o_user_id) {
		//세션에 저장된 정보 받기위해서 세션 설정
		HttpSession session = request.getSession();
		//시큐리티가 권한 검사
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    //sever가 보내준 vo 받아와서 vo에 실려있는 권한 받아오기
	    MemberInfoVo memberInfo = (MemberInfoVo) authentication.getPrincipal();

	    //vo에 실려온 user_id를 mapper로 보내서 이 아이디가 가진 나머지 정보들 가져오기
		memberInfo = loginMapperDao.getSelectMemberInfo(o_user_id);
		//이 정보를 다시 자바가 갖고 있는 vo에 담아주기
		memberInfo.setUser_id(o_user_id);
		
		//vo에 실려온 '기존 비밀번호' 받아오기
		String pwd = memberInfo.getPwd();
		//사용자가 입력한 '변경할 비밀번호' 받아오기
		String pwd2 = m.getPwd2();
		
		//o_pwd = 원래 사용자 비밀번호, pwd = (비밀번호 확인을 위해) 사용자가 입력한 비밀번호 
		//기존 비밀번호를 확인하는 작업
		boolean pwdCheck = passwordEncoder.matches(o_pwd, pwd);
		//비밀번호가 일치하면 사용자가 입력해준 '바꿀 비밀번호'를 암호화하기
		if(pwdCheck==true) {
			 String encPassword = passwordEncoder.encode(pwd2);
			 //암호화된 비밀번호를 vo에 담기
			 memberInfo.setPwd2(encPassword);			
		}else {
			//비밀번호 일치하지 않으면 수정페이지로 다시 리턴
			return "redirect:/mypage/mypage";	//여긴 어디로 보낼지 고민!
		}
		
		//새로 바꿀 비밀번호를 vo에 담아놨으면 그걸로 다시 mapper에 보내서 update 실행하기 
		//(그렇게 하면 기존 비밀번호가 새로 바뀜) 
		mypageservice.update_pwd(memberInfo);	 
		return "ok";
	}

	
	
	//반려동물 정보 수정폼
	@NoLogging
	@RequestMapping("/mypage/update_animal_form")
	public ModelAndView update_animal_form(Animal_infoVo a) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/animal_update");
		mav.addObject("animal_info", mypageservice.detail_animal(a));
		
		return mav;
	}
	

	//반려동물 정보 수정
	@RequestMapping(value = "/mypage/update_animal", method = RequestMethod.POST)
	public String update_animal(HttpServletRequest request,Animal_infoVo a, MultipartFile aa) {
		System.out.println(aa);
		
		String path = request.getRealPath("/img/animalImg");
		System.out.println(path);
		
		String str = aa.getOriginalFilename();
		String o_str = a.getPet_pic();
		
		if(aa.getOriginalFilename() != null && !"".equals(aa.getOriginalFilename())) {
			System.out.println("사진 첨부함");
			a.setPet_pic(aa.getOriginalFilename());
			
			try {
				byte []data = aa.getBytes();
				FileOutputStream fos = new FileOutputStream(path+"/"+str);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
			int re = -1;
			re = mypageservice.update_animal(a);
			
			if(re > 0 && str != null && !str.equals("") && o_str != null && !o_str.equals("")) {
				File file = new File(path + "/" + o_str);
				file.delete();
			}
		}else {
			System.out.println("사진 첨부안함");
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/mypage/animal_info");
		mypageservice.update_animal(a);
		
		return "redirect:/mypage/animal_info_up_form?user_id="+a.getUser_id();
	}
	
	//반려동물 정보 삭제
	@RequestMapping(value = "/mypage/delete_animal", method = RequestMethod.GET)
	public String delete_animal(HttpServletRequest request,Animal_infoVo a) {
		mypageservice.delete_animal(a);
		
		return "redirect:/mypage/animal_info_up_form?user_id="+a.getUser_id();
	}
	
	//동물사진 삭제
	@RequestMapping(value = "/mypage/delete_animal_pic", method = RequestMethod.GET)
	public String delete_animal_pic(HttpServletRequest request, Animal_infoVo a) {
		String path = request.getRealPath("/img/animalImg");
		
		String o_str = a.getPet_pic();
		File file = new File(path + "/" + o_str);
		file.delete();
		
		mypageservice.delete_animal_pic(a);
		return "redirect:/mypage/animal_info_up_form?user_id="+a.getUser_id();
	}
	
	//사람사진 삭제
	@RequestMapping(value = "/mypage/delete_people_pic", method = RequestMethod.GET)
	public String delete_people_pic(HttpServletRequest request /*, MemberInfoVo m*/) {
		String path = request.getRealPath("/img/peopleImg");
		
		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());

		m.setUser_id(user.getUser_id());
		
		String o_str = m.getFname();
		System.out.println(o_str);
		File file = new File(path + "/" + o_str);
		file.delete();
		
		mypageservice.delete_people_pic(m);
		return "redirect:/mypage/mypage?user_id"+m.getUser_id();
	}
	
	//결제 상세
	@RequestMapping("/mypage/detail_pay")
	public ModelAndView detail_pay(HttpServletRequest request,PaymentVo p) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("detail_pay", mypageservice.detail_pay(p));
		mav.setViewName("/mypage/detail_pay");
		
		return mav;
	}
}
