<%@page import="dao.CartDAO"%>
<%@page import="dto.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

// 멤버, 메뉴 세션 영역의 값을 불러옴
String order_num = request.getParameter("order_num");
String menu_order =request.getParameter("menu_drder"); 	// 나중에 int로 변환
String order_kind = request.getParameter("order_kind");
String pay_kind = request.getParameter("pay_kind");

// 세션에 저장하여 가져올건지 리퀘스트 영역에서 가져올 것인지 ??

String menu_name = request.getParameter("menu_name");
String menu_qty = request.getParameter("menu_qty"); 	// 나중에 int로 변환
String menu_topping = request.getParameter("menu_topping");
String menu_tatal_price = request.getParameter("menu_total_price"); 	// 나중에 int로 변환

String user_id = (String)session.getAttribute("user_id");
String user_name = (String)session.getAttribute("user_name");
String user_add = (String)session.getAttribute("user_add");
String user_phone = (String)session.getAttribute("user_phone");


//DTO 객체 생성
CartDTO dto = new CartDTO();

dto.setOrder_num(order_num);
dto.setMenu_order(Integer.parseInt(menu_order));
dto.setOrder_kind(order_kind);
dto.setPay_kind(pay_kind);

dto.setMenu_name(menu_name);
dto.setMenu_qty(Integer.parseInt(menu_qty));
dto.setMenu_topping(menu_topping);
dto.setMenu_total_price(Integer.parseInt(menu_tatal_price));

dto.setUser_id(user_id);
dto.setUser_name(user_name);
dto.setUser_add(user_add);
dto.setUser_phone(user_phone);


//DAO를 통해 DB에 전달
CartDAO dao = new CartDAO();
int result = dao.paymentInfo(dto);

// JSFuction
if(result != 0){
	System.out.println("결제정보 DB 전송 성공 ");
}else{
	System.out.println("결제정보 DB 전송 실패 ");
}













%>






