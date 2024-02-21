<%@page import="DAO.CondimentDAO"%>
<%@page import="DTO.CondimentDTO"%>
<%@page import="DAO.OrderDAO"%>
<%@page import="DTO.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); // DB 전달시 한글 깨짐 현상 방지

	// DTO 객체 생성(CondimentDTO)
	CondimentDTO cdto = new CondimentDTO();
	//DTO 객체 생성(OrderDTO)
	OrderDTO dto = new OrderDTO();
	// DAO 객체 생성(CondimentDAO)
	CondimentDAO cdao = new CondimentDAO(application);
	// DAO 객체 생성(OrderDAO)
	OrderDAO dao = new OrderDAO();	
	
	// ------------------------ 재고수량 감소 프로세스 ------------------------
	
	// 리퀘스트 영역의 값 가져오기 (Order.jsp의 form의 input값 가져오기 == 재고에서 뺄 수량 가져오기) / 일련번호 받기
	String menu_name2 = request.getParameter("menu_name");
	out.println(menu_name2); // 가져온 값 확인
	// 리퀘스트 영역에서 받은 이름으로 번호를 찾고 그 결과를 숫자로 돌려준다.
	int searchResult = dao.nameToSearchNumber(menu_name2);
	out.print(searchResult); // 결과값 출력해보기 
	// JSFuction - 번호찾기 입력 결과
	if(searchResult != 0){
		System.out.println("번호찾기 DB 전송 성공 ");
	}else{
		System.out.println("번호찾기 DB 전송 실패 ");
	}
	// OrderDAO에서 CondimentDTO로 테이블에 재고 수량을 삭제하는 메서드를 실행한다.	
	dao.afterInv(searchResult);
	
	// ------------------------ 주문처리 프로세스 ------------------------
	// 리퀘스트 영역의 값 가져오기 (Order.jsp의 form의 input값 가져오기)
	String menu_name = request.getParameter("menu_name");
	int menu_qty = Integer.parseInt(request.getParameter("menu_qty"));
	int menu_total_price = Integer.parseInt(request.getParameter("menu_total_price"));
	String order_userid = request.getParameter("order_userid");

	dto.setMenu_name(menu_name);
	dto.setMenu_qty(menu_qty);
	dto.setMenu_total_price(menu_total_price);
	dto.setOrder_userid(order_userid);
	
	//DAO를 통해 DB에 전달
	int result = dao.addToCart(dto);

	// JSFuction - 장바구니 입력 결과
	if(result != 0){
		System.out.println("주문정보 DB 전송 성공 ");
	}else{
		System.out.println("주문정보 DB 전송 실패 ");
	}

%>