package usercreate;

import javax.servlet.jsp.JspWriter;

public class IdCheck {
	
	public static void alerBack(String msg, String Id, JspWriter out) {
		
		try {
			String script = ""
						  + "<script>"
						  + "	  alert('" + msg + "');"
						  + "  	  history.back();"
						  + "</script>";
			out.println(script);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
