<%@page import="DTO.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
OrderDTO dto = (OrderDTO)session.getAttribute(request.getParameter("order"));
  String menu_name = request.getParameter("menu_name");
	session.invalidate();

response.sendRedirect("Cart.jsp");

%>
    