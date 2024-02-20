<%@page import="DTO.CondimentDTO"%>
<%@page import="DAO.CondimentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int menuId = Integer.parseInt(request.getParameter("menu_id") );

CondimentDAO dao = new CondimentDAO(application);	// DAO 생성
//dao.updateVisitCount(menuId);						// 조회수 증가
CondimentDTO dto = dao.selectView(menuId);			// 게시물 가져오기
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script>
function deltePost(){
	var confirmed = confirm("정말로 삭제하겠습니까?");
	if(confirmed){
		var form = document.writeFrm;		// 이름(name)이 "writeFrm"인 폼 선택
		form.method = "post";				// 전송 방식
		form.action = "conDeleteProcess.jsp";// 전송 경로
		form.submit();						// 폼값 전송
	}
}
</script>
</head>
<body>
<jsp:include page="./conHeadLink.jsp"/>
<h2>재고 게시판 - 상세 보기(View)</h2>
<form name="writeForm">
	<input type="hidden" name="menu_id" value="<%= menuId %>"/>
	<table border="1" width="90%">
		<tr>
			<td>메뉴번호</td>
			<td ><%= dto.getMenuId() %></td>
			<td>제품이름</td>
			<td><%=dto.getConName()%></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><%= dto.getConPrice() %></td>
			<td>수량</td>
			<td><%= dto.getConCount() %></td>
		</tr>
		<tr>
			<td>종류</td>
			<td colspan="3"><%= dto.getConKind() %></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<button type="button"
						onclick="location.href='conEdit.jsp?menu_id=<%= dto.getMenuId() %>';">
				수정하기</button>
				<button type="button" onclick="deletePost();">삭제하기</button>
				<button type="button" onclick="location.href='conList.jsp';">
				목록 보기</button>
			</td>
		</tr>
	
	</table>




</form>


</body>
</html>