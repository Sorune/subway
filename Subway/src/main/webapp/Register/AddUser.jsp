<%@page import="usercreate.UserDAO"%>
<%@page import="usercreate.UserDTO"%>
<%@page import="util.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Insert title here</title></head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
		
	UserDTO dto = new UserDTO();	
	String id = request.getParameter("id");
	String pass = request.getParameter("password");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String add = request.getParameter("add");
	
	dto.setUser_Id(id);
	dto.setUser_Pass(pass);
	dto.setUser_Name(name);
	dto.setUser_Phone(phone);
	dto.setUser_Add(add);
	
	UserDAO dao = new UserDAO(application);
	int result = dao.createUser(dto);
	if (result > 0){
		%>
			<script>
			alert('가입되었습니다.');
			location.href="../Login/LoginForm.jsp";
			</script>
		<%
		
	}
	%>

</body>
</html>