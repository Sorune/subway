<%@page import="DTO.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="DAO.CartDAO"%>

<%@page import="util.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<%
	Map<String, Object> ol = new HashMap<String, Object>();
	CartDAO dao = new CartDAO();
	List<OrderDTO> cartLists = dao.orderLists(ol); // 주문 목록 리스트

%>
</head>
<body>
	<jsp:include page="./menuList.jsp" />
	
	<div class="p-5 mb-4 bg-body-tertiary rounded-3" align="center" style="width: 75%; height: 150px">
	<h2>장바구니</h2>
	
	<!-- 장바구니 목록 테이블 -->
	<form id="paymenyform" class="mb-3" action="Payment.jsp" method="post">
	
	<table border="1" width="90%">
		<tr>
			<th width="8%" class="class="text-nowrap"">주문시각</th>
			<th width="*" class="text-nowrap">메뉴명</th>
			<th width="30%" class="text-nowrap">수량</th>
			<th width="15%" class="text-nowrap">비고</th>
		</tr>
       		<%-- <img src="./resources/images/" onclick="location.href = '메뉴소개'" style="width: 150; height:150" />	
       		<a  href=./menu.jsp?/menu_name=<%= request.getAttribute("menu_name") %></a> --%>
       		
       		<!-- 카트 내용 -->
       		<%
       		if(cartLists.isEmpty()){
       		%>
       		<tr>
       			<td colspan="4" align="center">
       			장바구니가 비어있습니다.
       			</td>
       		</tr>
       		
       		<%}else{ // 장바구니에 항목이 있을 경우
       			int tmpNo = 0;
       		for(OrderDTO dto : cartLists){
       		%>
       		<tr>
       			<td align="center"><%= session.getAttribute("order_date") %></td>
       			<td align="center">
       			<%= session.getAttribute("menu_name") %>
       			<% if(session.getAttribute("menu_topping_name") != ""){ %>
					<p style="font-size:10px"><%= session.getAttribute("menu_topping_name") %></p>
					<%} %>
       			</td>
				<td align="center"><%= session.getAttribute("menu_qty") %></td>
					
					<!-- 메뉴삭제버튼 -->
				<td><button type="button" onclick="location.href=DeleteCart.jsp"></button>
				<%-- <td align="right"><a href=".DeleteCart.jsp?menu_name=<%= session.getAttribute("menu_name") %>">삭제</a> --%>
			</tr>
			<tr align="center" >
				<td colspan="4" >결제금액 : <%= request.getAttribute("menu_total_price")%>원</td>
			</tr>
			<%
				}
       		}
			%>
	</table>
	<!-- 결제 버튼 -->
	<table border="1" width="90%">
		<tr align="center" >
			<td width="100" colspan="8"><button type="submit" name ="payment">주문하기</button>
			<button type="reset" onclick="location.href='Order.jsp'">이전으로</button></td>
		</tr>
	</table>	
	</form>
	</div>
	
</body>
</html>