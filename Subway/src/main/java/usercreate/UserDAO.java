package usercreate;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;

import util.JDBConnect;

public class UserDAO extends JDBConnect {
	
	public UserDAO(ServletContext application) {
		super(application);
	}

   public UserDTO Userselect(String user_id) {
	      UserDTO dto = new UserDTO();
	      
	      try {
	         String query = "SELECT * FROM member WHERE user_id=?";
	         
	         pstmt = con.prepareStatement(query);
	         pstmt.setString(1, user_id);
	         
	         rs = pstmt.executeQuery();
	         
	         if (rs.next()) {
	            
	            dto.setUser_Id(rs.getString("user_id"));
	            dto.setUser_Pass(rs.getString("user_pass"));
	            dto.setUser_Phone(rs.getString("user_phone"));
	            dto.setUser_Add(rs.getString("user_add"));
	         }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return dto;
	   }
	   
	@SuppressWarnings("null")
	public void createUser(UserDTO dto) {
		
		try {
			String sql = " INSERT INTO member(user_id, user_pass, user_name, user_phone, user_add) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getUser_Id());
			pstmt.setString(2, dto.getUser_Pass());
			pstmt.setString(3, dto.getUser_Name());
			pstmt.setString(4, dto.getUser_Phone());
			pstmt.setString(5, dto.getUser_Add());
			
			int n = pstmt.executeUpdate();

			if (n > 0) {
				System.out.println(dto.getUser_Id() + "님 가입 완료되었습니다.");
				con.commit();
			} else {
				System.out.println("가입에 실패하였습니다.");
			}
		} catch (SQLException e) {
			System.out.println("createUser()메서드 예외 발생");
			e.printStackTrace();
		}
		
	}
	public int checkId(String id) {
		int result = 0;
		
		try {
			String query = " INSERT INTO User_Id FROM member WHERE User_Id=? ";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = 1; // 존재할 경우
			} else {
				result = 0; // 없을 경우
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}

