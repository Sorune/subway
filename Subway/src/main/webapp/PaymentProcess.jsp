
<%@page import="DAO.CartDAO"%>
<%@page import="DTO.CartDTO"%>
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
CartDTO DTO = new CartDTO();

DTO.setOrder_num(order_num);
DTO.setUser_id(user_id);
DTO.setOrder_kind(order_kind);
DTO.setPay_kind(pay_kind);


//DAO를 통해 DB에 전달
CartDAO dao = new CartDAO();
int result = dao.paymentInfo(DTO);

// JSFuction
if(result != 0){
	System.out.println("결제정보 DB 전송 성공 ");
}else{
	System.out.println("결제정보 DB 전송 실패 ");
}













%>






