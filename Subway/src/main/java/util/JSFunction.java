package util;

import javax.servlet.jsp.JspWriter;

public class JSFunction {

	// 메시지 알림창을 띄운 후 이전 페이지로 돌아간다. 
	public static void alertBack(String msg, JspWriter out) {
		//condiment/conWriteProcess.jsp 사용중
		try {
			String script = ""
						+ "<script>"
						+ "		alert('" + msg + "');"
						+ "		history.back();"
						+ "</script>";
			out.println(script);
		}
		catch(Exception e) {}
	}
	//메시지 알림을 띄운후 명시한 URL로 이동한다.
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script=""	// 삽입할 자바스크립트 코드
					+ "<script>"
					+ "		alert('" + msg + "');"
					+ "		location.href='" + url + "';"
					+ "</script>";
			out.print(script);
			
		}
		catch(Exception e) {}
	}
	
}
