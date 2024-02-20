<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.removeAttribute("admin_id");
session.removeAttribute("user_id");


session.invalidate();

response.sendRedirect("LoginForm.jsp");
%>