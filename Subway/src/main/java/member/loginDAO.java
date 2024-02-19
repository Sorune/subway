package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;

import util.JDBConnect;

public class loginDAO extends JDBConnect {

	memberDTO dto = new memberDTO();
	

	public loginDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	} // JDBC를 연결하기 위한 생성자 연동 완료
	
	
	public loginDAO(ServletContext application) {
		String id = application.getInitParameter("admin_id");
		String pw = application.getInitParameter("admin_pw");

		if (id != null && id.equals("ezManager")) {
		if(pw != null && pw.equals("manage1")) {
			System.out.println("야호");
			
		}// 일치시 관리자 메서드 로 이동
		

		System.out.println(id);
		System.out.println(pw);
		}else{
			memberlogin(id, pw);
		}
			
	}// dto에 있는 로그인 멤버와 일치값 확인 로그인 메서드 사용

	public memberDTO memberlogin(String id, String pass) {
		String sql = "select * from member where user_id=? and user_pass=?";
		memberDTO dto = new memberDTO();
		try {
		
	    pstmt = con.prepareStatement(sql);
	    pstmt.setString(1, id);
	    pstmt.setString(2, pass);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			dto.setUser_id(rs.getString("user_id"));
			System.out.println(rs.getString("user_id"));
			dto.setUser_pass(rs.getString("user_pass"));

			System.out.println(rs.getString("user_pass"));
			}
		} catch (Exception e) {
		System.out.println("메서드 오류 dao 확인");
		e.printStackTrace();
		}
		return dto;
		
}
	



}// class 종료
	
