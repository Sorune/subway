<%@page import="util.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<%
	String menu_name = session.getMe();
%>

</head>
<body>
	<jsp:include page="./menuList.jsp" />
	
	<h2>장바구니</h2>
	
	<!-- 장바구니 목록 테이블 -->
	<form id="paymenyform" class="mb-3" action="PaymentProcess.jsp" method="post">
	
	<table border="1" width="90%">
		<tr>
			<th width="5%">No</th>
			<th width="*">메뉴명</th>
			<th width="30%">수량</th>
			<th width="15%">비고</th>
		</tr>
       		<%-- <img src="./resources/images/" onclick="location.href = '메뉴소개'" style="width: 150; height:150" />	
       		<a  href=./menu.jsp?/menu_name=<%= request.getAttribute("menu_name") %></a> --%>
       		<tr>
       			<td><%= session.getAttribute("order_date") %></td>
       			<td><%= session.getAttribute("menu_name") %></td>
				<td><%= session.getAttribute("menu_qty") %></td>
				<td align="right"><a href=".delteCart.jsp?menu_name=<%= session.getAttribute("menu_name") %>">삭제</a>
			</tr>
			<tr align="center" >
				<td colspan="4" >결제금액 : <%= request.getAttribute("menu_total_price")%>원</td>
			</tr>
	</table>
	<!-- 결제 버튼 -->
	<table border="1" width="90%">
		<tr align="center" >
			<td width="100" colspan="8"><button type="submit" name ="payment">결제하기</button>
			<button type="reset" onclick="location.href='Order.jsp'">이전으로</button></td>
		</tr>
	</table>	
	</form>
	
</body>
</html>