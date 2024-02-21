package DAO;



import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import DTO.CondimentDTO;
import util.JDBConnect;

public class CondimentDAO extends JDBConnect{
	//Condiment 테이블에 db연결 및 curd 처리를 담당
	
	public CondimentDAO(ServletContext application) {
		super(application);
	}
	
	public void readCondiment() throws SQLException {
		//0. 임시 리스트
		try {
			
			stmt = con.createStatement(); // 쿼리문 생성용 준비작업
			rs = stmt.executeQuery("select * from condiment order by menu_id asc");
			
			System.out.println("id넘버 / 이름 \t/ 가격 \t/ 재고 수량 \t/ 종류");
			System.out.println("--------------------------------------------");
			while (rs.next()) { // rs.next() 다음행이 있으면 true, 없으면 false
				System.out.print(rs.getInt("menu_id") + "\t"); // id넘버
				System.out.print(rs.getString("con_name") + "\t"); // 이름
				System.out.print(rs.getInt("con_price") + "\t"); // 가격
				System.out.print(rs.getInt("con_count")+ "\t"); // 재고 수량
				System.out.println(rs.getString("con_kind")); // 종류
			}

		}
		finally { // 항상실행 블럭
			rs.close(); // resultset 닫기
			con.close(); // 연결 닫기
		} // try문 입력 종료
		
	}
	public void createCondimentDTO(int menuId, String conName, int conPrice, int conCount, String conkind) {
		//1. 제품 추가 	id넘버, 이름 가격, 재고 수량 , 종류
		
		
		
		
	}
	public void insertCondimentDAO(String conName, int conPrice, int conCount, String conKind) throws Exception {
		//메뉴추가
		int n; // 결과값이 정수로 나옴(1개의 행이 입력되었습니다.)

		try { // 일반 실행문
			
			
			//String sql = "insert into condiment(menu_id, con_name, con_price, con_count, con_kind) values(con_seq.NEXTVAL, ?, ?, ?, ? ) ";
			String sql = "insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, ? ,? ,? ,? ) ";
			
			
			pstmt = con.prepareStatement(sql); // 동적쿼리문 생성
			pstmt.setString(1, conName); // 첫번째 ?에 들어갈 값 삽입
			pstmt.setInt(2, conPrice); // 두번째 ?
			pstmt.setInt(3, conCount); // 세번째 ?
			pstmt.setString(4, conKind);
			
			n = pstmt.executeUpdate(); // 쿼리문 실행 후 결과를 int n에 넣는다.
			if (n > 0) {
				System.out.println(n + "메뉴를 추가하였습니다.\n");
				con.commit();
			}

		} catch (SQLException e) { // 클래스가 없을 때 예외처리
			System.out.println("쿼리문이 정상적이지 않습니다.");
			con.rollback(); // 정상문이 아닐때 되돌리는
		} finally {
			pstmt.close();
			con.close();

		}

	} // insertCondimentDAO END
	
