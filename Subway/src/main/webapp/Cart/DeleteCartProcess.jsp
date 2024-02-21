<%@page import="java.sql.Date"%>
<%@page import="DAO.CartDAO"%>
<%@page import="DTO.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
/* String order_date = (String)request.getAttribute("order_date");
OrderDTO dto = new OrderDTO();
CartDAO dao = new CartDAO();

dto = dao.selectCart(order_date);
dao.removeCart(dto);
dao.close();

response.sendRedirect("Cart.jsp"); */

// 장바구니 비우기
OrderDTO dto = new OrderDTO();
CartDAO dao = new CartDAO();
dao.removeCart(dto);
session.removeAttribute("cartLists");
response.sendRedirect("Cart.jsp");
%>
    



%>