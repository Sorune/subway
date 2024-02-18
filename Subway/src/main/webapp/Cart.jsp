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
			<th width="*">메뉴명</th>
			<th width="8%">수량</th>
			<th width=15%>가격</th>
		</tr>
	</table>
	
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