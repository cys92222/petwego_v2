package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.concurrent.ConcurrentTaskScheduler;
// 민아) 5/11, 스케쥴러 추가 

@SpringBootApplication
@EnableScheduling
public class Test03Application {
	public static void main(String[] args) {
		SpringApplication.run(Test03Application.class, args);
	}
	
	// bean에 설정, 스케쥴러 사용을 위해 
    @Bean
    public TaskScheduler taskScheduler() {
        // 단일 스레드 구현 
        return new ConcurrentTaskScheduler(); 
    }
}
	