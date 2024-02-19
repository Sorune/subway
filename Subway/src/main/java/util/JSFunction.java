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
}
