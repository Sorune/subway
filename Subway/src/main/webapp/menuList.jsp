<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Insert title here</title>

<table border="1" width="90%">
	<tr>
		<td>
		<% if(session.getAttribute("UserId")==null) {%>
		<a href="./LoginForm.jsp">로그인</a>
		<%} else { %>
		<a href="./LoginForm.jsp">로그아웃</a>
		<%} %>
		</td>
		<td><a href="./Register.jsp">회원가입</a></td>
		<td><a href="./Order.jsp">주문하기</a></td>
		<td><a href="./ManageCon.jsp">재고관리</a></td>
		<td><a href="./Cart.jsp">장바구니</a></td>
	</tr>
</table>


</head>
<body>
</body>
</html>