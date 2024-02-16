<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Cart</title>
</head>
<body>

	<h2>장바구니</h2>
	
	<!-- 장바구니 목록 테이블 -->
	<table border="1" width="90%">
		<tr>
			<th width="*">메뉴명</th>
			<th width="8%">수량</th>
			<th width=15%>가격</th>
			<th width=20%></th>
		</tr>
	</table>
	
	<!-- 결제 버튼 -->
	<table border="1" width="90%">
		<tr align="center" >
			<td width="100" colspan="8"><button type="submit" name ="payment" onclick="location.href='./Payment.jsp';">결제하기</button>
			<td align="right"><button type="reset" onclick="location.href='DeleteCart.jsp'">장바구니 비우기</button></td>
		</tr>
	</table>	
	

</body>
</html>