	public void updateCondimentDAO(int menuId, String conName, int conPrice, int conCount, String conKind) throws SQLException{
		//제품정보수정
		
		int n; // 결과값이 정수로 나옴
		try {
			
			con = DriverManager.getConnection("jdbc:oracle:thin:@sorune.asuscomm.com:15210:xe", "subway", "subway");
			//con선언 안하면 pstmt is noll 오류생김
			
			
			String sql = "UPDATE condiment SET con_name = ? , con_price= ? , con_count = ? , con_kind = ? WHERE menu_id =? ";//menuId는 수정안함
			pstmt = con.prepareStatement(sql); // 동적쿼리문 생성
			pstmt.setString(1, conName);
			pstmt.setInt(2, conPrice);
			pstmt.setInt(3, conCount);
			pstmt.setString(4, conKind);
			pstmt.setInt(5, menuId);
			
					
			n = pstmt.executeUpdate();	// 쿼리문 실행 후 결과를 int n에 넣는다.
			
			if(n > 0) {
				System.out.println(n + "행 데이터를 수정하였습니다. \n");
				con.commit();
			}
			
		}
		catch(Exception e) {
			System.out.println("쿼리문이 정상적이지 않습니다.");
			con.rollback();
			
		}finally {
			pstmt.close();
			con.close();
		}
	}
	
	
	public boolean isFindCondiment(int menu_id) throws Exception {
		//제품번호 검색
		try {
			stmt = con.createStatement(); // 쿼리문 생성용 준비작업
			rs = stmt.executeQuery("select * from condiment order by menu_id asc");
			// 쿼리 실행 후 resultset표에 저장

			System.out.println("id넘버 / 이름 \t/ 가격 \t/ 재고 수량 \t/ 종류");
			System.out.println("--------------------------------------------");
			while (rs.next()) { // rs.next() 다음행이 있으면 true, 없으면 false
				if(rs.getInt("menu_id") == (menu_id)) {
				
				System.out.print(rs.getInt("menu_id") + "\t");
				System.out.print(rs.getString("con_name") + "\t");
				System.out.print(rs.getInt("con_price") + "\t");
				System.out.print(rs.getInt("con_count") + "\t\t");
				System.out.println(rs.getString("con_kind"));
				
				return true;
				}
			}

		} finally { // 항상실행 블럭
			rs.close(); // resultset 닫기
			stmt.close(); // 쿼리문 닫기
			con.close(); // 연결 닫기
		} // try문 입력 종료
		System.out.println("검색결과가 없습니다.");
		return false;
		
	}
	
	public void deleteCondimentDTO(int menu_id, boolean isDelete) {
		// 해당 메뉴 삭제	isDelete(삭제하시겠습니까?)

		try {
			if (isDelete == true) {
				String sql = "delete from condiment where menu_id = 36 ";
				pstmt = con.prepareStatement(sql);
				//pstmt.setInt(1, menu_id);
				int n = pstmt.executeUpdate();
				
				if(n > 0) {
					System.out.println(menu_id + "번 메뉴가 삭제되었습니다.");
					con.commit();
				}
			}
		} catch (Exception e) {
			System.out.println("deleteUser() 오류 발생");
			e.printStackTrace();
		}
		finally {
			close();
		}

	}
	
