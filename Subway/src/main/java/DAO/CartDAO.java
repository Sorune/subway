package DAO;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import DTO.CartDTO;
import DTO.OrderDTO;
import util.JDBConnect;

public class CartDAO extends JDBConnect {
	
			
	public List<OrderDTO> orderLists(Map<String, Object> map) {
		List<OrderDTO> ol = new Vector<OrderDTO>(); // 결과 담을 것
		String sql = "select * from menu_order";
		return ol;
	}
	
	public String gen(String date) { // yyyyMMdd로 포맷한 String이 넘어옴
		String addNum =""; //date + 숫자
		
		String dateTmp = date.substring(4,8);	// 20240219
		int order_num = Integer.parseInt(date) + 1; // date 정로 변환
		addNum += dateTmp;
		String tmp = Integer.toString(order_num);

		int tmplen = tmp.length();
		if (tmplen == 1) {
			tmp = "000"+tmp;
		} else if(tmplen == 2) {
			tmp = "00"+tmp;
		} else if(tmplen ==3) {
			tmp = "0"+tmp;
		}
		
		addNum += tmp;
		
		return addNum;
	}

	public int readCart(CartDTO dto) { // UserDTO dto
		//카트에 표시될 내용들 메뉴 수량 가격 총액 - 메뉴테이블 가격이 없음 유저정보 필요 x
		// 재작 중 다른분들 DTO,DAO를 이용해 만들 예정
		int result = 0;
		String sql = "select * from Cart where user_id=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getUser_id());
			pstmt.executeQuery();
			return result;
			
			
		} catch (SQLException e) {
			System.out.println("readCart() 예외 발생 : 장바구니 목록을 불러오는 중 예외발생");
			e.printStackTrace();
		}
		return result;
		
		
	}

	// 결제정보를 모두 담음
	public int paymentInfo(CartDTO dto) {
		int result = 0;
		String sql = "insert into cart values(?,?,?,?)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getOrder_num());
			pstmt.setString(2, dto.getUser_id());
			pstmt.setString(3, dto.getOrder_kind());
			pstmt.setString(4, dto.getPay_kind());
		

			// JSFunction용 정수값 반환
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
			System.out.println("paymentInfo() 예외 발생");
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
