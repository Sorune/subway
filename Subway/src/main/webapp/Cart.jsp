<%@page import="util.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<jsp:include page="./menuList.jsp" />
	
	<h2>장바구니</h2>
	
	<!-- 장바구니 목록 테이블 -->
	<form id="paymenyform" class="mb-3" action="PaymentProcess.jsp" method="post">
	
	<table border="1" width="90%">
		<tr>
			<th width="20%">주문번호</th>
			<th width="*">메뉴명</th>
			<th width="8%">수량</th>
			<th width=15%>가격</th>
		</tr>
	</table>
	<%
	JDBConnect dbm = new JDBConnect();
	String sql = "select * from cart";
	dbm.pstmt = dbm.con.prepareStatement(sql);
	dbm.rs = dbm.pstmt.executeQuery();
	while (dbm.rs.next()) {
	
	// 카트 리스트 불러오기
	%>
	<div>
       		<div >	
       			<img src="./resources/images/" onclick="location.href = '메뉴소개'" style="width: 150; height:150" />	
					<p> <%= dbm.rs.getString("order_num") %>
					<p> <%= dbm.rs.getString("menu_name") %>
					<p> <%= dbm.rs.getInt("menu_qty") %>
				<tr align="right" >
					<td colspan="4" ><%= dbm.rs.getInt("menu_total_price") %></td>
				</tr>
		</div>	
	</div>	
	
	<%} %>

	
	<!-- 결제 버튼 -->
	<table border="1" width="90%">
		<tr align="center" >
			<td width="100" colspan="8"><button type="submit" name ="payment">결제하기</button>
			<button type="reset" onclick="location.href='DeleteCart.jsp'">장바구니 비우기</button></td>
		</tr>
	</table>	
	</form>
</body>
</html>