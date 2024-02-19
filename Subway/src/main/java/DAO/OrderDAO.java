package DAO;

import java.util.ArrayList;

import DTO.OrderDTO;
import util.JDBConnect;

public class OrderDAO extends JDBConnect{

	private ArrayList<OrderDTO> listMenu = new ArrayList<OrderDTO>(); // 컨디먼트 테이블에서 받은 정보 메뉴로 출력하기 위한 배열 객체 생성
	//private ArrayList<CondimentDTO> condiment = new ArrayList<CondimentDTO>(); // 컨디먼트 테이블에서 받을 정보 담을 배열 객체 생성
	
	// 전체 제품을 보여주는 메서드(메뉴에서 보여줄 값 꺼내올 용)
	public int allItems() {
		int result = 0;
		try {
			String sql = "select * from condiment"; // sql condiment테이블 조회
			pstmt = null;
			rs = null;
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				rs.getInt("MENU_ID");
				rs.getString("CON_NAME");
				rs.getInt("CON_PRICE");
				rs.getInt("CON_COUNT");
				rs.getString("CON_KIND");
			}
			if(rs != null) { // 코드 수정 전 (가져온 값 배열에 추가)
				listMenu.add(null);
				listMenu.add(null);
				listMenu.add(null);
				listMenu.add(null);
				listMenu.add(null);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
