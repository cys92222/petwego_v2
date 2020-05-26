package com.example.demo.util;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import com.example.demo.dao.LoginMapperDao;
import com.example.demo.dao.ManagerPageDao;
import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.vo.Aop_LogVo;
import com.example.demo.vo.MemberInfoVo;

// 민아) 5/19, aopLog
@Component	
@Aspect				// AOP어노테이션
public class AopLog {

	// 여기서 dao나 service를 의존해야하는데 어떤걸해야할까 고민 일단 되긴하네 
	@Autowired
	private ManagerPageDao mDao;

	public void setmDao(ManagerPageDao mDao) {
		this.mDao = mDao;
	}
	
	@Autowired
	LoginMapperDao loginMapperDao;


	
	// 컨트롤러에 있는 모든 public 메소드 포함 && @NoLogging이 붙은 메소드는 제외해줘 
	@Pointcut("execution(public *  com.example.demo.controller.*.*(..)) "
			      + " && !@annotation(com.example.demo.util.AopLog.NoLogging)")
	private void loggg() {
		//import com.example.demo.util.AopLog.NoLogging;
	}
	
	@Target({ ElementType.METHOD})
	@Retention(RetentionPolicy.RUNTIME)
	public @interface NoLogging {
		// 컨트롤러에있는 특정 메소드는 포함하지 않도록 하려고 만든 메소드 
		// https://cfdf.tistory.com/21
		// https://yonguri.tistory.com/106
	}
	
	@After("loggg()") //5월26일 수정
	public void afterLog(JoinPoint j) {

		String methodName = j.getSignature().toShortString();
		HttpServletRequest request = (HttpServletRequest) j.getArgs()[0];

		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    if(authentication!=null) {	//if문 추가 (로그인하지 않은 사용자는 id값 및 권한을 null을 주므로 오류가 발생! 그래서 권한 확인하는 행부터 다 if문에 넣었음
	    	MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();
			MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());

			String url = request.getRequestURI();
			String ip = request.getRemoteAddr();
			String time = new Date().toLocaleString();
			String user_id = m.getUser_id();

			Aop_LogVo al = new Aop_LogVo();
			al.setUrl(url);
			al.setIp(ip);
			al.setTime(time);
			al.setUser_id(user_id);

			mDao.insertLog(al);
	    }
	    
	}
}
