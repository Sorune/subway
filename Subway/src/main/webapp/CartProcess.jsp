<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DAO.CartDAO"%>
<%@page import="DTO.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//서준씨가 장바구니 추가 버튼을 누르면 이동하여 값을 받음

// 멤버, 메뉴 세션 영역의 값을 불러옴
String order_num = request.getParameter("order_num");
String user_id =request.getParameter("user_id"); 	// 나중에 int로 변환
String order_kind = request.getParameter("order_kind");
String pay_kind = request.getParameter("pay_kind");

// 세션에 저장하여 가져올건지 리퀘스트 영역에서 가져올 것인지 ??

String menu_name = request.getParameter("menu_name");
String menu_qty = request.getParameter("menu_qty"); 	// 나중에 int로 변환
String menu_topping = request.getParameter("menu_topping");
String menu_tatal_price = request.getParameter("menu_total_price"); 	// 나중에 int로 변환

String id = (String)session.getAttribute("user_id");
String name = (String)session.getAttribute("user_name");
String add = (String)session.getAttribute("user_add");
String phone = (String)session.getAttribute("user_phone");



// 주문번호 생성
CartDAO dao = new CartDAO();
String order_date = request.getParameter("order_date");


//DTO 객체 생성
CartDTO dto = new CartDTO();

dto.setOrder_num(order_num);
dto.setOrder_kind(order_kind);
dto.setPay_kind(pay_kind);
dto.setUser_id(user_id);


//DAO를 통해 DB에 전달
int result = dao.paymentInfo(dto);

// JSFuction
if(result != 0){
	System.out.println("결제정보 DB 전송 성공 ");
}else{
	System.out.println("결제정보 DB 전송 실패 ");
}


%>






