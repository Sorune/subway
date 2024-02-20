package DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import DTO.CondimentDTO;
import DTO.OrderDTO;
import util.JDBConnect;

public class OrderDAO extends JDBConnect{

   private OrderDTO dto = new OrderDTO();
   private List<OrderDTO> listMenu = new Vector<OrderDTO>(); // 컨디먼트 테이블에서 받은 정보 메뉴로 출력하기 위한 배열 객체 생성
   private ArrayList<CondimentDAO> condimentDAO = new ArrayList<CondimentDAO>(); // 컨디먼트 테이블에서 받을 정보 담을 배열 객체 생성
   private ArrayList<CondimentDTO> condimentDTO = new ArrayList<CondimentDTO>(); // 컨디먼트 테이블에서 받을 정보 담을 배열 객체 생성
   
   
   
   
   // 전체 게시물 목록을 반환합니다.
    public List<CondimentDTO> selectList(Map<String, Object> map) { 
        List<CondimentDTO> bbs = new Vector<CondimentDTO>();  // 결과(게시물 목록)를 담을 변수

        String sql = "select * from condiment"; // sql condiment테이블 조회

        try {
            stmt = con.createStatement();   // 쿼리문 생성
            rs = stmt.executeQuery(sql);  // 쿼리 실행

            while (rs.next()) {  // 결과를 순화하며...
                // 한 행(게시물 하나)의 내용을 DTO에 저장
               CondimentDTO dto = new CondimentDTO(); 

                dto.setConCount(rs.getInt("menu_id"));        
                dto.setConKind(rs.getString("con_kind"));      
                dto.setConPrice(rs.getInt("con_price"));  
                dto.setConName(rs.getString("con_name"));  
                dto.setMenuId(rs.getInt("menu_id"));    

                bbs.add(dto);  // 결과 목록에 저장
            }
        } 
        catch (Exception e) {
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
            stmt = con.createStatement();   // 쿼리문 생성
            rs = stmt.executeQuery(query);  // 쿼리 실행
            rs.next();  // 커서를 첫 번째 행으로 이동
            totalCount = rs.getInt(1);  // 첫 번째 칼럼 값을 가져옴
        }
        catch (Exception e) {
            System.out.println("게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        }

        return totalCount; 
    }
   
    // 제품을 선택하면 금액을 보여주는 쿼리문 작성
    public int selectMenuByPrice() {

       int price = 0;
       try {
         String query = "select *, CON_PRICE * CON_COUNT from condiment;";
         stmt = con.createStatement();
         rs = stmt.executeQuery(query);  // 쿼리 실행
         rs.next();  // 커서를 첫 번째 행으로 이동
         price = rs.getInt(1);  // 첫 번째 칼럼 값을 가져옴
         return price;
      } catch (Exception e) {
         e.printStackTrace();
      }
      return price;
    }
    
    // 카트로 담는 메서드
   public int addToCart(OrderDTO dto) {
      int result = 0;
      String sql = "insert into menu_order values(?,?,?,?,?)";

      try {
         // jsp에서 받은 주문 내역 table로 보내기
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, dto.getMenu_name());
         pstmt.setString(2, dto.getOrder_userid());
         pstmt.setInt(3, dto.getMenu_qty());
         pstmt.setInt(4, dto.getMenu_total_price());
         //pstmt.setString(5, dto.getOrder_date());
      
         result = pstmt.executeUpdate();

      } catch (Exception e) {
         result = 0;
         e.printStackTrace();
         System.out.println("paymentInfo() 예외 발생");
      }
      return result;

   }
    
}