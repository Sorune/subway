package DAO;

import java.sql.SQLException;

import DTO.CartDTO;
import util.JDBConnect;

public class CartDAO extends JDBConnect {

	public void readCart() {
		// 재작 중 다른분들 DTO,DAO를 이용해 만들 예정
	}

	// 결제정보를 모두 담음
	public int paymentInfo(CartDTO dto) {
		int result = 0;
		String sql = "insert into cart values(?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getOrder_num());
			pstmt.setInt(2, dto.getMenu_order());
			pstmt.setString(3, dto.getOrder_kind());
			pstmt.setString(4, dto.getPay_kind());
			pstmt.setString(5, dto.getMenu_name());
			pstmt.setInt(6, dto.getMenu_qty());
			pstmt.setString(7, dto.getMenu_topping()); // int인지 String인지 불확실
			pstmt.setInt(8, dto.getMenu_total_price());
			pstmt.setString(9, dto.getUser_id());
			pstmt.setString(10, dto.getUser_name());
			pstmt.setString(11, dto.getUser_add());
			pstmt.setString(12, dto.getUser_phone());

			// JSFunction용 정수값 반환
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
			System.out.println("");
		}
		return result;

	}

	public void close() {

		try {
			if (rs != null)		rs.close();
			if (stmt != null)	stmt.close();
			if (pstmt != null)	pstmt.close();
			if (con != null)	con.close();
			System.out.println("JDBC Disconnect Sucess");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("close() 예외 발생 : JDBC 드라이버 연결 해제 중 오류 발생");
		}

	}
}
