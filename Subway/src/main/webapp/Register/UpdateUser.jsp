<%@page import="util.JSFunction"%>
<%@page import="usercreate.UserDAO"%>
<%@page import="usercreate.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String user_id = (String) session.getAttribute("user_id").toString();

UserDAO dao = new UserDAO(application);
UserDTO dto = dao.Userselect(user_id);

String id = dto.getUser_Id();
String pass = dto.getUser_Pass();
String phone = dto.getUser_Phone();
String add = dto.getUser_Add();

dao.close();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>