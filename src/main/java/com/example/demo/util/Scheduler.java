package com.example.demo.util;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

//민아) 5/11 , 스케쥴러 테스트 

@Component
public class Scheduler {
	
	@Scheduled(cron = "* * * * * *")
	public void SchedulerService() {
//		System.out.println("스케쥴러 동작함");
	}
}
