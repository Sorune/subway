package DAO;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import DTO.CartDTO;
import DTO.OrderDTO;
import util.JDBConnect;

public class CartDAO extends JDBConnect {
	
	public List<CartDTO> orderLists() {
		List<CartDTO> ol = new Vector<CartDTO>(); // 결과 담을 것

		String sql = "select * from cart";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				CartDTO dto = new CartDTO();
				dto.setOrder_kind(sql);
				ol.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("orderLists() 오더정보를 불러오는중 오류발생");
			e.printStackTrace();
		}
		
		
		return ol;
	}
			
	public List<OrderDTO> orderLists(Map<String, Object> map) {
		List<OrderDTO> ol = new Vector<OrderDTO>(); // 결과 담을 것

		String sql = "select * from menu_order";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				dto.setMenu_name(rs.getString(1));
				dto.setMenu_qty(rs.getInt(2));
				dto.setMenu_total_price(rs.getInt(3));
				dto.setOrder_userid(rs.getString(4));
				dto.setOrder_date(rs.getDate(5));
				ol.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("orderLists() 오더정보를 불러오는중 오류발생");
			e.printStackTrace();
		}
		
		
		return ol;
	}
	
	public String gen(String date) { // yyyyMMdd로 포맷한 String이 넘어옴
		String addNum =""; //date + 숫자
		
		java.util.Date tmpDate = new java.util.Date();
		try {
			tmpDate = new SimpleDateFormat("yyyyMMdd").parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int num = 0;
		List<CartDTO> lists = orderLists();
		for (CartDTO dto : lists) {
			String tmp = dto.getOrder_num();
			tmp = tmp.substring(4,8);
			int oNum = Integer.parseInt(tmp);
			if (num <= oNum) num = oNum;
		}
		num++;
		String changeNum = new SimpleDateFormat("yyyyMMdd").format(tmpDate);
		String dateTmp = changeNum.substring(4,8);	// 20240219
		addNum += dateTmp;
		String tmp = Integer.toString(num);

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
	public void removeCart(OrderDTO dto) {
        
        try {
           String sql = "delete from menu_order";
           pstmt= con.prepareStatement(sql);
           pstmt.executeUpdate();
        } catch (SQLException e) {
           System.out.println("removeCart() 예외 발생");
           e.printStackTrace();
        }
        
     }
}