	public int selectCount(Map<String, Object> map) {
	//게시판용
		int totalCount=0;
		//게시물 수를 얻어오는 쿼리문 작성
		String query = "SELECT COUNT(*) FROM condiment";
		if(map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement(); 	// 쿼리문 생성
			rs = stmt.executeQuery(query);	// 쿼리 실행
			rs.next();
			totalCount = rs.getInt(1);	// 첫번째 컬럼 값을 가져옴
		} catch(Exception e) {
			System.out.println("게시물 수를 구하는 중 예외발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	public List<CondimentDTO> selectList(Map<String, Object> map){
		List<CondimentDTO> bbs = new Vector<CondimentDTO>();
		//결과(게시물 목록)을 담을 변수

		String query = "SELECT * FROM CONDIMENT ";
		if(map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
			query += " ORDER BY menu_id DESC " ; // 내림차순 정렬
			
			try {
				stmt = con.createStatement();//쿼리문 생성
				rs = stmt.executeQuery(query);	//쿼리문 실행
				
				while(rs.next()) {	//결과를 순차적으로 반복 출력
					// 한 행(게시물 하나)의 내용을 DTO로 보냄
					CondimentDTO dto = new CondimentDTO(); //dto객체 생성
					
					dto.setMenuId(rs.getInt("menu_id"));
					dto.setConName(rs.getString("con_name"));
					dto.setConPrice(rs.getInt("con_price"));
					dto.setConCount(rs.getInt("con_count"));
					dto.setConKind(rs.getString("con_kind"));
					
					bbs.add(dto);
				}
			}catch(Exception e) {
				System.out.println("게시물 조회중 예외 발생");
				e.printStackTrace();
			}	
			return bbs;	//쿼리 결과를 list 컬렉션을 jsp 반환
	}
	public List<CondimentDTO> selectListPage(Map<String, Object> map){
		//selectListPage, selectList 별도존재
		List<CondimentDTO> bbs = new Vector<CondimentDTO>();
		
		// 쿼리문 템플릿
		String query = "SELECT * FROM ( SELECT Tb.*, ROWNUM rNum FROM ( SELECT * FROM condiment ";
		
		// 검색 조건 추가
		if(map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		
		query += "		ORDER BY menu_id DESC ) Tb ) WHERE rNum BETWEEN ? AND ?";
	
		try {
			// 쿼리문 완성
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, map.get("start").toString());
			pstmt.setString(2,  map.get("end").toString());
			// 쿼리문 실행
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// 한 행(게시물 하나)의 데이터를 DTO에 저장
				CondimentDTO dto = new CondimentDTO();
				dto.setMenuId(rs.getInt("menu_id"));
				dto.setConName(rs.getString("con_name"));
				dto.setConPrice(rs.getInt("con_price"));
				dto.setConCount(rs.getInt("con_count"));
				dto.setConKind(rs.getString("con_kind"));
				
				// 반환할 결과 목록에 게시물 추가
				bbs.add(dto);
			}
			
		}catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		// 목록 반환
		return bbs;
	}
	
	
	
	// 게시글 데이터를 받아 DB에 추가
	public int insertWrite(CondimentDTO dto) {
		//게시판
		int result =0;
		
		try {
			// INSERT 쿼리문 작성
			String query = "INSERT INTO condiment ( "
					+ " menu_id, con_name, con_price, con_count, con_kind) "
					+ " VALUES ( "
					+ " con_seq.NEXTVAL, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(query);	// 동적 쿼리
			pstmt.setString(1, dto.getConName());
			pstmt.setInt(2, dto.getConPrice());
			pstmt.setInt(3, dto.getConCount());
			pstmt.setString(4, dto.getConKind());
			
			result = pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	//지정한 게시물을 찾아 내용을 반환하는 메서드
	
	public CondimentDTO selectView(int menuId) {
		CondimentDTO dto = new CondimentDTO();

		//쿼리 생성
		String query = "select * from condiment where menu_id = ? ";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, menuId);
			rs = pstmt.executeQuery();//쿼리문 실행에 rs저장
			
			//결과처리
			if(rs.next()) {// ResultSet 객체로 변환된 행을 next()확인
				dto.setMenuId(rs.getInt(1));
				dto.setConName(rs.getString("con_name"));
				dto.setConPrice(rs.getInt("con_price"));
				dto.setConCount(rs.getInt("con_count"));
				dto.setConKind(rs.getString("con_kind"));
				
			}
			
		} catch(Exception e) {
			System.out.println("게시물 상세보기 예외발생");
			e.printStackTrace();
		}
		return dto;
	}

	public int updateEdit(CondimentDTO dto) {//게시물 수정용
		int result = 0;
		
		try {//쿼리문 작성
			String sql = "UPDATE condiment SET con_name = ? , con_price= ? , con_count = ? , con_kind = ? WHERE menu_id =? ";//menuId는 수정안함
			pstmt = con.prepareStatement(sql); // 동적쿼리문 생성
			pstmt.setString(1, dto.getConName());
			pstmt.setInt(2, dto.getConPrice());
			pstmt.setInt(3, dto.getConCount());
			pstmt.setString(4, dto.getConKind());
			pstmt.setInt(5, dto.getMenuId());
			//쿼리문 실행
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("게시물 수정중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	public int deletePost(CondimentDTO dto) {
		int result =0;
		try {
			// 쿼리문 템플릿
			String query = "DELETE FROM condiment WHERE menu_id =? ";
			
			// 쿼리문 완성
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,  dto.getMenuId());
			
			// 쿼리문 실행
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}
