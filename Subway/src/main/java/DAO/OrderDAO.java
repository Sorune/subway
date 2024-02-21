package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import DTO.CondimentDTO;
import DTO.OrderDTO;
import util.JDBConnect;

public class OrderDAO extends JDBConnect {

	private OrderDTO dto = new OrderDTO();
	private CondimentDTO condto = new CondimentDTO();
	private List<OrderDTO> listMenu = new Vector<OrderDTO>(); // 컨디먼트 테이블에서 받은 정보 메뉴로 출력하기 위한 배열 객체 생성
	private ArrayList<CondimentDAO> condimentDAO = new ArrayList<CondimentDAO>(); // 컨디먼트 테이블에서 받을 정보 담을 배열 객체 생성
	private ArrayList<CondimentDTO> condimentDTO = new ArrayList<CondimentDTO>(); // 컨디먼트 테이블에서 받을 정보 담을 배열 객체 생성

	// 전체 게시물 목록을 반환합니다.
	public List<CondimentDTO> selectList(Map<String, Object> map) {
		List<CondimentDTO> bbs = new Vector<CondimentDTO>(); // 결과(게시물 목록)를 담을 변수

		String sql = "select * from condiment"; // sql condiment테이블 조회

		try {
			stmt = con.createStatement(); // 쿼리문 생성
			rs = stmt.executeQuery(sql); // 쿼리 실행

			while (rs.next()) { // 결과를 순화하며...
				// 한 행(게시물 하나)의 내용을 DTO에 저장
				CondimentDTO dto = new CondimentDTO();

				dto.setConCount(rs.getInt("menu_id"));
				dto.setConKind(rs.getString("con_kind"));
				dto.setConPrice(rs.getInt("con_price"));
				dto.setConName(rs.getString("con_name"));
				dto.setMenuId(rs.getInt("menu_id"));

				bbs.add(dto); // 결과 목록에 저장
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return bbs;
	}

	// 게시물 갯수를 보여주는 메서드
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0; // 결과(게시물 수)를 담을 변수

		// 게시물 수를 얻어오는 쿼리문 작성
		String query = "select count(*) from condiment";
		try {
			stmt = con.createStatement(); // 쿼리문 생성
			rs = stmt.executeQuery(query); // 쿼리 실행
			rs.next(); // 커서를 첫 번째 행으로 이동
			totalCount = rs.getInt(1); // 첫 번째 칼럼 값을 가져옴
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}

	// 카트로 담는 메서드
	public int addToCart(OrderDTO dto) {
		int result = 0;
		String sql = "insert into menu_order(menu_name, menu_qty, menu_total_price, order_userid, order_date) values(?,?,?,?,sysdate)";
		try {
			// jsp에서 받은 주문 내역 table로 보내기
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMenu_name());
			pstmt.setInt(2, dto.getMenu_qty());
			pstmt.setInt(3, dto.getMenu_total_price());
			pstmt.setString(4, dto.getOrder_userid());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			result = 0;
			e.printStackTrace();
			System.out.println("addToCart() 예외 발생");
		}
		return result;

	}

	// 게시물 이름에 맞는 번호를 반환하는 메서드
	public int nameToSearchNumber(String name) {
		int findNumber = 0;
		String query = "select menu_id from condiment where con_name like ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				findNumber = rs.getInt("menu_id");
			}else {
				findNumber = 0;
			}
			
		} catch (Exception e) {
			System.out.println("게시물 번호 찾기 중 오류 발생");
			e.printStackTrace();
		}
		return findNumber;

	}

	// 카트에 담으면 condiment 재고 수량을 줄여주는 메서드
	public void afterInv(int num) {
		// 쿼리문 - 재고수량을 줄여주는 메서드
		String query = "update condiment set con_count=con_count-1 where menu_id=?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.executeQuery();
			System.out.println("재고수량 감소 성공! condiment 테이블을 확인하세요");
		} catch (Exception e) {
			System.out.println("condiment 재고수량 감소 중 예외 발생");
			e.printStackTrace();
		}
	}

	// 탭메뉴를 눌렀을 시 탭의 갯수만큼 테이블 카테고리를 가져오는 메서드
	public int findCount(String kind) {
		int totalcount = 0;
		String query = "select count(*) from condiment where con_kind = ?";

		try {
			pstmt = con.prepareStatement(query); 	// 쿼리문 생성
			pstmt.setString(1, kind);
			rs = pstmt.executeQuery();	// 쿼리 실행
			rs.next();
			totalcount = rs.getInt(1);		// 1번째 값 가져옴

			System.out.println("게시물 카테고리별 가져오기 성공!");
		} catch (Exception e) {
			System.out.println("findCount() 메서드를 실행하는중 예외발생!");
			e.printStackTrace();
		}
		System.out.println(totalcount);
		return totalcount;
	}
	
	// 탭 메뉴를 눌렀을때 해당 투른 탭의 값을 받아 테이블을 구성하는 매서드
	public List<CondimentDTO> selectFindCountCount(String kind) {
		List<CondimentDTO> tabSerchValue = new Vector<CondimentDTO>(); // 결과(게시물 목록)를 담을 변수

		String query = "select * from condiment where con_kind = ? order by menu_id desc"; // sql condiment테이블 조회

		try {
			pstmt = con.prepareStatement(query); // 쿼리문 생성
			pstmt.setString(1, kind);
			rs = pstmt.executeQuery(); // 쿼리 실행

			while (rs.next()) { // 결과를 순화하며...
				// 한 행(게시물 하나)의 내용을 DTO에 저장
				CondimentDTO dto = new CondimentDTO();

				dto.setConCount(rs.getInt("CON_COUNT"));
				dto.setConKind(rs.getString("con_kind"));
				dto.setConPrice(rs.getInt("con_price"));
				dto.setConName(rs.getString("con_name"));
				dto.setMenuId(rs.getInt("menu_id"));

				tabSerchValue.add(dto); // 결과 목록에 저장
			}
		} catch (Exception e) {
			System.out.println("탭 선택 게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return tabSerchValue;
	}
	
	// 메뉴별 아이템을 불러와 숫자를 메뉴아이템(정수)을 가져오는 메서드 (아이템의 메뉴번호를 받아서 숫자로 처리...)
	public int findMenuItemNumber(String kind) {
		int itemCount = 0;
		String query = "select count(*) from condiment where con_kind = ?";

		try {
			pstmt = con.prepareStatement(query); 	// 쿼리문 생성
			pstmt.setString(1, kind);
			rs = pstmt.executeQuery();	// 쿼리 실행
			rs.next();
			itemCount = rs.getInt(1);		// 1번째 값 가져옴

			System.out.println("아이템들의 번호를 가져오기 성공!");
		} catch (Exception e) {
			System.out.println("findMenuItemNumber() 메서드를 실행하는중 예외발생!");
			e.printStackTrace();
		}
		System.out.println(itemCount); // 구분(문자열)이 같은 메뉴의 숫자를 출력확인
		return itemCount;
	}
	
	// 메뉴 버튼 숫자 = 메뉴별 아이템 숫자 
	public List<CondimentDTO> itemNumInsert(String kind) {
		List<CondimentDTO> btnMenuItem = new Vector<CondimentDTO>(); // 결과(게시물 목록)를 담을 변수

		String query = "select * from condiment where con_kind = ? order by menu_id desc"; // sql condiment테이블 조회

		try {
			pstmt = con.prepareStatement(query); // 쿼리문 생성
			pstmt.setString(1, kind);
			rs = pstmt.executeQuery(); // 쿼리 실행

			while (rs.next()) { // 결과를 순화하며...
				// 한 행(게시물 하나)의 내용을 DTO에 저장
				CondimentDTO dto = new CondimentDTO();

				dto.setConCount(rs.getInt("CON_COUNT"));
				dto.setConKind(rs.getString("con_kind"));
				dto.setConPrice(rs.getInt("con_price"));
				dto.setConName(rs.getString("con_name"));
				dto.setMenuId(rs.getInt("menu_id"));

				btnMenuItem.add(dto); // 결과 목록에 저장
			}
		} catch (Exception e) {
			System.out.println("탭 선택 게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return btnMenuItem;
	}
	
}
