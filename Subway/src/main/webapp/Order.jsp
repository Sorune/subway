<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
</head>
<body>
	<jsp:include page="./menuList.jsp" />
	<div>
		<h4>
			버거를 선택하세요
			</h2>
	</div>
	<table>
		<tr>
			<td colspan="2">단품/세트구분</td>
		</tr>
		<tr>
			<!-- 단품 / 세트 선택 -->
			<td><select>
					<option>단품</option>
					<option>세트</option>
			</select></td>
		</tr>
		<tr>
			<td>빵선택</td>
			<td><select>
					<option></option>
					<option></option>
			</select></td>
		</tr>
		<tr>
			<td>재료선택</td>
			<td><select>
					<option></option>
					<option></option>
			</select></td>
		</tr>
		<tr>
			<td>소스선택</td>
			<td><select>
					<option></option>
					<option></option>
			</select></td>
		</tr>
		<!-- 			<tr>
				<td>사이드메뉴선택1</td> 단품일 경우 보여주지 않음
			</tr>
			<tr>
				<td>사이드메뉴선택2</td> 사이드메뉴1 선택 안할경우 보여주지 않음
			</tr>
			<tr>
				<td>음료선택</td> 
			</tr> -->
		<tr>
			<td>합계</td>
		</tr>
	</table>
</body>
</html>