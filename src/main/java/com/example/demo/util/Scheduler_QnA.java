package com.example.demo.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.QnAService;
import com.example.demo.vo.QnAVo;

@Controller
public class Scheduler_QnA {

	@Autowired
	private QnAService QnAService;

	public void setQnAService(QnAService qnAService) {
		QnAService = qnAService;
	}

	// qna
	 @Scheduled(cron = "0 0 4 * * * ")
	//@RequestMapping(value = "/admin/test")
	public void QnaDeleteImg() {
		System.out.println("QnA 파일 지우는 스케쥴러 동작함");
		List<QnAVo> realFile = QnAService.fime_name();

		File path = new File("C:\\summernote_image_QnA"); // c드라이브에 파일이 저장되는곳 경로
		File[] ImgList = path.listFiles(); // 위 경로에 있는 이미지파일들을 imgList에 담음
		System.out.println("ImgList" + ImgList);

		ArrayList<String> fnameList = new ArrayList<String>(); // ImgList(경로에있는 이미지파일들)의 이름만 담음

		for (int i = 0; i < ImgList.length; i++) {
			fnameList.add(ImgList[i].getName());
//			System.out.println("fnameList" + fnameList);
//			System.out.println(ImgList[i].getName());
//				151a052a-3f50-46fa-805a-aa567ecea91a.png
		}

		for (int j = 0; j < fnameList.size(); j++) {
			String allFname = fnameList.get(j); // 경로(폴더)에 저장된 파일 중 j 번째 파일이름
//			System.out.println("allFname" + allFname);
			// System.out.println("폴더에 있는 파일 : " + allFname);
			// 폴더에 있는 파일 : 151a052a-3f50-46fa-805a-aa567ecea91a.png
			// System.out.println("리얼파일: " + realFile);
			for (QnAVo q : realFile) {
				String realUuid = q.getInq_file();
//				System.out.println("realUuid" + realUuid);
				// System.out.println("리얼uuid: "+ realFname);
				// 리얼uuid: 151a052a-3f50-46fa-805a-aa567ecea91a.png
				if (!allFname.equals(realUuid)) {
					ImgList[j].delete();
				}
			}
		}

	}
}
