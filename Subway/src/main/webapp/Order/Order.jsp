
<%@page import="DTO.CondimentDTO"%>
<%@page import="DAO.OrderDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="DTO.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
OrderDAO dao = new OrderDAO(); // OrderDAO 객체 생성
OrderDTO dto = new OrderDTO(); // OrderDTO 객체 생성
Map<String, Object> param = new HashMap<String, Object>(); // 파라미터 생성용 맵
int totalCount = dao.selectCount(param); // 게시물 수 확인(위에서 만든 파라미터 값을 매개값으로 전달)
List<CondimentDTO> condimentLists = dao.selectList(param); // 게시물 목록 받기
dao.close(); // DB 연결 닫기



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
</head>
<body>
	<jsp:include page="../Main/MenuListBootStrap.jsp" />
	<table>
		<tr>
			<td>상품아이디</td>
			<td>상품 번호</td>
			<td>상품 이름</td>
			<td>상품 가격</td>
			<td>상품 구분</td>
		</tr>
		<!-- 목록의 내용 -->
		<%
		if (condimentLists.isEmpty()) {
			// 게시물이 하나도 없을 때
		%>
		<tr>
			<td colspan="5" align="center">메뉴가 없습니다 관리자를 호출하세요.</td>
		</tr>
		<%
		} else {
		// 게시물이 있을 때 
		int virtualNum = 0; // 화면상에서의 게시물 번호
		for (CondimentDTO condto : condimentLists) {
			virtualNum = totalCount--; // 전체 게시물 수에서 시작해 1씩 감소
		%>
		<tr align="center">
			<!--상품 아이디-->
			<td align="center"><%=condto.getMenuId()%></td>
			<!--상품 번호-->
			<td align="center"><%=condto.getConCount()%></td>
			<!--상품 이름-->
			<td align="center"><%=condto.getConName()%></td>
			<!--상품 가격-->
			<td align="center"><%=condto.getConPrice()%></td>
			<!--상품 종류-->
			<td align="center"><%=condto.getConKind()%></td>
		</tr>
		<%
		}
		}
		%>
	</table>
	<table>
		<tr>
			<td colspan="5">주문하실 메뉴를 선택하세요</td>
		</tr>
		<tr>
			<td>빵선택</td>
			<td>재료선택</td>
			<td>음료선택</td>
			<td>합계금액</td>
		</tr>
		<!-- 선택 가능한 제품을 selectbox로 보여준다 -->
		<%
		if (condimentLists.isEmpty()) {
			// 게시물이 하나도 없을 때
		%>
		<tr>
			<td><select>
					<option>---</option>
			</select></td>
			<td><select>
					<option>---</option>
			</select></td>
			<td><select>
					<option>---</option>
			</select></td>
			<td><span>0원</span></td>
		</tr>
		<%
		} else {
		// 게시물이 있을 때
		%>
		<tr align="center">
			<td colspan="5">
				<form action="" method="post">
					<select> <!-- 빵선택 -->
						<%
						int virtualNum2 = 0; // 화면상에서의 게시물 번호
						for (CondimentDTO condto : condimentLists) {
							virtualNum2 = totalCount--; // 전체 게시물 수에서 시작해 1씩 감소
						%>
						<option>
							<%=condto.getConName()%>
						</option>
						<%
						}
						%>
					</select> 
					<select>  <!-- 재료선택 -->
						<%
						int virtualNum3 = 0; // 화면상에서의 게시물 번호
						for (CondimentDTO condto : condimentLists) {
							virtualNum2 = totalCount--; // 전체 게시물 수에서 시작해 1씩 감소
						%>
						<option>
							<%=condto.getConName()%>
						</option>
						<%
						}
						%>
					</select> 
					<select> <!-- 사이드선택 -->
						<%
						int virtualNum4 = 0; // 화면상에서의 게시물 번호
						for (CondimentDTO condto : condimentLists) {
							virtualNum2 = totalCount--; // 전체 게시물 수에서 시작해 1씩 감소
						%>
						<option>
							<%=condto.getConName()%>
						</option>
						<%
						}
						%>
					</select>
					총금액 : <span></span>
					<input type="submit" value="장바구니담기">
				</form>
			</td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>