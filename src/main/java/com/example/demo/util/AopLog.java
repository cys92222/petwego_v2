package com.example.demo.util;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.demo.dao.ManagerPageDao;
import com.example.demo.vo.Aop_LogVo;

// 민아) 5/19, aoplog 하는중 
@Component	
@Aspect		// AOP어노테이션
public class AopLog {

	// 여기서 dao나 service를 의존해야하는데 어떤걸해야할까
	@Autowired
	private ManagerPageDao mDao;

	public void setmDao(ManagerPageDao mDao) {
		this.mDao = mDao;
	}

	// 컨트롤러에 있는 모든 메소드 포함
	@Pointcut("execution(public *  com.example.demo.controller..*(..))")
	private void loggg() {
	
	}
	
//	@Before (이전) : 어드바이스 타겟 메소드가 호출되기 전에 어드바이스 기능을 수행
//	@After (이후) : 타겟 메소드의 결과에 관계없이(즉 성공, 예외 관계없이) 타겟 메소드가 완료 되면 어드바이스 기능을 수행
//	@AfterReturning (정상적 반환 이후)타겟 메소드가 성공적으로 결과값을 반환 후에 어드바이스 기능을 수행
//	@AfterThrowing (예외 발생 이후) : 타겟 메소드가 수행 중 예외를 던지게 되면 어드바이스 기능을 수행
//	@Around (메소드 실행 전후) : 어드바이스가 타겟 메소드를 감싸서 타겟 메소드 호출전과 후에 어드바이스 기능을 수행
//
	@After("loggg()")
	public void afterLog(JoinPoint j) {

		String methodName = j.getSignature().toShortString();
		HttpServletRequest request = (HttpServletRequest) j.getArgs()[0];

		String url = request.getRequestURI();
		String ip = request.getRemoteAddr();
		String time = new Date().toLocaleString();
		String user_id = "user1";

		Aop_LogVo al = new Aop_LogVo();
		al.setUrl(url);
		al.setIp(ip);
		al.setTime(time);
		al.setUser_id(user_id);

		mDao.insertLog(al);
	}
}
