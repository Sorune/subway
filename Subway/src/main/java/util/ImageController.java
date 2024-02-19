package util;

import javax.servlet.ServletRequest;

import com.oreilly.servlet.MultipartRequest;

public class ImageController {

	String fileName = ""; //파일 명 
	String realFolder = ""; //파일이 저장될 경로 
	int maxSize = 5 * 1024 * 1024; //최대 업로드 될 파일의 크기 5Mb
	String encType = "utf-8"; //인코딩 타입
	
//	MultipartRequest multi = new MultipartRequest(ServletRequest request, ServletResponse encType)
}
