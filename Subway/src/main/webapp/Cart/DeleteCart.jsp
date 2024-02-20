<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  String menu_name = request.getParameter("menu_name");
if(menu_name != null){
	session.invalidate();
}

response.sendRedirect("Cart.jsp");

%>
    
    
    
    
    
    
    
    
    