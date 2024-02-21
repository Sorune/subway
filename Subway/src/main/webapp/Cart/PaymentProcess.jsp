
<%@page import="util.JSFunction"%>
<%@page import="DTO.OrderDTO"%>
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
String user_id = request.getParameter("user_id");
// 세션에 저장하여 가져올건지 리퀘스트 영역에서 가져올 것인지 ??
		System.out.print(user_id);
		

String order_date = request.getParameter("order_date");
String date = order_date.replaceAll("-", "");

/* String user_id = (String)session.getAttribute("user_id");
String user_name = (String)session.getAttribute("user_name");
String user_add = (String)session.getAttribute("user_add");
String user_phone = (String)session.getAttribute("user_phone");
 */


//DAO 객체 생성
CartDAO dao = new CartDAO();
String onum = dao.gen(date);

//DTO 객체 생성
CartDTO DTO = new CartDTO();

DTO.setOrder_num(onum);
DTO.setUser_id(user_id);
DTO.setOrder_kind(order_kind);
DTO.setPay_kind(pay_kind);


//DAO를 통해 DB에 전달
int result = dao.paymentInfo(DTO);

// JSFuction
if(result != 0){
	System.out.println("결제정보 DB 전송 성공 ");
	session.removeAttribute("cartLists");
}else{
	System.out.println("결제정보 DB 전송 실패 ");
}

// 결제가 완료되면 menu_order table 데이터 삭제
OrderDTO odto = new OrderDTO();
dao.removeCart(odto);
dao.close();
JSFunction.alertLocation("주문이 완료되었습니다.", "../Main/main.jsp", out);


%>






