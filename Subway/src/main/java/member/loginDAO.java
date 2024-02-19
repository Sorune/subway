package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;

import util.JDBConnect;

public class loginDAO extends JDBConnect {

	JDBConnect jdb = new JDBConnect();
	PreparedStatement pstmt = null;
	Connection conn = null;
	ResultSet rs = null;
	memberDTO dto = new memberDTO();
	

	public loginDAO() {
		super();
	} // loginDAO 종료
	
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
		memberlogin(dto);
	}
		
	}// dto에 있는 로그인 멤버와 일치값 확인 로그인 메서드 사용
	

	public  void memberlogin(memberDTO dto) {
		String sql = "select * from member where id=? and pass=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			if(rs.next()) {
				dto.setUser_id(rs.getString("user_name"));
				dto.setUser_pass(rs.getString("user_pass"));
	
			}
					
		} catch (Exception e) {
		System.out.println("getmemberdto() 메서드 오류 dao 확인");
		e.getStackTrace();
		}
		
		
	}



}// class 종료